const VendingMachine = artifacts.require("E_Mile");

module.exports = function(deployer) {
  deployer.deploy(VendingMachine)  
};
