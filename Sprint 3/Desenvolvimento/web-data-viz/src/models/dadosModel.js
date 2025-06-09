var database = require("../database/config");

function puxar(sensorId) {
    var instrucaoSql = `select temperatura, dayname(data_hora) as dia_semana, time(data_hora) as hora_dado from dado_arduino 
    where fk_sensor =${sensorId} and data_hora >= DATE_SUB(NOW(), INTERVAL 7 DAY);`;
    return database.executar(instrucaoSql);
};

function maiorTemperatura(sensorId) {
    var instrucaoSql = `select max(temperatura) as maior_temperatura from dado_arduino where fk_sensor = ${sensorId} and data_hora >= DATE_SUB(NOW(), INTERVAL 24 HOUR);`
    return database.executar(instrucaoSql);
}

function pegarTelefone(sensorId) {
    var instrucaoSql = `select telefone from veiculo where idVeiculo = ${sensorId};`
    return database.executar(instrucaoSql);
}

function puxarPlaca(sensorId) {
    var instrucaoSql = `select placa from veiculo v join sensor s on v.idVeiculo = s.fk_veiculo where fk_veiculo = ${sensorId};`
    return database.executar(instrucaoSql);
}

function checarAlertas(sensorId) {
    var instrucaoSql = `select count(idAlerta) as total_alertas from alertas where fk_sensor = ${sensorId} and status_alerta = 'verificar';`
    return database.executar(instrucaoSql);
}

function verificarAlertas() {
    var instrucaoSql = `select distinct fk_sensor from alertas where status_alerta = 'verificar';`
    return database.executar(instrucaoSql);
}

function darBaixa(sensorId) {
    var instrucaoSql = `delete from alertas where fk_sensor = ${sensorId};`
    return database.executar(instrucaoSql);
}

function pegarSensores() {
    var instrucaoSql = `select count(idSensor) as total_sensores from sensor;`
    return database.executar(instrucaoSql);
}

module.exports = {
    puxar,
    maiorTemperatura,
    puxarPlaca,
    verificarAlertas,
    checarAlertas,
    darBaixa,
    pegarTelefone,
    pegarSensores
};