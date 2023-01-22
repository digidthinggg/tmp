// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface IToken {
  function getNumber() external pure returns (int);
  function mint() external;
}
