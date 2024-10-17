// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrimeCheck {
    function isPrime(uint256 num) public pure returns (uint256) {
        if (num <= 1) return 0;
        for (uint256 i = 2; i * i <= num; i++) {
            if (num % i == 0) return 0;
        }
        return 1;
    }
}
