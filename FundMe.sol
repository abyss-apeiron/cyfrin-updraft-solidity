// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5;
    
    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent $5
        require(msg.value >= minimumUsd, "You need to spend more ETH!"); // 1 Eth = 1 * 10 ** 18 Wei


        // What is a revert?
        // Undo any actions that have been done, and send the remaining gas back


    }

    // function withdraw() public {}

    function getPrice() public {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
    }
    function getConversionRate() public {

    }
    function getVersion() public view returns (uint256) {

    }

}
