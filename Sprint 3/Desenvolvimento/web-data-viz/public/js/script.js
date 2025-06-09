let tudo = [];
let temperaturas = [];
let diasSemana = [];
let horas = [];
let placa = [];
let media = 0;

async function puxar() {
    let sensorId = sessionStorage.getItem("SENSOR_SELECIONADO");
    console.log('Sensor Selecionado:', sensorId);

    fetch(`/dados/puxar/${sensorId}`)
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            tudo = data;
            console.log('Resultado da função puxar: ', tudo);

            tratarDados();
            alertasDias();
            tratarAlertas();
            tratarTemperatura();
        })
        .catch(function (err) {
            console.log(err);
        })
}

let alertasTotais = [];
function checarAlertas(){
    let sensorId = sessionStorage.getItem("SENSOR_SELECIONADO");
    console.log('Sensor Selecionado:', sensorId);

    fetch(`/dados/checarAlertas/${sensorId}`)
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            alertasTotais = data[0].total_alertas;
            ativarBotao();
        })
        .catch(function (err) {
            console.log(err);
        })
}

function ativarBotao(){
    let buttonBaixa = document.querySelector('.baixa')
    if(alertasTotais > 0){
        buttonBaixa.style.display = 'block'
    }
}

var temperaturaMaior = [];
function maiorTemperatura() {
    let sensorId = sessionStorage.getItem("SENSOR_SELECIONADO");
    console.log('Sensor Média:', sensorId);

    fetch(`/dados/maiorTemperatura/${sensorId}`)
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            valor = data
            console.log('Resultado da função puxar média: ', temperaturaMaior);

            temperaturaMaior.push(valor[0].maior_temperatura)

            kpimaiorTemperatura.innerHTML = `${temperaturaMaior}°C`
        })
        .catch(function (err) {
            console.log(err);
        })
};

var valorPlaca = [];
function puxarPlaca() {
    let sensorId = sessionStorage.getItem("SENSOR_SELECIONADO");
    console.log('Sensor Placa:', sensorId);
    fetch(`/dados/puxarPlaca/${sensorId}`)
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            placa = data
            console.log("Resultado da função puxar placa: ", placa)

            valorPlaca.push(placa[0].placa)

            placa_caminhao.innerHTML = `${valorPlaca}`
        })
        .catch(function (err) {
            console.log(err);
        })
}

function tratarDados() {
    for (var i = 0; i < tudo.length; i++) {
        temperaturas.push(tudo[i].temperatura);
        horas.push(tudo[i].hora_dado);
        diasSemana.push(tudo[i].dia_semana);
    }
    console.log('Resultados dos dados tratados: ', temperaturas, diasSemana, horas)
}

let alertasSemanais = [0,0,0,0,0,0,0]

