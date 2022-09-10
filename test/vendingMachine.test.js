const VendingMachine = artifacts.require("E_Mile");

contract('VendingMachine', (accounts) => {
  let vending;
  let miles;
  let etherBalance;
  let milesClient;
  let priceSell;
  let pricePurchase;


  before(async () => {
     vending = await VendingMachine.deployed();
  });

  describe('VendingMachine', () => {
    it('Inicialmente o contrato deve ter 100 E-Miles', async () => {      
      miles = await vending.getMiles();
      assert.equal(miles, 100);
    });

    it('Balance inicial igual a zero', async () => {
      etherBalance = await vending.getBalance();  
      assert.equal(etherBalance, 0);
    });

    it('Na primeira vez que é feito o deploy do contrato, clientes não possuem E-Miles ainda', async () =>{
      milesClient = await vending.getBalanceMilesClient();
      assert.equal(milesClient, 0);
    });

    it('O valor inicial de compra é equivalente a 1 gwei', async() =>{
      pricePurchase = await vending.getPricePurchase();
      assert.equal(pricePurchase,1000000000);
    });

    it('O valor inicial de venda é equivalente a 1 gwei', async() =>{
      priceSell = await vending.getPriceSell();
      assert.equal(priceSell,1000000000);
    });

    it('Reabastecendo 10 E-Miles', async() =>{
      await vending.restokMiles(10);
      milesAtt = await vending.getMiles();
      assert.equal(milesAtt, 110);
    });

    it('Reabastecendo 1 wei', async() =>{
      await vending.restokEther({
        value: web3.utils.toWei('1', "wei")
    });
      etherBalance = await vending.getBalance();
      assert.equal(etherBalance, 1);
    });

    it('Convertendo valores para wei', async() =>{
      const convertwei = await vending.convert(5,'wei');
      assert.equal(convertwei,5);
    });

    it('Convertendo valores para gwei', async() =>{
      const convertgwei = await vending.convert(5,'gwei');
      assert.equal(convertgwei,5000000000);
    });

    it('Convertendo valores para ether', async() =>{
      const convertether = await vending.convert(5,'ether');
      assert.equal(convertether,5000000000000000000);
    });

    it('Convertendo valores para um valor que não existe, valor deve ser zerado', async() =>{
      const convertnone = await vending.convert(5,'reais');
      assert.equal(convertnone,0);
    });

    it('Administrador sacando valor de 1 Gwei', async() =>{
      await vending.restokEther({
        value: web3.utils.toWei('1', "gwei")
      });
      await vending.withdraw(1,'gwei');
      const etherBalance2 = await vending.getBalance(); 
      assert.equal(etherBalance2, 1);
    });

    it('Alterando preço de compra de E-Miles', async() =>{
      await vending.priceMilesPurchase(200, 'gwei');
      const newPricePurchase= await vending.getPricePurchase();
      assert.equal(newPricePurchase, 200000000000);
    });

    it('Alterando preço de venda de E-Miles', async() =>{
      await vending.priceMilesSell(150, 'gwei');
      const newPriceSell = await vending.getPriceSell();
      assert.equal(newPriceSell, 150000000000);
    });

    it('Comprando 10 E-Miles', async() =>{
      await vending.purchaseMiles(10,{
        value: web3.utils.toWei('2000', "gwei")
      });
      const newMilesClient = await vending.getBalanceMilesClient();
      assert.equal(newMilesClient, 10);
    });

    
    it('Vendendo 5 E-Miles', async() =>{
      await vending.sellMiles(5);
      const soldMilesClient = await vending.getBalanceMilesClient();
      assert.equal(soldMilesClient, 5);
    });

  });

});