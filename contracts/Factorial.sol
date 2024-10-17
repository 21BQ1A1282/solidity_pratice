// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Factorial {
    function factorial(uint256 num) public pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 1; i <= num; i++) {
            result *= i;
        }
        return result;
    }
}
