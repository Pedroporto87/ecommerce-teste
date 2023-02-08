import express from "express";
import mongoose from "mongoose";
import bodyParser from "body-parser";
import { myRouter } from "./routes/user_routes.js";
import { myBrazilianRouter } from "./routes/brazilian_products_routes.js";

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

mongoose
  .connect(
    "mongodb+srv://pedroporto:1234@ecommerce-test.a8caowy.mongodb.net/ecommerce-test?retryWrites=true&w=majority"
  )
  .then(() => {
    app.get("/", (req, res) => {
      res.send("Ecommerce setup");
    });

    const userRoutes = myRouter;
    app.use("/api/user", userRoutes);

    const productRoutes = myBrazilianRouter;
    app.use("/api/product", productRoutes);
  });

export default app;
