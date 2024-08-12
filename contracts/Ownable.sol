// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    //checks if the sender is owner
    modifier onlyOwner() {
        require(owner == msg.sender, "Caller is not the owner.");
        _;
    }

    // return the address of the owner
    function getOwner() public view returns (address) {
        return owner;
    }

    // return true id the sender is owner
    function isOwner() public view returns (bool) {
        return owner == msg.sender;
    }

    // handles transfer ownership
    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "New owner is the zero address");
        owner = _newOwner;
    }
}
