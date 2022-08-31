const VendingMachine = artifacts.require("VendingMachine");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("VendingMachine", function (/* accounts */) {
  it("should assert true", async function () {
    await VendingMachine.deployed();
    return assert.isTrue(true);
  });
});
