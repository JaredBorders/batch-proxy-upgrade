// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Factory} from "../src/Factory.sol";
import {Account} from "../src/base/Account.sol";
import {Logic} from "../src/base/Logic.sol";
import {LogicV2} from "../src/base/LogicV2.sol";

contract UpgradeTest is Test {
    Factory private factory;
    Logic private logic;
    LogicV2 private logicV2;

    function setUp() public {
        factory = new Factory();
        logic = new Logic();
        logicV2 = new LogicV2();
        factory.setLogic(address(logic));
    }

    function testAccountCreation() public {
        address account = factory.createAccount();

        assertEq(Logic(account).a(), 0);
        assertEq(Logic(account).b(), 0);

        Logic(account).setA(1);
        Logic(account).setB(2);

        assertEq(Logic(account).a(), 1);
        assertEq(Logic(account).b(), 2);
    }

    function testAccountUpgrade() public {
        address account = factory.createAccount();

        assertEq(Logic(account).a(), 0);
        assertEq(Logic(account).b(), 0);

        Logic(account).setA(1);
        Logic(account).setB(2);

        factory.setLogic(address(logicV2));

        LogicV2(account).setC(3);

        assertEq(LogicV2(account).a(), 1);
        assertEq(LogicV2(account).b(), 2);
        assertEq(LogicV2(account).c(), 3);
    }

    function testMultipleAccountUpgrade() public {
        address account1 = factory.createAccount();
        address account2 = factory.createAccount();
        address account3 = factory.createAccount();

        Logic(account1).setA(1);
        Logic(account2).setA(2);
        Logic(account3).setA(3);

        factory.setLogic(address(logicV2));

        LogicV2(account1).setC(4);
        LogicV2(account2).setC(5);
        LogicV2(account3).setC(6);

        assertEq(LogicV2(account1).a(), 1);
        assertEq(LogicV2(account2).a(), 2);
        assertEq(LogicV2(account3).a(), 3);
        assertEq(LogicV2(account1).c(), 4);
        assertEq(LogicV2(account2).c(), 5);
        assertEq(LogicV2(account3).c(), 6);
    }
}
