[Voltar](../Readme.md)


## Configuracoes do Ambiente

### Instalacao do truffle (Windows/Linux)

#### Windows usando o Powershell como administrador.

```shell
Get-ExecutionPolicy
```
Caso ele retorne Restricted, execute o comando:
```shell
Set-ExecutionPolicy Unrestricted
```
E escolha a opção [A] Sim para Todos

##### Instalando o Truffle com Node 
Caso nao tenha o node instalado recomendamos o uso do NVM como gerenciador 
do  Node 

[NVM for Windows](https://github.com/coreybutler/nvm-windows)

```bash
node -v
```
Utilizamos o node na versao 16.10.0

```bash
npm -v
```
Utilizamos o npm na versao 8.14.0
```bash
npm i -g truffle
```

Comando basicos do Truffle

```bash
truffle version 

truffle init /*Iniciando o projeto  */

truffle create contract /* Criando os contratos */

truffle create migration /* Criando as migrations */

truffle create test /* Criando os testes do projeto */

truffle test /* Executando os Testes */

truffle migrate /* Executando as migrations */

```

#### Instalando no Linux (Usar modo admim) sudo  
Caso nao tenha o node instalado recomendamos usar o NVM como gerenciado do node

[NVM Install](https://heynode.com/tutorial/install-nodejs-locally-nvm/)


```shell
npm i -g truffle
```

### Execucao Local 

[Repositorio](https://github.com/Rodrigodsgit/Smart_Contract)

```bash
git clone https://github.com/Rodrigodsgit/Smart_Contract smart

cd smart

npm install
```
Utilizamos o docker como opcao de instalacao para o ganache-cli
```bash
cd smart/.docker

docker-compose up -d 
```