// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySum {
    uint256[] array;

    function setArray(uint256[] memory _array) external {
        if (_array.length >= 10) revert();
        array = _array;
    }

    function getArraySum() external view returns (uint256 sum) {
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] >= (2**256 - 1)) revert();
            sum = sum + array[i];
        }
    }
}
