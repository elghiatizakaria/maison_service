const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const { Service } = require("../models/service");
const Order = require("../models/order");
const { PromiseProvider } = require("mongoose");

// Add service
adminRouter.post("/admin/add-service", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    let service = new Service({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    service = await service.save();
    res.json(service);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all your services
adminRouter.get("/admin/get-services", admin, async (req, res) => {
  try {
    const services = await Service.find({});
    res.json(services);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the service
adminRouter.post("/admin/delete-service", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let service = await Service.findByIdAndDelete(id);
    res.json(service);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.get("/admin/get-orders", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.status = status;
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.get("/admin/analytics", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let i = 0; i < orders.length; i++) {
      for (let j = 0; j < orders[i].services.length; j++) {
        totalEarnings +=
          orders[i].services[j].quantity * orders[i].services[j].service.price;
      }
    }
    // CATEGORY WISE ORDER FETCHING
    let mobileEarnings = await fetchCategoryWiseService("Mobiles");
    let essentialEarnings = await fetchCategoryWiseService("Essentials");
    let applianceEarnings = await fetchCategoryWiseService("Appliances");
    let booksEarnings = await fetchCategoryWiseService("Books");
    let fashionEarnings = await fetchCategoryWiseService("Fashion");

    let earnings = {
      totalEarnings,
      mobileEarnings,
      essentialEarnings,
      applianceEarnings,
      booksEarnings,
      fashionEarnings,
    };

    res.json(earnings);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

async function fetchCategoryWiseService(category) {
  let earnings = 0;
  let categoryOrders = await Order.find({
    "services.service.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].services.length; j++) {
      earnings +=
        categoryOrders[i].services[j].quantity *
        categoryOrders[i].services[j].service.price;
    }
  }
  return earnings;
}

module.exports = adminRouter;
