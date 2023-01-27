// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract LogicV2 {
    uint public a;
    uint public b;
    uint public c;

    function setA(uint _a) external {
        a = _a;
    }

    function setB(uint _b) external {
        b = _b;
    }

    function setC(uint _c) external {
        c = _c;
    }
}