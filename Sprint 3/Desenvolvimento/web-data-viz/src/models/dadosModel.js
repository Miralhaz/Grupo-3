var database = require("../database/config");

function puxar() {
    var instrucaoSql = `select temperatura, dayname(data_hora) as dia_semana, time(data_hora) as hora_dado from dado_arduino where fk_sensor = 1;`;
    return database.executar(instrucaoSql);
};

/*
function horas() {
    var instrucaoSql = `SELECT data_hora FROM dado_arduino WHERE fk_sensor = 1;`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function semanas() {
    var instrucaoSql = `select temperatura, dayname(data_hora) as dia_semana from dado_arduino where dayname(data_hora) = 'Tuesday' and fk_sensor = 1;`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
} 
*/

module.exports = {
    puxar
   /* horas,
    semanas */
};