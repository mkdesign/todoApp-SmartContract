# todoApp-SmartContract
You can see details of <a>this assignment</a> on etherscan.
---

### Functions
Basicaly, in Todo apps, base on the number of states for tasks, we have functions. In this case, we have 3 different states for each task : ```OPEN``` , ```DONE``` and ```ARCHIVED``` .

- ```createTask (public, payable)``` : 
-- input  : uint256 _taskID
in order to create any task your balance must be above 4000 wei. For each task you pay 100 wei. The positive credit modifier is there to check the balance.
    
- ```doneTask(public) ```: 

- ```archiveTask(private)``` :
 The reasone this function is private, is that when you done all the tasks, you can destroy the whole function. 
Each time an item gets archvied, it gets removed from tasks map and moves to the archivedTasks map. The moment the counter for tasks mapping gets 0, ```endContract``` function gets called.
After all this, the event ```taskArchvied``` emits.

- ```endContract(public, payable)``` : 
The moment you done all your todo items, this functions gets called automatically. The owner, on the other hand, can call this function and receive the rest of wei in the contract.

---

### Events : 

- ```taskArchived``` : 
This event

### Use Case : TODO App

For the purpose of this project, I spent almost 3 days to figure out a simple usecase to deploy. Every single search on the "Blockchain Use Cases" or "Smart Contracts Use Cases" would lead to either financial related topics, voting or identification. It is funny(or maybe disapoiting?) that I asked this question from my new Google Home Mini and the result was again the same(She told me ```real state, voting and identity```). Now, I really did not wanted to these use case which has been done multiple times in different sessions of this program and in this short period of time, I was not able to solve any real issue in the mentioned cases. Yet, todo cases has been very useful for me in the matter of education. This simple smart contract at leat can solve a very basic simple issue.

---

#### What's next ? 
For this ```ToDo``` Smart Contract, I am going to develop a front-end and finlize it as a ```ToDo dApp``` .

#### License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © <a href="https://github.com/mkdesign" target="_blank">Mehrad Kavian</a>.
