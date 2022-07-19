//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;
 
 
 contract Deposit{
     address public owner;
     
     //used for security purposes in transferEther function
     constructor(){
        owner = msg.sender;    
     }
     
     //AUTOMATICALLY called when depositing eth to this contract
     receive() external payable{
     }
     
     
     function getBalance() public view returns(uint){
         return address(this).balance; //turns "this" which is the contract to address type which has a balance
     }
     
 
    // transfering ether from the contract to another address (recipient)
     function transferEther(address payable recipient, uint amount) public returns(bool){
         // checking that only contract owner can send ether from the contract to another address
         require(owner == msg.sender, "Transfer failed, you are not the owner!!");
         
         if (amount <= getBalance()){
             // transfering the amount of wei from the contract to the recipient address
             // anyone who can call this function have access to the contract's funds
             recipient.transfer(amount);
             return true;
         }else{
             return false;
         }
     }     
 }