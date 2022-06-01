const mongoose = require('mongoose');
const userSchema = mongoose.Schema({
    firstName: {
        required: true,
        type: String,
        trim: true
    },
    lastName: {
        required: true,
        type: String,
        trim: true
    },
    phoneNo: {
        required: true,
        type: String,
        trim: true
    },
    basedOn: {
        required: true,
        type: String,
        trim: true
    },
    edLevel: {
        required: true,
        type: String,
        trim: true
    },
    eddetail: {
        required: true,
        type: String,
        trim: true
    },
    workEx: {
        required: true,
        type: String,
        trim: true
    },
    skill: {
        required: true,
        type: String,
        trim: true
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Please enter a valid email address',
        }
    },
    password: {
        required: true,
        type: String,
        validate:{
            validator:(value) => {
                return value.length >= 8;
            },
            message:"Please enter at least 8 characters"
        }
    },
    type:{
        type:String,
        default:"user"
    }

});

const User = mongoose.model("User", userSchema);
module.exports = User;