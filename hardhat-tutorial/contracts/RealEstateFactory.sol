//pragma solidity >=0.4.22 <0.9.0;
pragma solidity ^0.4.21;
pragma experimental ABIEncoderV2;

//import "./ownable.sol";

contract RealEstateFactory {

    event NewRealEstate(string typeEstate, string adress, string description, uint surface, uint price, address vendorAdress, uint date);
    //event SellRealEstate(string typeEstate, string adress, string description, uint realEstateId, uint surface, uint price, address vendorAdress, uint date);


    struct RealEstate {
      string typeEstate;
      string adress;
      string description;
      uint surface;
      uint price;
      address vendorAdress;
      uint date;
    }

    RealEstate[] public realEstates;

    mapping (uint => address) public realEstateToOwner;
    mapping (address => uint) ownerRealEstateCount;

    function createRealEstate(string typeEstate, string adress, string description, uint surface, uint price, uint date) external returns (RealEstate memory){
        realEstates.push(RealEstate(typeEstate, adress, description, surface, price, msg.sender, date));
        uint id = realEstates.length - 1;
        realEstateToOwner[id] = msg.sender;
        ownerRealEstateCount[msg.sender]++;
        emit NewRealEstate(typeEstate, adress, description, surface, price, msg.sender, date);
        return realEstates[id];
    }

    function buyRealEstate(uint realEstateId) external {
      RealEstate storage estateToSell = realEstates[realEstateId];
      address oldOwner = realEstateToOwner[realEstateId];
      estateToSell.vendorAdress = oldOwner;

      require(oldOwner != msg.sender);
      realEstateToOwner[realEstateId] = msg.sender;
      ownerRealEstateCount[msg.sender]++;
      ownerRealEstateCount[oldOwner]--;
    }

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

    function getRealEstatesByOwner(address _owner) external view returns(uint[] memory) {
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
