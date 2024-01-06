//IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require('mongoose')

//IMPORTS FROM OTHER FILES
const authRouter =require('./routes/auth');
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");




//INIT

const PORT = 3907;
const DB =
"mongodb+srv://rakib:rakib705788@cluster0.ibiipiy.mongodb.net/?retryWrites=true&w=majority"

const app = express();


//MIDDLEWARE
app.use(express.json())
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);





//connections

mongoose.connect(DB).then(()=>{

    console.log('connection Successful');

}).catch((e)=>{
    console.log(e);
})


//http://<yourIpaddess>/hello-world

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at port ${PORT}`);
})