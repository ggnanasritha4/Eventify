const express = require("express");
const router = express.Router();

const Registration = require("../models/Registration");

// Register for an event
router.post("/", async (req, res) => {
    try {
        const registration = new Registration(req.body);
        const savedRegistration = await registration.save();
        res.status(201).json(savedRegistration);
    } catch (error) {
        res.status(400).json({
            message: error.message
        });
    }
});

// Get all registrations
router.get("/", async (req, res) => {
    try {
        const registrations = await Registration.find().populate("eventId");
        res.json(registrations);
    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
});

// Cancel registration
router.delete("/:id", async (req, res) => {
    try {
        const registration = await Registration.findByIdAndDelete(req.params.id);

        if (!registration) {
            return res.status(404).json({
                message: "Registration not found"
            });
        }

        res.json({
            message: "Registration cancelled successfully"
        });

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
});

module.exports = router;