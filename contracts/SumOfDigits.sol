// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SumOfDigits {
    function sumDigits(uint256 num) public pure returns (uint256) {
        uint256 sum = 0;
        while (num > 0) {
            sum += num % 10;
            num /= 10;
        }
        return sum;
    }
}
