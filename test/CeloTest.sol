// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Test } from "forge-std/Test.sol";
import { console2 } from "forge-std/console2.sol";
import { ERC20 } from "solmate/tokens/ERC20.sol";

contract CeloTest is Test {
    ERC20 celo = ERC20(0x471EcE3750Da237f93B8E339c536989b8978a438);

    // deal doesn't work in this case so use an address that already has some celo
    address addr = 0x4117f8C086a0ECA19eA21dE0AE7C5087e3C359fb;

    address recipient = makeAddr("");

    function testCeloBalance() external {
        vm.createSelectFork("celo");
        uint256 balance = celo.balanceOf(addr);

        vm.prank(addr);
        celo.transfer(recipient, 1 ether);

        assertEq(balance - 1 ether, celo.balanceOf(addr));
        assertEq(1 ether, celo.balanceOf(recipient));
    }
}
