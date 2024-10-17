// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvenOdd {
    function isEven(uint256 num) public pure returns (uint256) {
        if (num % 2 == 0) {
            return 1; // Even
        } else {
            return 0; // Odd
        }
    }
}
