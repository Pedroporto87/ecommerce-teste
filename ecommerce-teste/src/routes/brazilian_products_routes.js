import express from "express";
import { brazilianProductsModel } from "../models/brazilian_products_models.js";

const myBrazilianRouter = express.Router();

myBrazilianRouter.post("/", async function (req, res) {
  const productData = req.body;
  const newProduct = new brazilianProductsModel(productData);
  await newProduct.save(function (err) {
    if (err) {
      res.json({ success: false, error: err });
      return;
    }
    res.json({ success: true, data: newProduct });
  });
});

export { myBrazilianRouter };