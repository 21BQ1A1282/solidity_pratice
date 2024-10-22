// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ArrayReverser {
    function reverse(uint256[] memory arr) public pure returns (uint256[] memory) {
        uint256 n = arr.length;

        
        for (uint256 i = 0; i < n / 2; i++) {
            
            (arr[i], arr[n - 1 - i]) = (arr[n - 1 - i], arr[i]);
        }

        return arr;
    }
}
