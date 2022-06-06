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
const DB = "mongodb+srv://csc291:integratedproject@cluster0.v7zmd.mongodb.net/?retryWrites=true&w=majority";
app.use(jobRouter);
mongoose
    .connect(DB)
    .then(() => {
        console.log('connection successful');
    })
    .catch((e) => { console.log(e); });

app.listen(PORT, "0.0.0.0", () => {
    console.log('connected at port ' + PORT);
});
