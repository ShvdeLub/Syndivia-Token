pragma solidity ^0.8.9;

contract Token is Owner {
    function totalSuply() public view returns(uint8) {
        
    }

    function balanceOf(address _owner) public view returns(uint256) {

    }

    function transfer(address _to, uint256 amount) public returns(uint256 balance) {

    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        
    }
}

contract Owner {
    struct owner {
        address ownerAddress;
        uint ownerBalance;
    }

    constructor() {
        owner.ownerAddress = msg.sender;
    }

    modifier IsOwner () {
        require(msg.sender == owner.ownerAddress, "not the owner");
        _;
    }

    modifier IsFull () {
        require(owner.ownerBalance !== 0, "please mint some tokens, at least one")
    }
}