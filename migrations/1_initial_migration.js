const Migrations = artifacts.require("RealEstateFactory.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
