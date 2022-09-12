[Voltar](../Readme.md)


## Deploy Local


```bash
truffle deploy
```

Deploy realizado em rede local

![deploy local](../assets/deploy_local.png)


## Deploy na rede Rinkeby


#### Variaveis de Ambiente

utilizamos o dotenv para a criacao das variaves de ambiente 

.env modelo

![.env](../assets/env.png)


Deploy realizado na rede Rinkeby

```bash
truffle deploy --network rinkeby
```

![deploy oficial](../assets/deploy_rinkeby.png)

Em seguida podemos ver mais alguma informações interessantes a respeito do deploy realizado. Como a quantidade de requests feitas:

![deploy requests](../assets/requests.png)

E também informações sobre o deploy em si.

![deploy ](../assets/deploy.jpeg)

Por fim o endereço do deploy na rede de testes Rinkeby Etherscan.

![deploy ](../assets/Etherscan.png)