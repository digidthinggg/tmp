// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "hardhat/console.sol";

import "./interfaces/IToken.sol";

contract Wallet {
  event Receive(address indexed sender, uint amount, uint balance);
  event MintSmartTokensForTokens();

  address payable public owner;

  constructor() {
    owner = payable(msg.sender);
  }

  receive() external payable {
    emit Receive(msg.sender, msg.value, address(this).balance);
    // mintSmartTokensForTokens();
  }

  function getNumber(address _token) public pure returns (int) {
    int number = IToken(_token).getNumber();
    return number;
  }

  function mintSmartTokensForTokens(address _token) public {
    IToken(_token).mint();
    emit MintSmartTokensForTokens();
  }

  function getBalance() external view returns (uint) {
    return address(this).balance;
  }
}
