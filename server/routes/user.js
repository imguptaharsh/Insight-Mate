const express = require('express');
const userRouter = express.Router();
const auth = require("../middlewares/auth.js");
const User = require("../models/user.js");

//Add the item to cart
userRouter.post("/api/add-history", auth, async (req, res) => {
    try {
     const {id} = req.body;
     let user = await User.findById(req.user);
        
     user.messages.push({msg});

     user = await user.save();
     res.json(user);
    } catch (e) {
        console.log("error");
      res.status(500).json({ error: e.message });
    }
  });


  //Delete the item to cart
userRouter.delete("/api/remove-history/:id", auth, async (req, res) => {
    try {
     let user = await User.findById(req.user);
     user.history.delete;   
     user = await user.save();
     res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });