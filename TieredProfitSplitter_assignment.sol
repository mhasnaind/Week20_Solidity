pragma solidity ^0.5.0;

// lvl 2: tiered split

//main address 0x9Ec8b108930e69Dd2B3b71ef833BD221bfda7495
//ceo = 0xBdAEacADFDA135E268dD01ac25A5ce344Aba777d
//cto = 0x18fD6ddAB71F13438895BF4F3E19A837a2964720
//bob= 0x65db76C1834AE3fBdC158cebDe06BC38F5b018e2


contract TieredProfitSplitter {
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
       
        amount = points * 60; // "60%" distribution
        total += amount;
        employee_one.transfer(amount);

        amount = points * 25; // "25%" distribution
        total += amount;
        employee_two.transfer(amount);

        amount = points * 15; // "15%" distribution
        total += amount;
        employee_three.transfer(amount);

        employee_one.transfer(msg.value - total); // ceo gets the remaining amount
    }

    function() external payable {
        deposit();
    }
}
