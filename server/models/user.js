const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name:{
        type:String,
        require:true,
        trim:true
    },
    email:{
        type:String,
        require:true,
        trim:true,
        validate:{
            validator:(val)=>{
                const re =   /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
               return val.match(re);//check email is valid or not

            },
            message:"please enter a valid email address"//execuit when email return false

        }
    },
    password:{
        type:String,
        require:true,
        // validate:{
        //     validator:(val)=>{
        //        return val.length>6;//check email is valid or not

        //     },
        //     message:"please enter a long password"//execuit when email return false

        // }
    },
    address:{
        type:String,
        default:'',
    },
    type:{
        type:String,
        default:'user'

    }

})
const User = mongoose.model("User",userSchema);
module.exports = User;