pragma solidity 0.5.8;

contract todoApp {
    address public owner;
    enum TasksStatus {DONE, OPEN, ARCHIVED}
    event taskArchived(uint256 taskID, string todoContent);
    uint256 public taskCounter;
    uint256 balance;
    
    struct Task {
        uint256 id;
        string todoTask;
        TasksStatus taskStatus;
        uint256 timeStamp;
    }
    
    mapping (uint => Task) public tasks;
    
    constructor() payable public{
        owner = msg.sender;
        balance = msg.value;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not authorized for this process.");
        _;
    }
    
    modifier positiveCredit(){
        require(balance > 4000 wei , "You need to at least put 2 Ethers in order to use this contract");
        _;
    }
    
    function createTask(string memory _todoTask) public payable  positiveCredit {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _todoTask, TasksStatus.OPEN, now);
        balance -= 100;
    }
    
    function doneTask(uint256 _taskID) public {
        tasks[_taskID].taskStatus = TasksStatus.DONE;
        
        archiveTask(_taskID);
    }
    
    function archiveTask(uint256 _taskID) private onlyOwner {
        if(now > tasks[_taskID].timeStamp + 30 days) {
            tasks[_taskID].taskStatus = TasksStatus.ARCHIVED;
            emit taskArchived(_taskID, tasks[_taskID].todoTask);
        }
    }
}