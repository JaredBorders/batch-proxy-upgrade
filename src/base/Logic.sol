// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Logic {
    uint public a;
    uint public b;

    function setA(uint _a) external {
        a = _a;
    }

    function setB(uint _b) external {
        b = _b;
    }
}