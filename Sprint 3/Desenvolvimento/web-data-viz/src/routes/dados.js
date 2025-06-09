var express = require("express");
var router = express.Router();
var dadosController = require("../controllers/dadosController");

router.get("/puxar/:sensorId", function (req, res) {
    dadosController.puxar(req, res);
});

router.get("/maiorTemperatura/:sensorId", function(req, res) {
    dadosController.maiorTemperatura(req, res);
});

router.get("/puxarPlaca/:sensorId", function(req, res) {
    dadosController.puxarPlaca(req, res);
}); 

router.get("/verificarAlertas", function(req, res) {
    dadosController.verificarAlertas(req, res);
}); 

router.get("/checarAlertas/:sensorId", function(req, res) {
    dadosController.checarAlertas(req, res);
}); 

router.get("/pegarTelefone/:sensorId", function(req, res) {
    dadosController.pegarTelefone(req, res);
}); 

router.post("/darBaixa/:sensorId", function (req, res) {
    dadosController.darBaixa(req, res);
});

router.get("/pegarSensores", function(req, res) {
    dadosController.pegarSensores(req, res);
}); 



module.exports = router;