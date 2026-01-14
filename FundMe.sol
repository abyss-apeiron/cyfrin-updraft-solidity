// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    
    function fund() public payable {
        msg.value.getConversionRate();
        // Allow users to send $
        // Have a minimum $ sent $5
        require(msg.value.getConversionRate() >= minimumUsd, "You need to spend more ETH!"); // 1 Eth = 1 * 10 ** 18 Wei
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

        // What is a revert?
        // Undo any actions that have been done, and send the remaining gas back


    // function withdraw() public {}

}
