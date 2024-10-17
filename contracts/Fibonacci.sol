// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fibonacci {
    function fibonacci(uint256 n) public pure returns (uint256[] memory) {
        uint256[] memory series = new uint256[](n);
        if (n > 0) series[0] = 0;
        if (n > 1) series[1] = 1;
        
        for (uint256 i = 2; i < n; i++) {
            series[i] = series[i - 1] + series[i - 2];
        }
        return series;
    }
}
