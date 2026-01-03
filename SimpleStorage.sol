// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // this is the solidity version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    
    uint256 myfavouriteNumber; // 0

    // uint256[] listOfFavouriteNumbers; // [0, 78, 90]
    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    // dynamic array due to the [] having nothing inside meaning it can have any size
    Person[] public listOfPeople;


    function store(uint256 _favouriteNumber) public {
        myfavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myfavouriteNumber;
    }

    // view reads state from the blockchain but doesn't modify the state
    // pure does not read nor update the state of the blockchain

    // calldata & memory refer to a temporary storage but while memory variables are modifiable, calldata variables are not modifiable
    // storage refers to permanent storage that can be modified. state variables are of this type
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
    }
}
