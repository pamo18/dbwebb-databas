/**
 * Paul Moreland
 * pamo18
 * 2019/03/28
 */

/**
 * Route for exam.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const exam       = require("../src/exam.js");
const sitename   = "| Exam try 1";
const siteroute = "/exam";
const renderRoute = "exam";

module.exports = router;

/**-----------------------------------------------------------------------------
 * Pages
------------------------------------------------------------------------------*/

router.get("/index", (req, res) => {
    let data = {
        title: `Welcome ${sitename}`,
        siteRoute: siteroute
    };

    res.render(`${renderRoute}/index`, data);
});

router.get("/sushi-view", async (req, res) => {
    let data = {
        title: `Sushi ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewAllSushi();

    res.render(`${renderRoute}/sushi-view`, data);
});

router.get("/competition-view", async (req, res) => {
    let data = {
        title: `Competitions ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewAllComp();

    res.render(`${renderRoute}/competition-view`, data);
});

router.get("/competition-view/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `View details for ${id} ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewCompDetails(id);

    res.render(`${renderRoute}/comp-details`, data);
});

/**-----------------------------------------------------------------------------
 * CRUD Create
------------------------------------------------------------------------------*/

router.get("/sushi/create", (req, res) => {
    let data = {
        title: `Create new item ${sitename}`,
        siteRoute: siteroute
    };

    res.render(`${renderRoute}/sushi/create`, data);
});

router.post("/sushi/create", urlencodedParser, async (req, res) => {
    await exam.createSushi(req.body.name, req.body.details, req.body.tv, req.body.image);
    res.redirect(`/${renderRoute}/sushi-view`);
});

router.get("/competition/create", (req, res) => {
    let data = {
        title: `Create new item ${sitename}`,
        siteRoute: siteroute
    };

    res.render(`${renderRoute}/competition/create`, data);
});

router.post("/competition/create", urlencodedParser, async (req, res) => {
    await exam.createComp(req.body.name, req.body.details, req.body.comp_date);
    res.redirect(`/${renderRoute}/competition-view`);
});

/**-----------------------------------------------------------------------------
 * CRUD Read
------------------------------------------------------------------------------*/

router.get("/sushi/read", async (req, res) => {
    let data = {
        title: `Sushi ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewAllSushi();

    res.render(`${renderRoute}/sushi/read`, data);
});

router.get("/competition/read", async (req, res) => {
    let data = {
        title: `Competitions ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewAllComp();

    res.render(`${renderRoute}/competition/read`, data);
});

/**-----------------------------------------------------------------------------
 * CRUD Update
------------------------------------------------------------------------------*/

router.get("/sushi/update/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Update ${id} ${sitename}`,
        siteRoute: siteroute,
        item: id
    };

    data.res = await exam.viewSushi(id);

    res.render(`${renderRoute}/sushi/update`, data);
});

router.post("/sushi/update", urlencodedParser, async (req, res) => {
    await exam.updateSushi(req.body.id, req.body.name, req.body.details, req.body.tv,
        req.body.image);
    res.redirect(`/${renderRoute}/sushi/update/${req.body.id}`);
});

router.get("/competition/update/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Update ${id} ${sitename}`,
        siteRoute: siteroute,
        item: id
    };

    data.res = await exam.viewComp(id);

    res.render(`${renderRoute}/competition/update`, data);
});

router.post("/competition/update", urlencodedParser, async (req, res) => {
    await exam.updateComp(req.body.id, req.body.name, req.body.details, req.body.comp_date);
    res.redirect(`/${renderRoute}/competition/update/${req.body.id}`);
});

/**-----------------------------------------------------------------------------
 * CRUD Delete
------------------------------------------------------------------------------*/

router.get("/sushi/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Delete ${id} ${sitename}`,
        siteRoute: siteroute,
        item: id
    };

    data.res = await exam.viewSushi(id);

    res.render(`${renderRoute}/sushi/delete`, data);
});

router.post("/sushi/delete", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await exam.deleteSushi(req.body.id);
    res.redirect(`/${renderRoute}/sushi-view`);
});

router.get("/competition/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Delete ${id} ${sitename}`,
        siteRoute: siteroute,
        item: id
    };

    data.res = await exam.viewComp(id);

    res.render(`${renderRoute}/competition/delete`, data);
});

router.post("/competition/delete", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await exam.deleteComp(req.body.id);
    res.redirect(`/${renderRoute}/competition-view`);
});

/**-----------------------------------------------------------------------------
 * Other routes
------------------------------------------------------------------------------*/

router.get("/vote", async (req, res) => {
    let comp = req.query.comp;
    let sushi = req.query.sushi;

    await exam.voteCompSushi(comp, sushi);

    res.redirect(`/${renderRoute}/competition-view/${comp}`);
});

router.get("/competition/connect/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Add options${id} ${sitename}`,
        siteRoute: siteroute,
        item: id,
    };

    data.res = await exam.viewCompSushi(id);
    data.options = await exam.viewAllSushi();
    res.render(`${renderRoute}/competition/connect`, data);
});

router.post("/competition/connect", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    console.info(req.body);
    await exam.addOptions(req.body.id, req.body.options);
    res.redirect(`/${renderRoute}/competition-view/${req.body.id}`);
});
