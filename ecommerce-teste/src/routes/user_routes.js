import express from "express";
import userModel from "../models/user_models.js";
import bcrypt from "bcrypt";

const myRouter = express.Router();

myRouter.get("/:userid", async function (req, res) {
  const userid = req.params.userid;
  const foundUser = await userModel.findOne({ userid: userid });
  if (!foundUser) {
    res.json({ success: false, error: "Usuario não encontrado" });
    return;
  }
  res.json({ success: true, data: foundUser });
});
myRouter.post("/createaccount", async function (req, res) {
  const userData = req.body;

  const password = userData.password;
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(password, salt);

  userData.password = hashedPassword;

  const newUser = new userModel(userData);
  await newUser.save((err) => {
    if (err) {
      res.json({ success: false, error: err });
      return;
    }
    res.json({ success: true, data: newUser });
  });
});

myRouter.post("/login", async function (req, res) {
  const email = req.body.email;
  const password = req.body.password;

  const foundUser = await userModel.findOne({ email: email });
  if (!foundUser) {
    res.json({ success: false, error: "Usuario não encontrado" });
    return;
  }
  const correctPassword = await bcrypt.compare(password, foundUser.password);
  if (!correctPassword) {
    res.json({ sucess: false, error: "Senha Incorreta" });
    return;
  }
  res.json({ sucess: true, data: foundUser });
});

export { myRouter };
