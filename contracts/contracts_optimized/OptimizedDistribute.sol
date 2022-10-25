// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address internal immutable c1;
    address internal immutable c2;
    address internal immutable c3;
    address internal immutable c4;
    uint256 internal immutable unlockTime;

    constructor(address[4] memory _contributors) payable {
        c1 = _contributors[0];
        c2 = _contributors[1];
        c3 = _contributors[2];
        c4 = _contributors[3];
        unlockTime = block.timestamp + 604800;
    }

    function distribute() external {
        require(block.timestamp > unlockTime, "cannot distribute yet");
        uint256 amount;
        uint256 b = address(this).balance;
        assembly {
            amount := div(b, 4)
        }
        c1.call{value: amount}("");
        c2.call{value: amount}("");
        c3.call{value: amount}("");
        selfdestruct(payable(c4));
    }
}
