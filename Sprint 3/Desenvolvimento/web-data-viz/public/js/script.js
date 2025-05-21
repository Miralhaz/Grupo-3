let tudo = [];
let temperaturas = [];
let diasSemana = [];
let horas = [];

function puxar() {
    fetch("http://localhost:3333/dados/puxar")
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            tudo = data;
            console.log(tudo);

            tratarDados();
            alertasDias();
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
    console.log(temperaturas, diasSemana, horas)
}

function alertasDias() {
    let segunda = 0;
    let terca = 0;
    let quarta = 0;
    let quinta = 0;
    let sexta = 0;
    let sabado = 0;
    let domingo = 0;

    for (let i = 0; i < tudo.length; i++) {
        if (tudo[i].dia_semana == 'Tuesday' && tudo[i].temperatura >= 0) {
            terca++
        }
    }

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

/*//SEGUIR COMO BASE

let alertaAtencao = [];
let alertaRisco = [];
let alertaCritico = [];

function tratarAlertas() {
    for (var i = 0; i < tudo.length; i++) {
        if (tudo[i].temperatura >= 0 && tudo[i].temperatura <= 2) {
            alertaAtencao.push(tudo[i].temperatura);
        } else if (tudo[i].temperatura > 2 && tudo[i].temperatura <= 4) {
            alertaRisco.push(tudo[i].temperatura);
        } else if (tudo[i].temperatura > 4) {
            alertaCritico.push(tudo[i].temperatura);
        }
    }
    gerarGraficoPizza();
}

//Gráfico de Pizza
function gerarGraficoPizza() {
    var atencao = alertaAtencao.length;
    var risco = alertaRisco.length;
    var critico = alertaCritico.length;

    const cty = document.getElementById('grafico-pizza');
    new Chart(cty, {
        type: 'pie',
        data: {
            labels: ['Risco', 'Atenção', 'Crítico'],
            datasets: [{
                label: 'Total de Alertas',
                data: [atencao, risco, critico],
                borderWidth: 1,
                backgroundColor: [
                    '#0057d9',
                    '#fea42e',
                    '#FF0000'
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

let horasVetor = [];

function horas() {
    fetch("http://localhost:3333/dados/horas")
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            horasVetor = data;
            console.log(horasVetor);
            tratarTemperatura();
        })
        .catch(function (err) {
            console.log(err);
        })
}

/* function tratarTemperatura() {
    let temperaturasCorreto = [];
    for (var i = 0; i < temperaturas.length; i++) {
        temperaturasCorreto.push(temperaturas[i].temperatura);
    }
    //Peguei do Chat para Teste | Alterar para um método simplificado
    for (let i = 0; i < horasVetor.length; i++) {
        const data = new Date(horasVetor[i].data_hora);
        //const dia = String(data.getDate()).padStart(2, '0');
        //const mes = String(data.getMonth() + 1).padStart(2, '0');
        const hora = String(data.getHours()).padStart(2, '0');
        const minuto = String(data.getMinutes()).padStart(2, '0');
        //const formatada = `${dia}/${mes} - ${hora}:${minuto}`;
        const formatada = `${hora}:${minuto}`;
        horasFormatada.push(formatada);
    }
    console.log(horasFormatada)
    //Gráfico Linhas
    const ctz = document.getElementById('chart-line');
    new Chart(ctz, {
        type: 'line',
        data: {
            labels: horasFormatada,
            datasets: [{
                label: 'Temperatura em Tempo Real',
                data: temperaturasCorreto,
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

let dias = [];
function semanas() {
    fetch("http://localhost:3333/dados/semanas")
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            dias = data;
            console.log(dias);
            tratarSemana();
        })
        .catch(function (err) {
            console.log(err);
        })
}
let diaSemanas = [];
let diaTemperaturas = [];
function tratarSemana() {
    for (var i = 0; i < dias.length; i++) {
        diaSemanas.push(dias[i].dia_semana);
        diaTemperaturas.push(dias[i].temperatura);
        console.log(diaSemanas, diaTemperaturas);
    }
}

*/
