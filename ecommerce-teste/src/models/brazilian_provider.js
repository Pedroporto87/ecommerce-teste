import { Schema, model } from "mongoose";

const productsSchema = new Schema({
  id: { type: String, require: true, unique: true },
  nome: { type: String, require: true },
  descricao: { type: String },
  categoria: { type: String },
  preco: { type: Number, require: true },
  material: { type: String },
  departamento: { type: String },
  createdon: { type: Date, default: Date.now },
});
const brazilianProductsModel = model("Brazilian Products", productsSchema);

export { brazilianProductsModel };