// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleBankKG {
    enum AccountType { Checking, Savings }

    struct Account {
        uint256 checkingBalance;
        uint256 savingsBalance;
    }

    mapping(address => Account) private accounts;

    function deposit(AccountType accountType, uint256 amount) public payable {
        require(msg.value == amount, "Sent amount not the same as argument amount");

        if (accountType == AccountType.Checking) {
            accounts[msg.sender].checkingBalance += amount;
        } else {
            accounts[msg.sender].savingsBalance += amount;
        }
    }

    function withdraw(AccountType accountType, uint256 amount) public {
        if (accountType == AccountType.Checking) {
            require(amount <= accounts[msg.sender].checkingBalance, "Insufficient checking balance");
            accounts[msg.sender].checkingBalance -= amount;
        } else {
            require(amount <= accounts[msg.sender].savingsBalance, "Insufficient savings balance");
            accounts[msg.sender].savingsBalance -= amount;
        }
        payable(msg.sender).transfer(amount);
    }

    function transfer(AccountType fromAccountType, address to, uint256 amount) public {
        if (fromAccountType == AccountType.Checking) {
            require(amount <= accounts[msg.sender].checkingBalance, "Insufficient checking balance");
            accounts[msg.sender].checkingBalance -= amount;
            accounts[to].checkingBalance += amount;
        } else {
            require(amount <= accounts[msg.sender].savingsBalance, "Insufficient savings balance");
            accounts[msg.sender].savingsBalance -= amount;
            accounts[to].savingsBalance += amount;
        }
    }

    function getBalance(AccountType accountType) public view returns (uint256) {
        if (accountType == AccountType.Checking) {
            return accounts[msg.sender].checkingBalance;
        } else {
            return accounts[msg.sender].savingsBalance;
        }
    }
}