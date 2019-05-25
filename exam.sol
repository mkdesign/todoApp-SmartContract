pragma solidity 0.5.8;

contract houseOwner {
    
    address public owner;
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
    
}

interface iHomeState {
    enum FrontDoorState {OPEN, CLOSED}
    enum HealthState {CLEAN, DIRTY}
    enum KitchenState {EMPTY,FULL }
    enum WorkersStates {CLEANER, CHEF }
}


//abstract
contract House is houseOwner, iHomeState  {
    FrontDoorState frontDoor;
    WorkersStates staffState;
    HealthState cleaningState;
    KitchenState needToOrder;
    mapping (address => WorkersStates) staff;
    modifier isChef() {
        require(staff[msg.sender] == WorkersStates.CHEF );
        _;
    }
    modifier isCleaner() {
        require(staff[msg.sender] == WorkersStates.CLEANER );
        _;
    }
    
    modifier isHomeLocked() {
        require(frontDoor == FrontDoorState.CLOSED);
        _;
    }
    
    function dirtyShop() public;
    function order() public;
    
        
    
    function hire(address _staff, uint Position) private onlyOwner {
        staff[_staff ] = WorkersStates(Position);
    }
}

contract houseControl is House {
    function cleanHouse() public isCleaner {
        cleaningState = HealthState.DIRTY;
    }
    
    function order() onlyOwner public{
        needToOrder = KitchenState.EMPTY;
    }
    
    
}


