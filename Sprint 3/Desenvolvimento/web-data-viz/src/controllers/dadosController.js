var dadosModel = require("../models/dadosModel");

function puxar(req, res) {
    const sensorId = req.params.sensorId;
    dadosModel.puxar(sensorId)
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
};

function puxarMedia(req, res) {
    const sensorId = req.params.sensorId;
    dadosModel.puxarMedia(sensorId)
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
};

function puxarPlaca(req, res) {
    const sensorId = req.params.sensorId;
    dadosModel.puxarPlaca(sensorId)
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
    puxar,
    puxarMedia,
    puxarPlaca
};