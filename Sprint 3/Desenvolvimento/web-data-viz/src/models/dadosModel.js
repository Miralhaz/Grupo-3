var database = require("../database/config");

function puxar() {
    var instrucaoSql = `select temperatura, dayname(data_hora) as dia_semana, time(data_hora) as hora_dado from dado_arduino where fk_sensor = 1;`;
    return database.executar(instrucaoSql);
};

module.exports = {
    puxar
};