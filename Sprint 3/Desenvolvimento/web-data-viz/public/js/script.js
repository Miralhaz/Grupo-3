let tudo = [];
let temperaturas = [];
let diasSemana = [];
let horas = [];

async function puxar() {
    fetch("http://localhost:3333/dados/puxar")
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

function tratarDados() {
    for (var i = 0; i < tudo.length; i++) {
        temperaturas.push(tudo[i].temperatura);
        horas.push(tudo[i].hora_dado);
        diasSemana.push(tudo[i].dia_semana);
    }
    console.log('Resultados dos dados tratados: ', temperaturas, diasSemana, horas)
}

function alertasDias() {
    let segunda = 0;
    let terca = 0;
    let quarta = 0;
    let quinta = 0;
    let sexta = 2;
    let sabado = 0;
    let domingo = 0;

    for (let i = 0; i < tudo.length; i++) {
        if (tudo[i].dia_semana == 'Wednesday' && tudo[i].temperatura >= 0) {
            terca++
        }
    }

    if(terca > sexta){
        dia_alertas.innerHTML = `Terça-Feira`
    } else {
        dia_alertas.innerHTML = `Sexta-Feira`
    }

    if(sexta > terca){
        alertas_dia.innerHTML = `Alertas no dia: ${sexta}`
    } else {
        alertas_dia.innerHTML = `Alertas no dia: ${terca}`
    }
    
    total_alertas.innerHTML = `${terca + sexta} Alertas`

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
            labels: ['Risco', 'Atenção', 'Crítico'],
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
                    label: 'Temperatura em Tempo Real',
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