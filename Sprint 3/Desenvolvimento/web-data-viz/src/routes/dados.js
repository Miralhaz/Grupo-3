var express = require("express");
var router = express.Router();
var dadosController = require("../controllers/dadosController");

router.get("/puxar/:sensorId", function (req, res) {
    dadosController.puxar(req, res);
});

router.get("/puxarMedia", function(req, res) {
    dadosController.puxarMedia(req, res);
});

router.get("/puxarPlaca", function(req, res) {
    dadosController.puxarPlaca(req, res);
}); 

module.exports = router;