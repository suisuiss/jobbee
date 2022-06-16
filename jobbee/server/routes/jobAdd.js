const express = require('express');
const jobRouter = express.Router();
const { Job } = require('../models/job');

//add job
jobRouter.post('/api/job/add', async (req, res) => {
    try {
        const { companyName, images, position, salary, fullOrPart, online, jobRes, benefits, companyDesc,location } = req.body;
        let job = new Job({
            companyName,
            images,
            position,
            salary,
            fullOrPart,
            online,
            jobRes,
            benefits,
            companyDesc,
            location
        });
        job = await job.save();
        res.json(job);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//search job
jobRouter.get('/api/job/search', async (req, res) => {
    const query = {};
    if (req.query.search) {
        query.position = {
            $regex: req.query.search,
            $options: 'i'
        }
    }

    try {
        let jobs = await Job.find(query);
        res.json(jobs);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

jobRouter.get("/api/home-job", async (req, res) => {
    try {
        const jobs = await Job.find({});
        res.json(jobs);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})

module.exports = jobRouter;