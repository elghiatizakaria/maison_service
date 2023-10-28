const express = require("express");
const serviceRouter = express.Router();
const auth = require("../middlewares/auth");
const { Service } = require("../models/service");
serviceRouter.get("/api/services/", auth, async (req, res) => {
  try {
    const services = await Service.find({ category: req.query.category });
    res.json(services);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

serviceRouter.get("/api/services/me", auth, async (req, res) => {
  try {
    const services = await Service.find({ userId: req.user });
    res.json(services);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// create a get request to search services and get them
// /api/services/search/i
serviceRouter.get("/api/services/search/:name", auth, async (req, res) => {
  try {
    const services = await Service.find({
      name: { $regex: req.params.name, $options: "i" },
    });

    res.json(services);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// create a post request route to rate the service.
serviceRouter.post("/api/rate-service", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let service = await Service.findById(id);

    for (let i = 0; i < service.ratings.length; i++) {
      if (service.ratings[i].userId == req.user) {
        service.ratings.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    service.ratings.push(ratingSchema);
    service = await service.save();
    res.json(service);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

serviceRouter.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let services = await Service.find({});

    services = services.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }

      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }
      return aSum < bSum ? 1 : -1;
    });

    res.json(services[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = serviceRouter;
