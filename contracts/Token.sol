// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract Token is ERC20 {
  uint constant _initial_supply = 100 * (10**18);

  event TransferPending();
  event TransferSuccess();
  event TransferFailure();

  constructor() ERC20("Token", "TKN") {
    _mint(msg.sender, _initial_supply);

    uint256 bal = address(msg.sender).balance;
    console.log("Minted tokens to address:", msg.sender);
    console.log("Balance:                 ", bal);
  }

  function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
    uint256 beforeFromBal = address(from).balance;
    uint256 beforeToBal = address(to).balance;
    console.log("beforeFromBal:", beforeFromBal);
    console.log("beforeToBal:  ", beforeToBal);

    emit TransferPending();
    emit TransferSuccess();
    emit TransferFailure();

    uint256 afterFromBal = address(from).balance;
    uint256 afterToBal = address(to).balance;
    console.log("afterFromBal:", afterFromBal);
    console.log("afterToBal:  ", afterToBal);

    return true;
  }
}
