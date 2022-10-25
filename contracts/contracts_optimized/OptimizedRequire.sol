// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    uint256 lastPurchaseTime = 1;

    function purchaseToken() external payable {
        if (block.timestamp < lastPurchaseTime) {
            revert();
        } else {
            if (msg.value != 0.1 ether) revert();
            uint256 updatedPurchaseTime;
            uint256 blockTime = block.timestamp;
            assembly {
                updatedPurchaseTime := add(blockTime, 60)
            }
            lastPurchaseTime = updatedPurchaseTime;
        }
    }
}
