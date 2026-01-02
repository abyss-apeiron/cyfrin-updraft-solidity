// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // this is the solidity version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    
    uint256 public favouriteNumber; // 0

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    // view reads state from the blockchain but doesn't modify the state
    // pure does not read nor update the state of the blockchain

}
