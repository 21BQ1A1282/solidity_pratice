// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Cube {
    function findCube(uint256 num) public pure returns (uint256) {
        return num * num * num;
    }
}
