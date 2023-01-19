// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";
import "hardhat/console.sol";

contract APIConsumer is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256 public volume;
  bytes32 private jobId;
  uint256 private fee;

  event RequestVolume(bytes32 indexed requestId, uint256 volume);

  constructor() ConfirmedOwner(msg.sender) {
    setChainlinkToken();
    setChainlinkOracle();
    jobId = "";
    fee = () / 10;
  }

  function requestVolumeData() public returns (bytes32 requestId) {
  }

  function fullfill(
  ) public recordChainlinkFulfillment(_requestId) {
  }

  function withdrawLink() public onlyOwner {
  }
}

contract Rename {
  function callAPI() public view {
    console.log(">>> Calling API");
  }

  function executeContract() public view {
  }
}
