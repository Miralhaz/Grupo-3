var database = require("../database/config");

function buscarAlertaAtencao(temperatura) {
  var instrucaoSql = `
    SELECT temperatura FROM dado_arduino WHERE temperatura = ${temperatura} AND temperatura BETWEEN 0 AND 2;
  `;
  return database.executar(instrucaoSql);
}

function buscarAlertaRisco(temperatura) {
  var instrucaoSql = `
    SELECT temperatura FROM dado_arduino WHERE temperatura = ${temperatura} AND temperatura > 2 AND temperatura <= 4;
  `;
  return database.executar(instrucaoSql);
}

function buscarAlertaCritico(temperatura) {
  var instrucaoSql = `
    SELECT temperatura FROM dado_arduino WHERE temperatura = ${temperatura} AND temperatura > 4;
  `;
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarAlertaAtencao,
  buscarAlertaCritico,
  buscarAlertaRisco
}
