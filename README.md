# Bank Smart Contract

This project contains a simple bank smart contract written in Solidity. The contract allows users to deposit and withdraw Ether, and it includes safety checks using `require()`, `assert()`, and `revert()` statements.

## Features

- **Deposit Ether**: Users can deposit Ether into their account.
- **Withdraw Ether**: Users can withdraw Ether from their account, provided they have sufficient balance.
- **Get Balance**: Users can check their account balance.
- **Owner-Only Functions**: Certain functions are restricted to the contract owner.
- **Safety Checks**: The contract uses `require()`, `assert()`, and `revert()` to handle errors and ensure correct behavior.

## Prerequisites

- Remix IDE (optional, for online development)

## Getting Started

### Running on Remix IDE

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file and name it `SimpleBank.sol`.
3. Copy and paste the Solidity code into the new file.
4. Compile the contract using the appropriate compiler version (0.8.x).
5. Deploy the contract using the "JavaScript VM" environment.
6. Interact with the contract's functions directly from the Remix interface.
