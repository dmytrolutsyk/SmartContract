pragma solidity >=0.4.22 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RealEstateFactory.sol";


contract TestRealEstateFactory {

  function TestCreateRealEstate() public {
    //address uniqueId = address(bytes20(sha256(abi.encodePacked(msg.sender,'block.timestamp'))));
    RealEstateFactory realEstate = RealEstateFactory(DeployedAddresses.RealEstateFactory());
    //RealEstateFactory factory = RealEstateFactory();
    realEstate storage test = realEstate.createRealEstate("House", "242 rue du Faubourg Saint Antoine", "Ma maison a esgi", 1, 30, 1, 1242145);
    //Assert.equal(, );
  }
}
