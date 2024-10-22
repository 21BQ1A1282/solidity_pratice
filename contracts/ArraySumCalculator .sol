// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ArraySumCalculator {
    function sum(uint256[] memory arr) public pure returns (uint256) {
        uint256 total = 0;
     for (uint256 i = 0; i < arr.length; i++) {
            total += arr[i];
        }
       return total;
    }
}
