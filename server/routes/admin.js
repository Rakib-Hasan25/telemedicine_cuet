const express= require('express');
const adminRouter = express.Router();
const admin = require('../middleware/admin');
const { Product } = require("../models/product");





//api to add product to database 
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
      const { name, description, images, quantity, price, category } = req.body;// admin sent it

                  //create a new product model using Product schema
            //by using let we can change it , but for const we can't change it
     
      let product = new Product({
        name,
        description,
        images,
        quantity,
        price,
        category,
      });
                  // now we save it to the database
      product = await product.save();
                  //now we return the api response to the client side
      res.json(product);
    } 
    
    catch (e) {
      res.status(500).json({ error: e.message });
    }
  });



  //get all your products
  adminRouter.get("/admin/get-products",admin, async (req, res) => {
      try {
            const products = await Product.find({});
             //we are getting all the products from the database
            res.json(products);
      }
      catch (e) {
        res.status(500).json({ error: e.message });
      }

  })


  //Delete the product from database
  adminRouter.post("/admin/delete-product",admin, async (req, res)=>{

    try{
        const {id}= req.body;
        let products = await Product.findByIdAndDelete(id);
        res.json(products);

    }
    catch(e){
      res.status(500).json({ error: e.message });
    }


  })

module.exports =adminRouter;