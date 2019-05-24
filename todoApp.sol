pragma solidity 0.5.8;

contract Owner {
    
    address public owner;
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not authorized for this process.");
        _;
    }
}

contract todoApp is Owner{
    enum TasksStatus {DONE, OPEN, ARCHIVED}
    uint256 public taskCounter;
    
    struct Task {
        uint256 id;
        string todoTask;
        TasksStatus taskStatus;
    }
    
    mapping (uint => Task) public tasks;
    
    
    function createTask(string memory _todoTask) public  {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _todoTask, TasksStatus.OPEN);
    }
    
    function doneTask(uint256 _taskID) public {
        tasks[_taskID].taskStatus = TasksStatus.DONE;
    }
    
    function getCounter() public returns(uint256) {
        return taskCounter;
    }

    
    
}