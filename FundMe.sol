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

    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
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


    function withdraw() public onlyOwner {
        // for loop
        /* for takes the following parameters: starting index, ending index(bool), step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);

        // withdraw the funds

        //transfer
        //payable(msg.sender).transfer(address(this).balance); 
        //send
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess, "Send failed");

        //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }

}
