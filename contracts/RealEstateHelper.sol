//pragma solidity >=0.4.22 <0.9.0;
pragma solidity ^0.4.23;

//import "./RealEstateTrading.sol";
import "./RealEstateFactory.sol";
contract RealEstateHelper is RealEstateFactory {

  function changeType(uint _realEstateId, string _newTypeEstate) external {
    require(msg.sender == RealEstateFactory.realEstateToOwner[_realEstateId]);
    RealEstateFactory.realEstates[_realEstateId].typeEstate = _newTypeEstate;
  }

  function changePrice(uint _realEstateId, uint _price) external {
    require(msg.sender == RealEstateFactory.realEstateToOwner[_realEstateId]);
    RealEstateFactory.realEstates[_realEstateId].price = _price;
  }

  function changeSurface(uint _realEstateId, uint _surface) external {
    require(msg.sender == RealEstateFactory.realEstateToOwner[_realEstateId]);
    RealEstateFactory.realEstates[_realEstateId].surface = _surface;
  }

  function getRealEstatesByOwner(address _owner) external view returns(uint[]) {
    uint[] memory result = new uint[](ownerRealEstateCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < realEstates.length; i++) {
      if (realEstateToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}
