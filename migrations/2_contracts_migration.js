const erc20Token = artifacts.require("./ERC20.sol");
const supplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function (deployer) {
  deployer.deploy(erc20Token, 10000, "Smart Supply Token", 18, "SST");
  deployer.deploy(supplyChain);
};
