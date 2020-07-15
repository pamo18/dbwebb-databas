/**
 * Route for eshop.
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

router.get("/category/:type", async (req, res) => {
    let type = req.params.type;
    let data = {
        title: `Products in ${type} ${sitename}`,
        type: type
    };

    data.res = await eshop.showCategory(type);
    console.log(data.res);
    res.render("eshop/product", data);
});

router.get("/product", async (req, res) => {
    let data = {
        title: `Products ${sitename}`,
        type: "All"
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

router.get("/product/view", async (req, res) => {
    let data = {
        title: `View Products ${sitename}`
    };

    data.res = await eshop.viewProducts();

    res.render("eshop/product/view", data);
});

router.get("/product/update/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Update product ${id} ${sitename}`,
        product: id
    };

    data.res = await eshop.showProductView(id);

    res.render("eshop/product/update", data);
});

router.post("/product/update", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await eshop.updateProduct(req.body.id, req.body.namn, req.body.pris,
        req.body.bild, req.body.info);
    res.redirect(`/eshop/product/update/${req.body.id}`);
});

router.get("/product/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Delete account ${id} ${sitename}`,
        product: id
    };

    data.res = await eshop.showProductView(id);

    res.render("eshop/product/delete", data);
});

router.post("/product/delete", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await eshop.deleteProduct(req.body.id);
    res.redirect(`/eshop/product/view`);
});

router.get("/product/add_category/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Add product category${id} ${sitename}`,
        product: id,
    };

    data.res = await eshop.showCategories();
    data.cat = await eshop.showProductCat(id);
    res.render("eshop/product/add_category", data);
});

router.post("/product/add_category", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    console.info(req.body);
    await eshop.addCategory(req.body.id, req.body.categories);
    res.redirect(`/eshop/product`);
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

    data.res = await eshop.showProducts();

    res.render("eshop/order/build", data);
});

router.post("/order/build", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    let p;
    let products = req.body.product_id;
    let purchased = req.body.quantity;

    for (p in products) {
        if (purchased[p]) {
            await eshop.buildOrder(req.body.id, products[p], purchased[p]);
        }
    }
    res.redirect(`/eshop/order`);
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

router.get("/order/plocklista/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Build order ${id} ${sitename}`,
        order: id
    };

    data.res = await eshop.viewPlocklista(id);

    res.render("eshop/order/plocklista", data);
});

router.get("/order/invoice/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `View invoice ${id} ${sitename}`,
        order: id
    };

    data.res = await eshop.viewInvoice(id);
    console.info(data);

    res.render("eshop/order/invoice", data);
});

router.get("/about", (req, res) => {
    let data = {
        title: `About ${sitename}`
    };

    res.render("eshop/about", data);
});

router.get("/log", async (req, res) => {
    let data = {
        title: `Log ${sitename}`
    };

    data.res = await eshop.viewLogs();
    console.log(data.res);
    res.render("eshop/log", data);
});

router.post("/log", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    console.log(req.body);
    res.redirect(`/eshop/log/${req.body.filter}`);
});

router.get("/log/:filter", async (req, res) => {
    let filter = req.params.filter;
    let data = {
        title: `Log ${sitename}`,
        filtered: filter
    };

    data.res = await eshop.viewLogsFiltered(filter);
    console.log(data.res);
    res.render("eshop/log", data);
});
