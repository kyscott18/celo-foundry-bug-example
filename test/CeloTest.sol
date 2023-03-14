// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Test } from "forge-std/Test.sol";

contract CeloTest is Test {
    address celo = 0x471EcE3750Da237f93B8E339c536989b8978a438;

    function TestCeloBalance() external {
        vm.deal(celo, 1e18);
    }
}
