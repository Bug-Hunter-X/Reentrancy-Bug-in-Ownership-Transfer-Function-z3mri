# Reentrancy Vulnerability in Dapp Ownership Transfer

This repository demonstrates a common reentrancy vulnerability in smart contracts and its solution.

The `reentrancyBug.sol` file contains a Solidity smart contract with a vulnerable ownership transfer function.  A malicious actor can exploit this vulnerability to cause unintended changes to the contract's state.

The `reentrancyBugSolution.sol` file provides a corrected version of the contract, demonstrating how to mitigate the reentrancy bug.

## Vulnerability Details

The vulnerability lies in the lack of protection against reentrant calls to the `transferOwnership` function.  An attacker can create a malicious contract that calls `transferOwnership`, and then in its callback, recursively calls `transferOwnership` again before the state change in the main contract is completed. This would allow the attacker to change ownership multiple times, potentially leading to theft or other unexpected behavior.

## Solution

The solution is to use the Checks-Effects-Interactions pattern.  This means performing all checks, then making all state changes, and finally performing any external interactions.