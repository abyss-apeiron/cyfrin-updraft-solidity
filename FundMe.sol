// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe{
    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent
        require(msg.value > 1e18, "You need to spend more ETH!"); // 1 Eth = 1 * 10 ** 18 Wei
    }

    // function withdraw() public {}

}
