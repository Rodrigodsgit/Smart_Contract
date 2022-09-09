const VendingMachine = artifacts.require("E_Mile");

contract('VendingMachine', (accounts) => {
  let vending;
  let miles;
  let etherBalance;
  let milesClient;
  let etherClient;
  let priceSell;
  let pricePurchase;


  before(async () => {
    vending = await VendingMachine.deployed();
  })

  describe('VendingMachine', () => {
    it('Inicialmente o contrato deve ter 100 E-Miles', async () => {      
      miles = await vending.getMiles();
      assert.equal(miles, 100);
    })

    it('Balance inicial igual a zero', async () => {
      etherBalance = await vending.getBalance();  
      assert.equal(etherBalance, 0);
    })

    it('Na primeira que é feito o deploy do contrato, clientes não possuem E-Miles ainda', async () =>{
      milesClient = await vending.getBalanceMilesClient();
      assert.equal(milesClient, 0);
    })

    it('O valor inicial de compra é equivalente a 1 gwei', async() =>{
      pricePurchase= await vending.getPricePurchase();
      assert.equal(pricePurchase,1000000000);
    })

    it('O valor inicial de venda é equivalente a 1 gwei', async() =>{
      priceSell= await vending.getPricePurchase();
      assert.equal(pricePurchase,1000000000);
    })

    // Owner
    it('Reabastecendo 10 E-Miles', async() =>{
      await vending.restokMiles(10);
      milesAtt = await vending.getMiles();
      assert.equal(milesAtt, 110);
    })


  })

})