// Definir variáveis
const int PINO_SENSOR_TEMPERATURA = A0; // Variável que vai definir em que casa analógica o sensor vai estar conectado
float temperaturaCelsius; // " Definindo que os valores recebidos não serão inteiros, permitindo maior precisão"

// Fazer a inicialização do código, configurar a frequência com que o sensor vai mandar info para o código 
void setup() {
  Serial.begin(9600); // Frequência configurada para a placa
}

// O código que será rodado e repetido mandando informação para o console
void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // Definindo uma variável local para pegar o valor que recebe em uma variável global, nesse caso pegando informação do pino analógico
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.0 ) / 0.01; // Atribuir valor para a variável fazendo uma equação matemática

Serial.print("Temperatura: "); // Printar no console a informação qu vai ser recebida
Serial.print(temperaturaCelsius - 27); // Printar logo em seguida no console o valor recebido pelo sensor
Serial.println(" C"); // Printar a unidade usada para medir o valor recebido pelo sensor 

delay(2000); // Tempo em que a informação vai ser repetida no código nesse caso, 2 segundos 
}
