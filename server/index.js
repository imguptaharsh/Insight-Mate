const express= require('express');
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");


// init type
const PORT=3000;
const app=express();
const db="mongodb+srv://chatbotgpt:gbtbot@cluster0.i8vr6tx.mongodb.net/?retryWrites=true&w=majority";
// midleware
// Client -> middlware -> Server -> Client
app.use(express.json());
app.use(authRouter);

// Connections
mongoose
    .connect(db)
    .then(()=>{     
        console.log("connection Successful")
    })
    .catch((e)=>{
        console.log(e);
    });

    
app.listen(PORT,"0.0.0.0", ()=>{
    console.log('connected at port '+ PORT);
});
     