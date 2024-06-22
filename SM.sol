// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    // Mapping to store user balances
    mapping(address => uint256) private balances;

    // Event for logging deposits
    event Deposit(address indexed account, uint256 amount);

    // Event for logging withdrawals
    event Withdrawal(address indexed account, uint256 amount);

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    address public owner;

    constructor() {
        // Set the contract deployer as the owner
        owner = msg.sender;
    }

    // Function to deposit ether into the bank
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        
        balances[msg.sender] += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw ether from the bank
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero.");
        require(balances[msg.sender] >= amount, "Insufficient balance.");

        balances[msg.sender] -= amount;

        // Use a low-level call to transfer ether to the sender
        (bool success, ) = msg.sender.call{value: amount}("");
        if (!success) {
            // Revert the transaction if the transfer fails
            revert("Transfer failed.");
        }

        emit Withdrawal(msg.sender, amount);
    }

    // Function to get the balance of the caller
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Function to test assert statement
    function testAssert() public view {
        // This is just an example to demonstrate assert
        // It should never fail if the contract logic is correct
        assert(balances[msg.sender] >= 0);
    }
}
