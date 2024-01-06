const express = require("express");
const User = require("../models/user");
const  bcryptjs= require('bcryptjs')
const jwt = require('jsonwebtoken');
const auth = require("../middleware/auth");

const authRouter = express.Router();


authRouter.post('/api/signup',async(req,res)=>{

    try{
    const {name,email,password}=req.body;

    const existingUser=await User.findOne({email});//check database if there match with email
    if(existingUser){
        return res.status(400).json({msg:'Userr with same email already exists!'});
    }
    const hashedPassword= await bcryptjs.hash(password,8);
    let user=new User({
        email,
        password:hashedPassword,
        name

    });
    user =await user.save();
    res.json(user);
}
catch(e){
    res.status(500).json({error:e.message});
}


    //get the data from client
    //Post that data in database
    //return that data to the user

})
//Sign in route




authRouter.post("/api/signin",async(req,res)=>{
    try{
        const {email,password}=req.body;
        const user = await User.findOne({email});

        if(!user){
            return res.status(400).json({msg:"user with this email doesn't exist!"});
        }
       const isMatch= await bcryptjs.compare(password,user.password);//user er input hash password er shate database signup user er hash pass check
        if(!isMatch){
            return res.status(400).json({msg:"incorrect password!"});
        }
       const token= jwt.sign({id:user._id}, "passwordKey");
       res.json({token,...user._doc});

    }
    catch(e){
         res.status(500).json({error:e.message});
    }
})


authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

//get  user data
//here auth is middleware , which make sure i am authorised
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  });

module.exports = authRouter;