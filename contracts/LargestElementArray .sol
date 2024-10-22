// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract LargestElementArray {
     function findLargest(uint256[] memory a) public pure returns (uint256) {
        require(a.length > 0, "Array cannot be empty");

        uint256 largest = a[0];

        for (uint256 i = 1; i < a.length; i++) {
            if (a[i] > largest) {
                largest = a[i];
            }
        }

        return largest;
    }
}
