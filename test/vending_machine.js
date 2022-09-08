const VendingMachine = artifacts.require("VendingMachine");

contract('VendingMachine', (accounts) => {
  let instance;

  // Test deploy contract
  beforeEach('should be able to show if the contract has been deployed', async () => {
    instance = await VendingMachine.deployed();
  })

  it('should be able to show the amount of miles in the wallet', async () => {
    const miles = await VendingMachine.getMiles(); 
    assert.isAtLeast(miles, 0, 'Quantidade de Milhas maior que 0')
  })

  it('should be able to show the selling price of miles', async () => {
    const priceSell = await VendingMachine.getPriceSell(); 
    assert.isAtLeast(priceSell, 0, `O preco de venda e ${priceSell}`)
  })

  it('should be able to make a mile sale', async () => {
      await VendingMachine.sellMiles(1); 
    // console.log(sellMiles)
  })

});
