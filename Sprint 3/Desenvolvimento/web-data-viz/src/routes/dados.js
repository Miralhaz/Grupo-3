var express = require("express");
var router = express.Router();
var dadosController = require("../controllers/dadosController");

router.get("/puxar/:sensorId", function (req, res) {
    dadosController.puxar(req, res);
});

router.get("/puxarMedia/:sensorId", function(req, res) {
    dadosController.puxarMedia(req, res);
});

router.get("/puxarPlaca/:sensorId", function(req, res) {
    dadosController.puxarPlaca(req, res);
}); 

router.get("/verificarAlertas", function(req, res) {
    dadosController.verificarAlertas(req, res);
}); 

module.exports = router;