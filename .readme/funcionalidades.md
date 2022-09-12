# Requisitos & Funcionalidades

## Requisitos
Como dito, foi proposto construir um MVP (Minimo Produto Viavel) de uma aplicação de Vending Machine que possa ser disponibilizada para o time de DApps a implementação deste Smart Contract. Para isso, além desta documentação feita com instruções de instalação e operações, metodologias utilizadas, teste e deploy, também iremos detalhar as funcionalidades implementadas baseadas nos requisitos esperados, sendo eles:

1. Criou o próprio Contrato Inteligente de Token.
2. Criou o próprio Contrato Ingeligente de Maquina de Venda do Token.
3. O Comprador deve ser possivel comprar tokens com ethers.
4. O Vendedor deve ser possivel vender tokens por ethers.
5. O administrador deve ser capaz de reabastecer a maquina com tokens e ethers.
6. O adminsitrador deve ser capaz de sacar o saldo em ethers
7. O administrador deve ser capaz de redefinir o valor dos tokens para compra.
8. O administrador deve ser capaz de redefinir o valor dos tokens para venda.
9. Não deve ser possivel comprar tokens com valor zero.
10. Não deve ser possivel vender tokens com valor zero.
11. Não deve ser possivel reabastecer a maquina com tokens com valor zero.
12. Não deve ser possivel reabastecer a maquina com ethers com valor zero.


# Funcionalidades

Abaixo falaremos, de forma resumida, sobre as principais funções desenvolvidas e seu comportamento.

- Função responsável por retornar quantas E-Miles há disponivel na Vending .
```JavaScript
    function getMiles(){
    }
```

- Função responsável por retornar quanto de Ether há disponivel na Vending Machine.
```JavaScript
    function getBalance(){
    }
```

- Função responsável por retornar quanto de Ether há disponivel na carteira do cliente.
```JavaScript
    function getEtherBalanceClient(){
    }
```

- Função responsável por retornar quanto de E-Miles há disponivel na conta do cliente.
```JavaScript
    function getBalanceMilesClient(){
    }
```

- Função responsável por retornar qual o valor de compra das E-Miles.
```JavaScript
    function getPricePurchase(){
    }
```

- Função responsável por retornar qual o valor de compra das E-Miles.
```JavaScript
    function getPricePurchase(){
    }
```

- Função responsável por reabastecer a quantidade de E-Miles da Vending Machine. Somente o Owner pode utiliza-lá e não são permitido valores 0.

```JavaScript
    function restokMiles(){
    }
```

- Função responsável por reabastecer a quantidade de Ether da Vending Machine. Somente o Owner pode utiliza-lá e não são permitido valores 0.

```JavaScript
    function restokEther(){
    }
```

- Função responsável por converter as possivéis frações da criptomoeda Etherum, sendo permitido valores como Wei, Gwei e o próprio Ether. Moedas diferentes desses valores não são aceitas.

```JavaScript
    function convert(){
    }
```
- Função responsável por sacar o saldo remanescente na Vending Machine. Somente o Owner pode utiliza-lá e não são permitido valores 0.

```JavaScript
    function withdraw(){
    }
```
- Função responsável por definir o preço de compra das E-Miles na Vending Machine. Somente o Owner pode utiliza-lá e não são permitido valores 0.

```JavaScript
    function priceMilesPurchase(){
    }
```

- Função responsável por definir o preço de venda das E-Miles na Vending Machine. Somente o Owner pode utiliza-lá e não são permitido valores 0.

```JavaScript
    function priceMilesSell(){
    }
```

- Função responsável por permitir a compra de E-Miles na Vending Machine. Não são permitido valores zeradas, há validação se a quantidade desejada de E-Miles tem no sistema e se o cliente tem saldo suficiente para compra.

```JavaScript
    function purchaseMilesl(){
    }
```

- Função responsável por permitir a venda de E-Miles na Vending Machine. Não são permitido valores zeradas, há validação se a quantidade de Ether na Vending Machine para efetuar a venda, e se o cliente tem E-Miles suficiente para venda.

```JavaScript
    function sellMilesl(){
    }
```