pragma solidity >=0.4.22 <0.9.0;

import "./ownable.sol";

contract RealEstateFactory is Ownable {

    event NewRealEstate(string name, string adress, uint realEstateId, uint surface, uint price);

    struct RealEstate {
      string name;
      string adress;
      uint surface;
      uint price;
    }

    RealEstate[] public realEstates;

    mapping (uint => address) public realEstateToOwner;
    mapping (address => uint) ownerRealEstateCount;

    function _createRealEstate(string _name, string _adress, uint _surface, uint _price) internal {
        uint id = realEstates.push(RealEstate(_name, _adress, _surface, _price)) - 1;
        realEstateToOwner[id] = msg.sender;
        ownerRealEstateCount[msg.sender]++;
        NewRealEstate(_name, _adress, id, _surface, _price);
    }

}
