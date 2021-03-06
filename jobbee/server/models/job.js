const mongoose = require('mongoose');
const jobSchema = mongoose.Schema({
    companyName: {
        type: String,
        required: true,
        trim: true
    },
    images:
        {
            type: String,
            required: true
        }
    ,
    position: {
        type: String,
        required: true,
        trim: true
    },
    salary: {
        type: String,
        required: true,
        trim: true
    },
    fullOrPart: {
        type: String,
        required: true
    },
    online: {
        type: String,
        required: true
    },
    jobRes: {
        type: String,
        required: true,
        trim: true
    },
    benefits: {
        type: String,
        required: true,
        trim: true
    },
    companyDesc: {
        type: String,
        required: true,
        trim: true
    },
    location:{
        type: String,
        required: true,
        trim: true
    }

    

});
const Job = mongoose.model("Job", jobSchema);
module.exports = {Job,jobSchema};

