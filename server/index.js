const express= require('express');
const mongoose = require("mongoose");
const authRouter = require("./routes/auth.js");


// init type
const db="mongodb+srv://chatbotgpt:gptbot@cluster0.i8vr6tx.mongodb.net/?retryWrites=true&w=majority";


//INIT
const PORT = process.env.PORT || 3000;
const app = express();
// midleware
// Client -> middlware -> Server -> Client
app.use(express.json());
app.use(authRouter);

// Connections
mongoose
    .connect(db)
    .then(()=>{     
        console.log("Connection Successful With Database")
    })
    .catch((e)=>{
        console.log(e);
    });

    
app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`connected at port ${PORT}`);
});
     