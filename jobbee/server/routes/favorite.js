const express = require('express');
const { Job } = require('../models/job');
const userRouter = express.Router();
const auth = require('../middlewares/auth');
const User = require('../models/user');
//add to favorite
userRouter.post('/api/job/favorite'), async (req, res) => {
    try {
        const { id } = req.body;
        const job = await Job.findById(id);
        let user = await User.findById(req.user);
        if (user.favorite.length == 0) {
            user.favorite.push({ job, quantity: 1 });
        } else {
            let isJobFound = false;
            for (let i = 0; i < user.favorite.length; i++) {
                if (user.favorite[i].job._id.equals(job._id)) {
                    isJobFound = true;
                }
            }
            if (isJobFound) {
                let jobbee = user.favorite.find((jobb) => jobb.job._id.equals(job._id));
                jobbee.quantity += 1;
            }
            else {
                user.favorite.push({ job, quantity: 1 });
            }

        }
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

//applied
userRouter.post('/api/job/applied'), async (req, res) => {
    try {
        const { id } = req.body;
        const job = await Job.findById(id);
        let user = await User.findById(req.user);
        if (user.applied.length == 0) {
            user.applied.push({ job, quantity: 1 });
        } else {
            let isJobFound = false;
            for (let i = 0; i < user.applied.length; i++) {
                if (user.applied[i].job._id.equals(job._id)) {
                    isJobFound = true;
                }
            }
            if (isJobFound) {
                let jobbee = user.applied.find((jobb) => jobb.job._id.equals(job._id));
                jobbee.quantity += 1;
            }
            else {
                user.applied.push({ job, quantity: 1 });
            }

        }
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = userRouter;