// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract Token is ERC20 {
  event Mint();

  uint constant _initial_supply = 100 * (10**18);

  constructor() ERC20("Token", "TKN") {
    _mint(msg.sender, _initial_supply);
  }

  function getTotalSupply() public view returns (uint256) {
    address thisAddress = address(this);
    return IERC20(thisAddress).totalSupply();
  }

  function getNumber() external pure returns (int) {
    return 8;
  }

  function mint() external {
    _mint(msg.sender, 100 * (10**18));
    emit Mint();
  }
}
