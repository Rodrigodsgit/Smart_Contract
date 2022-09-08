const VendingMachine = artifacts.require("VendingMachine");

contract('VendingMachine', (accounts) => {
  let vending;
  let miles;
  let price;
  const initialMiles = 100;

  before(async () => {
    vending = await VendingMachine.deployed();
  })


  describe('VendingMachine', () => {
    it('should to read the miles in the contract', async () => {      
      miles = await vending.GetMiles()
      assert.equal(miles, initialMiles)
    })

    it('should to read the price miles for sell', async () => {      
      price = await vending.PriceMiles();
      console.log(price)
    })

  })


})