// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract UserContract {
    uint public milesAmount;

    mapping(uint => Mile) public miles;
    
    constructor() {}

    struct Mile { 
        uint id;       
        uint price;
        address payable owner;
        bool sold;
        bool purchasinhg;
    }
    
    function PurchaseMiles(uint id) public payable {
        Mile memory mile = miles[id];

        address payable seller = mile.owner;

        require(msg.value >= mile.price,
            unicode"")
    }

    function SoldIn() public {}
}
