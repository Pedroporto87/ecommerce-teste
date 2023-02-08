import mongoose from "mongoose";

mongoose
  .connect(
    "mongodb+srv://pedroporto:1234@ecommerce-test.a8caowy.mongodb.net/?retryWrites=true&w=majority"
  )
  .then(() => {
    const userRoutes = require("./routes/user_routes.js");
    app.use("/api/user", userRoutes);
  });

let db = mongoose.connection;

export default db;
