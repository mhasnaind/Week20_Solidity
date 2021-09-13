pragma solidity ^0.5.0;

// lvl 1: equal split
//main address = 0x9Ec8b108930e69Dd2B3b71ef833BD221bfda7495
//employee_one = 0xBdAEacADFDA135E268dD01ac25A5ce344Aba777d
//employee_two = 0x18fD6ddAB71F13438895BF4F3E19A837a2964720
//employee_three = 0x65db76C1834AE3fBdC158cebDe06BC38F5b018e2

contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;


    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3; 

        // @TODO: Transfer the amount to each employee
        
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        
        
         msg.sender.transfer(msg.value - amount * 3);
        
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit();
        
    }
}
