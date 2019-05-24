pragma solidity 0.5.8;

contract todoApp {
    address public owner;
    enum TasksStatus {DONE, OPEN, ARCHIVED}
    event taskArchived(uint256 taskID, string todoContent);
    uint256 public taskCounter;
    
    struct Task {
        uint256 id;
        string todoTask;
        TasksStatus taskStatus;
        uint256 timeStamp;
    }
    
    mapping (uint => Task) public tasks;
    
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not authorized for this process.");
        _;
    }
    
    
    function createTask(string memory _todoTask) public  {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _todoTask, TasksStatus.OPEN, now);
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