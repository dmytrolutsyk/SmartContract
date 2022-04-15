pragma solidity >=0.4.22 <0.9.0;
//pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

//import "./ownable.sol";

contract RealEstateFactory {

    event NewRealEstate(string typeEstate, string adress, string description, uint realEstateId, uint surface, uint price, address vendorAdress, uint date);
    event SellRealEstate(string typeEstate, string adress, string description, uint realEstateId, uint surface, uint price, address vendorAdress, uint date);


    struct RealEstate {
      string typeEstate;
      string adress;
      string description;
      uint realEstateId;
      uint surface;
      uint price;
      address vendorAdress;
      uint date;
    }

    RealEstate[] public realEstates;

    mapping (uint => address) public realEstateToOwner;
    mapping (address => uint) ownerRealEstateCount;

    function createRealEstate(string calldata typeEstate, string calldata adress, string calldata description, uint realEstateId, uint surface, uint price, address vendorAdress, uint date) external returns (RealEstate memory){
        realEstates.push(RealEstate(typeEstate, adress, description, realEstateId, surface, price, vendorAdress, date));
        uint id = realEstates.length - 1;
        realEstateToOwner[id] = msg.sender;
        ownerRealEstateCount[msg.sender]++;
        emit NewRealEstate(typeEstate, adress, description, realEstateId, surface, price, vendorAdress, date);
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

}
