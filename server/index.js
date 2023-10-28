// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const serviceRouter = require("./routes/service");
const userRouter = require("./routes/user");

// INIT
const PORT = process.env.PORT || 5000;
const app = express();
const DB =
"mongodb://pis3:pis3@ac-ui1e5oj-shard-00-00.0sg1cok.mongodb.net:27017,ac-ui1e5oj-shard-00-01.0sg1cok.mongodb.net:27017,ac-ui1e5oj-shard-00-02.0sg1cok.mongodb.net:27017/?ssl=true&replicaSet=atlas-12cn1g-shard-0&authSource=admin&retryWrites=true&w=majority"
// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(serviceRouter);
app.use(userRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
