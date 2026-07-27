const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const eventRoutes = require("./routes/eventRoutes");
const registrationRoutes = require("./routes/registrationRoutes");
require("dotenv").config();

const app = express();

app.use(cors());
app.use(express.json());
app.use("/api/events", eventRoutes);
app.use("/api/registrations", registrationRoutes);

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("MongoDB connected successfully"))
    .catch((error) => console.log("MongoDB connection error:", error));

app.get("/", (req, res) => {
    res.send("Event Registration System API is running");
});

const PORT = 5000;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});