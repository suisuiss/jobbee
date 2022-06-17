const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();
const jwt = require('jsonwebtoken');

//signup
authRouter.post('/api/signup', async (req, res) => {
    try {
        const { images, firstName, lastName, phoneNo, basedOn, edLevel, eddetail, workEx, skill, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: 'This email is already exist.' });
        }

        let user = new User({
            images,
            firstName,
            lastName,
            phoneNo,
            basedOn,
            edLevel,
            eddetail,
            workEx,
            skill,
            email,
            password
        })
        user = await user.save();
        res.json(user);
    }
    catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//login
authRouter.post('/api/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: 'User with this email does not exist.' })
        }

        if (password != user.password) {
            return res.status(400).json({ msg: 'Incorrect Password' })
        }
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})
module.exports = authRouter;