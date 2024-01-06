const express= require('express');
const productRouter = express.Router();
const { Product } = require("../models/product");
const auth = require('../middleware/auth');



productRouter.get("/api/products/",auth, async (req, res) => {
    try {
          const products = await Product.find({category:req.query.category});
           //we are getting all the products from the database
          res.json(products);
    }
    catch (e) {
      res.status(500).json({ error: e.message });
    }

})

//create a get request to search products and get them


productRouter.get("/api/products/search/:name",auth, async (req, res) => {
  try {
        const products = await Product.find({
          name:{$regex: req.params.name,$options:"i"}
        }
        // : name er position e ja asbhe tai params.name er value //regex is use for search
        );
         //we are getting all the products from the database
        res.json(products);
  }
  catch (e) {
    res.status(500).json({ error: e.message });
  }

})


//create a post  request route to rate the product
productRouter.post('/api/rate-products',auth,async(req,res) => {

  try{
    const {id,rating}= req.body;// 'id' is the product id
    let product = await Product.findById(id);

    // jei product ke rating dise oita kujhe ber korse
    // oi product er rating section ta ekta array of ratingScema object
    //oi ratingScema theke amader user er jei rating dise takhe kujhe ber korse 

    for(let i=0; i<product.rating.length; i++){
      if(product.rating[i].userId == req.user ){//req.user are accesible for auth middlware
          product.rating.splice(i,1);//from which index we want to remove , and how many index--->splice(i,1)
          break;
      }
    }
    const ratingScema = {
      userId:req.user,
      rating:rating
    }

    product.rating.push(ratingScema);
    product = await product.save();
    res.json(product);


  }
  catch(e){

  }
})

productRouter.get('/api/deal-of-day', auth , async (req, res) => {
  try{
      let products = await Product.find({});

      //now we will sort all the products base on their their rating

      products=products.sort((a,b)=>{

        let aSum  = 0;
        let bSum  = 0;

        for( let i =0;i<a.rating.length;i++){
          aSum += a.rating[i].rating;
        }
        for( let i =0;i<b.rating.length;i++){
          bSum += b.rating[i].rating;
        }
        return aSum<bSum ? -1: 1;
        //bsum>asum is true then it should pushed in the top
      })
      res.json(products[0]);

  }

  catch(e){
    res.status(500).json({ error: e.message });

  }

  // [11,2,22,1].sort((a,b)=>a-b);




})




module.exports = productRouter;