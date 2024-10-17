// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseInteger {
    function reverse(uint256 num) public pure returns (uint256) {
        uint256 reversed = 0;
        while (num > 0) {
            reversed = reversed * 10 + (num % 10);
            num /= 10;
        }
        return reversed;
    }
}
