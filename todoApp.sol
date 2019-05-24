pragma solidity 0.5.8;

contract Owner {
    
    address oublic owner;
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not authorized for this process.")
        _;
    }
}

contract todoApp is Owner{
    uint256 public taskCounter;
    
    struct Task {
        uint32 id;
        string todoTask;
        bool done;
    }
    
    mapping(uint => Task) public tasks;
    
    
    
}