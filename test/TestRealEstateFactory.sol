pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RealEstateFactory.sol";

contract TestRealEstateFactory {

  function TestCreateRealEstate() {
    address addr = address(keccak256(abi.encodePacked(now)));

    RealEstateFactory factory = RealEstateFactory();
    RealEstateFactory.RealEstate storage realEstate = factory.createRealEstate("House", "242 rue du Faubourg Saint Antoine", "Ma maison à esgi", ",hqsdjhqsbfjkbdjf,bjhw", 1, 30, 1, addr, 1, 1242145);
    Assert.equal(realEstate.vendorAdress, addr);
  }
}
