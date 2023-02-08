import { Schema, model } from "mongoose";

const userSchema = new Schema({
  userid: { type: String, unique: true },
  nome: { type: String, trim: true,  },
  sobrenome: { type: String },
  email: { type: String, unique: true, validate: (value) => {
    const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    return value.match(re);
  } },
  password: { type: String, required: true },

  addon: { type: Date, default: Date.now },
});

const userModel = model("User", userSchema);

export default userModel;