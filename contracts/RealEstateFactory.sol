//pragma solidity >=0.4.22 <0.9.0;
pragma solidity ^0.4.23;

//import "./ownable.sol";

contract RealEstateFactory {

    event NewRealEstate(string typeEstate, string adress, string description, string docHash, uint realEstateId, uint surface, uint price, address vendorAdress, uint pieceNumber, uint date);
    event SellRealEstate(string typeEstate, string adress, string description, string docHash, uint realEstateId, uint surface, uint price, address vendorAdress, uint pieceNumber, uint date);


    struct RealEstate {
      string typeEstate;
      string adress;
      string description;
      string docHash;
      uint surface;
      uint price;
      address vendorAdress;
      uint pieceNumber;
      uint date;
    }

    RealEstate[] public realEstates;

    mapping (uint => address) public realEstateToOwner;
    mapping (address => uint) ownerRealEstateCount;

    function _createRealEstate(string _typeEstate, string _adress, string _description, string _docHash, uint _realEstateId, uint _surface, uint _price, address _vendorAdress, uint _pieceNumber, uint _date) internal {
        uint id = realEstates.push(RealEstate(_typeEstate, _adress, _description, _docHash, _surface, _price, _vendorAdress, _pieceNumber, _date)) - 1;
        realEstateToOwner[id] = msg.sender;
        ownerRealEstateCount[msg.sender]++;
        emit NewRealEstate(_typeEstate, _adress, _description, _docHash, _realEstateId, _surface, _price, _vendorAdress, _pieceNumber, _date);
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
