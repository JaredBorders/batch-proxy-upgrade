// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Factory} from "../Factory.sol";

contract Account {
    bytes32 internal constant _STORAGE_SLOT =
        bytes32(uint256(keccak256("project.storage")) - 1);

    struct AddressSlot {
        address value;
    }

    error InvalidStore();
    error InvalidLogic();

    constructor(address _store) {
        _getAddressSlot(_STORAGE_SLOT).value = _store;
    }

    function _getAddressSlot(bytes32 slot)
        internal
        pure
        returns (AddressSlot storage r)
    {
        assembly {
            r.slot := slot
        }
    }

    function _delegate(address implementation) internal virtual {
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(
                gas(),
                implementation,
                0,
                calldatasize(),
                0,
                0
            )
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }

    function _implementation() internal view returns (address) {
        address store = _getAddressSlot(_STORAGE_SLOT).value;
        if (store == address(0)) revert InvalidStore();
        address logic = Factory(store).logic();
        if (logic == address(0)) revert InvalidLogic();
        return logic;
    }

    function _fallback() internal {
        _beforeFallback();
        _delegate(_implementation());
    }

    fallback() external payable {
        _fallback();
    }

    receive() external payable {
        _fallback();
    }

    function _beforeFallback() internal {}
}
