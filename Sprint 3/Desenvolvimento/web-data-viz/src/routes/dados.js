var express = require("express");
var router = express.Router();
var dadosController = require("../controllers/dadosController");

router.get("/puxar", function (req, res) {
    dadosController.puxar(req, res);
});

/*
router.get("/horas", function (req, res) {
    dadosController.horas(req, res);
});

router.get("/semanas", function (req, res) {
    dadosController.semanas(req, res);
});
*/

module.exports = router;