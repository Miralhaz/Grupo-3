var tempModel = require("../models/tempModel");

function buscarAlertaAtencao(req, res) {
  var temperatura = req.params.temperatura;

  tempModel.buscarAlertaAtencao(temperatura).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os alertas: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}

function buscarAlertaRisco(req, res) {
  var temperatura = req.params.temperatura;

  tempModel.buscarAlertaRisco(temperatura).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os alertas: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}

function buscarAlertaCritico(req, res) {
  var temperatura = req.params.temperatura;

  tempModel.buscarAlertaCritico(temperatura).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os alertas: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}

function puxarDadoAtencao(req, res) {
    tempModel.puxarDadoAtencao()
        .then(function (dados) {
            if (dados.length > 0) {
                res.status(200).json(dados);
            } else {
                res.status(204).send('Informações Não Encontradas!!')
            }
        })
        .catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao Coletar Informações! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function puxarDadoRisco(req, res) {
    tempModel.puxarDadoRisco()
        .then(function (dados) {
            if (dados.length > 0) {
                res.status(200).json(dados);
            } else {
                res.status(204).send('Informações Não Encontradas!!')
            }
        })
        .catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao Coletar Informações! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function puxarDadoCritico(req, res) {
    tempModel.puxarDadoCritico()
        .then(function (dados) {
            if (dados.length > 0) {
                res.status(200).json(dados);
            } else {
                res.status(204).send('Informações Não Encontradas!!')
            }
        })
        .catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao Coletar Informações! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
  buscarAlertaAtencao,
  buscarAlertaCritico,
  buscarAlertaRisco,
  puxarDadoAtencao,
  puxarDadoCritico,
  puxarDadoRisco
}