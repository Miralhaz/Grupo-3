var express = require("express");
var router = express.Router();

var tempController = require("../controllers/tempController");

// NOVAS ROTAS COM TEMPERATURA COMO PARÂMETRO (GET)
router.get("/alerta/atencao/:temperatura", tempController.buscarAlertaAtencao);
router.get("/alerta/risco/:temperatura", tempController.buscarAlertaRisco);
router.get("/alerta/critico/:temperatura", tempController.buscarAlertaCritico);

/*
// ROTAS ANTIGAS (sem parâmetro) para puxar todos os dados por categoria — OK se quiser manter
router.post("/puxarDadoAtencao", tempController.puxarDadoAtencao);
router.post("/puxarDadoRisco", tempController.puxarDadoRisco);
router.post("/puxarDadoCritico", tempController.puxarDadoCritico);
*/

module.exports = router;
