/**
 * Route for bank.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const eshop       = require("../src/eshop.js");
const sitename   = "| CDOff";

module.exports = router;

router.get("/index", (req, res) => {
    let data = {
        title: `Welcome ${sitename}`
    };

    res.render("eshop/index", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: `Catagories ${sitename}`
    };

    data.res = await eshop.showCategories();

    res.render("eshop/category", data);
});

router.get("/product", async (req, res) => {
    let data = {
        title: `Products ${sitename}`
    };

    data.res = await eshop.showProducts();

    res.render("eshop/product", data);
});

router.get("/create", (req, res) => {
    let data = {
        title: `Create new product ${sitename}`
    };

    res.render("eshop/create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await eshop.createProduct(req.body.name, req.body.pris, req.body.bild, req.body.info);
    res.redirect("/eshop/product");
});

router.get("/product-view", async (req, res) => {
    let data = {
        title: `View Products ${sitename}`
    };

    data.res = await eshop.viewProducts();

    res.render("eshop/product-view", data);
});

router.get("/update/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Update product ${id} ${sitename}`,
        product: id
    };

    data.res = await eshop.showProductView(id);

    res.render("eshop/product-update", data);
});

router.post("/update", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await eshop.updateProduct(req.body.id, req.body.namn, req.body.pris,
        req.body.bild, req.body.info);
    res.redirect(`/eshop/update/${req.body.id}`);
});

router.get("/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Delete account ${id} ${sitename}`,
        product: id
    };

    data.res = await eshop.showProductView(id);

    res.render("eshop/product-delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await eshop.deleteProduct(req.body.id);
    res.redirect(`/eshop/product-view`);
});

router.get("/customer", async (req, res) => {
    let data = {
        title: `Customers ${sitename}`
    };

    data.res = await eshop.showCustomers();

    res.render("eshop/customer", data);
});

router.get("/order/create", async (req, res) => {
    let data = {
        title: `Create Order ${sitename}`
    };

    data.res = await eshop.showCustomers();

    res.render("eshop/order/create", data);
});

router.post("/order/create", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await eshop.createOrder(req.body.id);
    res.redirect(`/eshop/order`);
});

router.get("/order", async (req, res) => {
    let data = {
        title: `Orders ${sitename}`
    };

    data.res = await eshop.showOrders();
    console.log(data.res);
    res.render("eshop/order", data);
});

router.get("/order/build/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Build order ${id} ${sitename}`,
        order: id
    };

    data.res = await eshop.viewProducts();

    res.render("eshop/order/build", data);
});

router.post("/order/build", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    console.log(req.body);
    await eshop.buildOrder(req.body.id, req.body.product_id, req.body.quantity);
    res.redirect(`/eshop/order/build/${req.body.id}`);
});

router.get("/order/view_order/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `View order ${id} ${sitename}`,
        order: id
    };

    data.res = await eshop.viewOrder(id);
    console.info(data);

    res.render("eshop/order/view_order", data);
});

router.get("/order/place/:id", async (req, res) => {
    let id = req.params.id;

    console.info("place id = " + id);

    await eshop.placeOrder(id);

    res.redirect("/eshop/order");
});

router.get("/about", (req, res) => {
    let data = {
        title: `About ${sitename}`
    };

    res.render("eshop/about", data);
});
