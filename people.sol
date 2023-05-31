// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract MPeople {
    Person[] public people;

    uint64 public peopleCount;

    address owner;

    //this modifier only allows the setDetails function to execute only when the address is from the sender account
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Person{
        string fName;
        string lName;
        // uint age;
    }

    constructor(){
        owner = msg.sender;
    }

    function setDeatails(string memory fName, string memory lName) public onlyOwner {
        addCount();
        people.push(Person(fName, lName)); 
    }

    function addCount() internal {
        peopleCount += 1;
    }
}