function alertasDias() {
    let segunda = 0;
    let terca = 0;
    let quarta = 0;
    let quinta = 0;
    let sexta = 0;
    let sabado = 0;
    let domingo = 0;
    let totalAlertas = 0;

    for (let i = 0; i < tudo.length; i++) {
        if (tudo[i].dia_semana == 'Monday' && tudo[i].temperatura >= 0) {
            segunda++
            alertasSemanais[0] += 1
        }else if(tudo[i].dia_semana == 'Tuesday' && tudo[i].temperatura >= 0){
            terca++
            alertasSemanais[1] += 1
        }else if(tudo[i].dia_semana == 'Wednesday' && tudo[i].temperatura >= 0){
            quarta++
            alertasSemanais[2] += 1
        }else if(tudo[i].dia_semana == 'Thursday' && tudo[i].temperatura >= 0){
            quinta++
            alertasSemanais[3] += 1
        }else if(tudo[i].dia_semana == 'Friday' && tudo[i].temperatura >= 0){
            sexta++
            alertasSemanais[4] += 1
        }else if(tudo[i].dia_semana == 'Saturday' && tudo[i].temperatura >= 0){
            sabado++
            alertasSemanais[5] += 1
        }else if(tudo[i].dia_semana == 'Sunday' && tudo[i].temperatura >= 0){
            domingo++
            alertasSemanais[6] += 1
        }
    }

    let diaComMaisAlertas = 0;
    let maisAlertas = 0;
    let diaDaSemana = ""

    for(let i = 0; i < alertasSemanais.length; i++){
        if(maisAlertas < alertasSemanais[i]){
            diaComMaisAlertas = i
            maisAlertas = alertasSemanais[i]

            if(i == 0){
                diaDaSemana = 'Sengunda-feira'
            }else if(i == 1){
                diaDaSemana = 'Terça-feira'
            }else if(i == 2){
                diaDaSemana = 'Quarta-feira'
            }else if(i == 3){
                diaDaSemana = 'Quinta-feira'
            }else if(i == 4){
                diaDaSemana = 'Sexta-feira'
            }else if(i == 5){
                diaDaSemana = 'Sabado'
            }else if(i == 6){
                diaDaSemana = 'Domingo'
            }
        }
    }

        dia_alertas.innerHTML = diaDaSemana




    totalAlertas = (segunda + terca + quarta + quinta + sexta + sabado + domingo)

    total_alertas.innerHTML = `${totalAlertas} Alertas`

    //Gráfico de Barras
    const ctx = document.getElementById('myChart');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'
            ],
            datasets: [{
                label: 'Número de Alertas na Semana',
                data: [segunda, terca, quarta, quinta, sexta, sabado, domingo],
                borderWidth: 1,
                backgroundColor: '#0057d9'
            }]
        },
        options: {
            indexAxis: 'x',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

let alertaAtencao = 0;
let alertaRisco = 0;
let alertaCritico = 0;

function tratarAlertas() {
    for (var i = 0; i < temperaturas.length; i++) {
        if (temperaturas[i] >= 0 && temperaturas[i] <= 2) {
            alertaAtencao++;
        } else if (temperaturas[i] > 2 && temperaturas[i] < 4) {
            alertaRisco++;
        } else if (temperaturas[i] >= 4) {
            alertaCritico++;
        }
    }
    gerarGraficoPizza();
}

//Gráfico de Pizza
function gerarGraficoPizza() {

    console.log('Gráfico Pizza: Alerta de Risco: ', alertaRisco, ' Alerta de Atenção: ', alertaAtencao, ' Alerta de Crítico: ', alertaCritico)
    const cty = document.getElementById('grafico-pizza');
    new Chart(cty, {
        type: 'pie',
        data: {
            labels: ['Atenção','Risco', 'Crítico'],
            datasets: [{
                label: 'Total de Alertas',
                data: [alertaAtencao, alertaRisco, alertaCritico],
                borderWidth: 1,
                backgroundColor: [
                    '#fafa34ef',
                    'orange',
                    'red'
                ],
                borderColor: 'white',
                hoverOffset: 10
            }]
        },
        options: {
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
}

var temperaturaReal = [];
var horaTemperatura = [];
function tratarTemperatura() {
    for (var i = 0; i < tudo.length; i++) {
        horaTemperatura.push(tudo[i].hora_dado);
        temperaturaReal.push(tudo[i].temperatura);
    }
    console.log('Resultado da temperatura tratada: Horas: ', horaTemperatura, ' Temperatura: ', temperaturaReal)

    //Gráfico Linhas
    const ctz = document.getElementById('chart-line');
    new Chart(ctz, {
        type: 'line',
        data: {
            labels: horaTemperatura,
            datasets: [{
                label: 'Temperatura em Tempo Real a Cada 1 Minuto e 15 Segundos',
                data: temperaturaReal,
                borderWidth: 1,
                borderColor: '#0057d9',
                backgroundColor: '#0057d9'
            }]
        },
        options: {
            indexAxis: 'x',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}