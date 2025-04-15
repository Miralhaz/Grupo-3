//Gráfico de Barras
const ctx = document.getElementById('myChart');
new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'
        ],
        datasets: [{
            label: 'Número de Alertas na Semana',
            data: [2, 3, 0, 4, 2,1],
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

//Gráfico Linhas
const ctz = document.getElementById('chart-line');
new Chart(ctz, {
    type: 'line',
    data: {
        labels: ['9:00', '9:02', '9:04', '9:06', '9:08', '9:10','9:12','9:14','9:16','9:18','9:20'
        ],
        datasets: [{
            label: 'Sensor Dianteiro',
            data: [-3, -2, 2, 0, 1, -1, -2, 0, 3.3, -2, 1, 1.5],
            borderWidth: 1,
            borderColor: '#0057d9',
            backgroundColor: '#0057d9'
        },
        {
        label: 'Sensor Traseiro',
        data: [1.5, 1, -2, 3.3, 4, 3.2, 5.3, 1, 0, -3, 0, 3],
        borderWidth: 1,
        borderColor: '#FF0000',
        backgroundColor: '#FF0000'
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

//Gráfico de Pizza
const cty = document.getElementById('grafico-pizza');
new Chart(cty, {
    type: 'pie',
    data: {
        labels: ['Risco', 'Atenção', 'Crítico'],
        datasets: [{
            label: 'Total de Alertas',
            data: [4, 6, 2],
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


