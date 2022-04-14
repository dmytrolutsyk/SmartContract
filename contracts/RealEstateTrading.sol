pragma solidity >=0.4.22 <0.9.0;

import "./RealEstateFactory.sol";

contract TradeInterface {
  //function getUser(uint256 _id) external view returns ();
}

contract RealEstateTrading is RealEstateFactory {

  TradeInterface tradeContract;

  function setTradeContractAddress(address _address) external onlyOwner {
    tradeContract = TradeInterface(_address);
  }
}
