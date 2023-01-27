// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Account} from "./base/Account.sol";

contract Factory {
    address public logic;

    function setLogic(address _logic) external {
        logic = _logic;
    }

    function createAccount() external returns (address) {
        return address(new Account(address(this)));
    }
}
