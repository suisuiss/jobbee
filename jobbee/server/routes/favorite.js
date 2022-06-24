const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Job } = require("../models/job");
const User = require("../models/user");

userRouter.post("/api/job/favorite", auth, async (req, res) => {
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
                let jobbb = user.favorite.find((jobb) =>
                    jobb.job._id.equals(job._id)
                );
                jobbb.quantity += 1;
            } else {
                user.favorite.push({ job, quantity: 1 });
            }
        }
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//applied
userRouter.post("/api/job/applied", auth, async (req, res) => {
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
                let jobbb = user.applied.find((jobb) =>
                    jobb.job._id.equals(job._id)
                );
                jobbb.quantity += 1;
            } else {
                user.applied.push({ job, quantity: 1 });
            }
        }
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = userRouter;