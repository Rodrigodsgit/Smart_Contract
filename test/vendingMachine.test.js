const VendingMachine = artifacts.require("VendingMachine");
const expect = require('expect.js')

contract('VendingMachine', (accounts) => {
  let vending;
  let miles;
  let price;
  let pricePurchase;
  let etherBalance;
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
    })

    it('balance inicial igual a zero', async () => {
      etherBalance = await vending.GetEtherBalance();  
      const BN = {
        length: 1,
        negative: 0,
        red: null,
        words: [
          10
        ], 
      };
      expect().to.be(BN)
    })

  })


})