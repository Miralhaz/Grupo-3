﻿// importa os bibliotecas necessários
const serialport = require('serialport');
const express = require('express');
const mysql = require('mysql2');

// constantes para configurações
const SERIAL_BAUD_RATE = 9600;
const SERVIDOR_PORTA = 3300;

// habilita ou desabilita a inserção de dados no banco de dados
const HABILITAR_OPERACAO_INSERIR = true;

// função para comunicação serial
const serial = async (valoresSensorAnalogico) => {
    // conexão com o banco de dados MySQL
    let poolBancoDados = mysql.createPool({
        host: '127.0.0.1',
        user: 'aluno',
        password: 'Sptech#2024',
        database: 'sentinela',
        port: 3307
    }).promise();

    // lista as portas seriais disponíveis e procura pelo Arduino
    const portas = await serialport.SerialPort.list();
    const portaArduino = portas.find((porta) => porta.vendorId == 2341 && porta.productId == 43);

    if (!portaArduino) {
        throw new Error('O arduino não foi encontrado em nenhuma porta serial');
    }

    // configura a porta serial com o baud rate especificado
    const arduino = new serialport.SerialPort({
        path: portaArduino.path,
        baudRate: SERIAL_BAUD_RATE
    });

    // evento quando a porta serial é aberta
    arduino.on('open', () => {
        console.log(`A leitura do arduino foi iniciada na porta ${portaArduino.path} utilizando Baud Rate de ${SERIAL_BAUD_RATE}`);
    });

    let contadorSensor = 1;
    let contadorDado = 1

    // processa os dados recebidos do Arduino
    arduino.pipe(new serialport.ReadlineParser({ delimiter: '\r\n' })).on('data', async (data) => {
        console.log(`Dados recebidos do Arduino: [${data}]`);

        const dadoLimpo = data.trim();
        const sensorAnalogico = parseFloat(dadoLimpo);
        valoresSensorAnalogico.push(sensorAnalogico);

        if (HABILITAR_OPERACAO_INSERIR) {
            await poolBancoDados.execute(
                `INSERT INTO dado_arduino (temperatura, data_hora, fk_sensor) VALUES (?, NOW(), ?)`,
                [sensorAnalogico, contadorSensor]

                
            );

            if(sensorAnalogico>0){
                await poolBancoDados.execute(
                    `INSERT INTO alertas (fk_sensor,fk_dado,status_alerta) VALUES (?, ?, 'verificar')`,
                    [contadorSensor,contadorDado]
    
                
                );
            }
            console.log(`Inserido no banco: ${sensorAnalogico}, no sensor: ${contadorSensor}`);

            contadorSensor++;
            contadorDado++
            if (contadorSensor > 36) {
                contadorSensor = 1;
                
            }

            
        }
    });
};

// função para criar e configurar o servidor web
const servidor = (valoresSensorAnalogico) => {
    const app = express();

    // configurações de requisição e resposta
    app.use((request, response, next) => {
        response.header('Access-Control-Allow-Origin', '*');
        response.header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');
        next();
    });

    // inicia o servidor na porta especificada
    app.listen(SERVIDOR_PORTA, () => {
        console.log(`API executada com sucesso na porta ${SERVIDOR_PORTA}`);
    });

    // define os endpoints da API
    app.get('/sensores/analogico', (_, response) => {
        return response.json(valoresSensorAnalogico);
    });
};

// função principal assíncrona para iniciar a comunicação serial e o servidor web
(async () => {
    const valoresSensorAnalogico = [];

    await serial(valoresSensorAnalogico);
    servidor(valoresSensorAnalogico);
})();