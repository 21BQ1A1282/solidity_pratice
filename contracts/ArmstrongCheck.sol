// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArmstrongCheck {
    function isArmstrong(uint256 num) public pure returns (bool) {
        uint256 original = num;
        uint256 sum = 0;
        while (num > 0) {
            uint256 digit = num % 10;
            sum += digit * digit * digit;
            num /= 10;
        }
        return sum == original;
    }
}
