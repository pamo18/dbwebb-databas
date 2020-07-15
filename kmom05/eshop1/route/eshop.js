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
