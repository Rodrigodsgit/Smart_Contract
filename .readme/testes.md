[Voltar](../Readme.md)

# Implementação dos testes de Integração
Para os testes automatizados utilizamos o Mocha para sua implementação. Cobrimos com testes de todas as funcionalidades dispostas na aplciação.

Para rodar os testes na sua máquina inicialmente, tenha o [Ganache](https://trufflesuite.com/ganache/) instalado. Após isso, adicione sua porta no ganache no arquivo .env (como mostra no .env- example) no campo "GANACHE_PORT=".

Por fim rode o comando no terminal:

```console
    truffle test
```


![teste inicial {.tests-img}](../assets/test_inicial.png)

# Testes Funcionais 

Neste campo utilizamos do [Remix](https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.7+commit.e28d00a7.js) para elucidar mais facilmente como se comportam as funções desenvolvidas, abaixo temos um compilado de testes manuais das funções disponiveis e seus retornos. Mostrando não so a visão do dono do contrato mas também dos clientes, enfatizando assim as permissões impostas para cada usuário.

## Teste no Remix by Owner

#### Função priceMilesPurchase
![test 1](../assets/E-miles%20funcao%20priceMilesPurchase%20-%20By%20owner.gif)

#### Função priceMilesSelll
![test 2](../assets/E-miles%20funcao%20priceMilesSell%20-%20By%20owner.gif)

#### Função restokEther
![test 3](../assets/E-miles%20funcao%20restokEther-%20By%20owner.gif)

#### Função restokMiles
![test 4](../assets/E-miles%20funcao%20restokMiles%20-%20By%20owner.gif)

#### Função withdraw
![test 5](../assets/E-miles%20funcao%20withdraw%20-%20By%20owner.gif)


## Teste no Remix by User

#### Função priceMilesPurchase
![test 6](../assets/E-miles%20funcao%20priceMilesPurchase%20-%20By%20user.gif)

#### Função priceMilesSelll
![test 7](../assets/E-miles%20funcao%20priceMilesSell-%20By%20user.gif)

#### Função restokEther
![test 8](../assets/E-miles%20funcao%20restokEther-%20By%20user.gif)

#### Função restokMiles
![test 9](../assets/E-miles%20funcao%20restokMiles%20-%20By%20user.gif)

#### Função withdraw
![test 10](../assets/E-miles%20funcao%20withdraw%20-%20By%20user.gif)

#### Função purchaseMiles

![test 11](../assets/E-miles%20funcao%20purchaseMiles.gif)

#### Função sellMiles

![test 12](../assets/E-miles%20funcao%20sellMiles.gif)

## Teste no Remix Forçando Entradas Zeradas by Owner

#### Função restokEther
![test 13](../assets/Emiles%20funcao%20restokEther%20com%20zero%20-%20By%20owner.gif)

#### Função restokMiles
![test 14](../assets/Emiles%20funcao%20restokMiles%20com%20zero%20-%20By%20owner.gif)

## Teste no Remix Forçando Entradas Zeradas by User

#### Função purchaseMiles
![test 15](../assets/Emiles%20funcao%20purchaseMiles%20com%20zero%20-%20By%20user.gif)

#### Função sellMiles
![test 16](../assets/Emiles%20funcao%20sellMiles%20com%20zero%20-%20By%20user.gif)