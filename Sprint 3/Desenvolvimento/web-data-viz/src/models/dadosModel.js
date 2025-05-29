var database = require("../database/config");

function puxar(sensorId) {
    var instrucaoSql = `select temperatura, dayname(data_hora) as dia_semana, time(data_hora) as hora_dado from dado_arduino where fk_sensor = ${sensorId};`;
    return database.executar(instrucaoSql);
};

function puxarMedia(sensorId) {
    var instrucaoSql = `select truncate(avg(temperatura), 2) as media_temperatura from dado_arduino where fk_sensor = ${sensorId};`
    return database.executar(instrucaoSql);
}

function puxarPlaca(sensorId) {
    var instrucaoSql = `select placa from veiculo v join sensor s on v.idVeiculo = s.fk_veiculo where fk_veiculo = ${sensorId};`
    return database.executar(instrucaoSql);
} 

function verificarAlertas(){
    var instrucaoSql = `select fk_sensor from dado_arduino where temperatura >= 0; `;
    return database.executar(instrucaoSql);
}

module.exports = {
    puxar,
    puxarMedia,
    puxarPlaca,
    verificarAlertas
};