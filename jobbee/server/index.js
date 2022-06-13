const express = require('express');
const mongoose = require('mongoose');
const jobRouter = require("./routes/jobAdd");
const authRouter = require("./routes/auth");
const userRouter = require('./routes/favorite');
const PORT = 3000;
const app = express();
app.use(express.json());
app.use(authRouter);
app.use(userRouter);
const DB = "mongodb://nonny:nonny223@cluster0-shard-00-00.v7zmd.mongodb.net:27017,cluster0-shard-00-01.v7zmd.mongodb.net:27017,cluster0-shard-00-02.v7zmd.mongodb.net:27017/?ssl=true&replicaSet=atlas-88c9ir-shard-0&authSource=admin&retryWrites=true&w=majority";
app.use(jobRouter);
mongoose
    .connect(DB)
    .then(() => {
        console.log('connection successful');
    })
    .catch((e) => { console.log(e); });

app.listen(PORT , () => {
    console.log('connected at port ' + PORT);
});
