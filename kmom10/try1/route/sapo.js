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
const exam       = require("../src/sapo.js");
const sitename   = "| Sapo";
const siteroute = "/sapo";
const renderRoute = "sapo";

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

router.get("/logg", async (req, res) => {
    let data = {
        title: `Logg ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewAllLogg();

    res.render(`${renderRoute}/logg`, data);
});

router.get("/search", async (req, res) => {
    let data = {
        title: `Log ${sitename}`,
        siteRoute: siteroute
    };

    data.res = await exam.viewAllLogg();
    console.log(data.res);
    res.render(`${renderRoute}/search`, data);
});

router.post("/search", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    console.log(req.body);
    res.redirect(`/${renderRoute}/search/${req.body.filter}`);
});

router.get("/search/:filter", async (req, res) => {
    let filter = req.params.filter;
    let data = {
        title: `Search ${sitename}`,
        siteRoute: siteroute,
        filtered: filter
    };

    data.res = await exam.viewLogsFiltered(filter);
    console.log(data.res);
    res.render(`${renderRoute}/search`, data);
});
