// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CLUB} from "../src/Club.sol";

contract CLUBTest is Test{
	CLUB public club;

	function setUp() public {
		club = new CLUB(address(0), address(1));
	}

	function test_Owner() public {
		assertEq(club.clubCreator(), address(1));
	}

	function testFail_JoinClub() public {
		club.joinClub(address(2));
		club.joinClub(address(2));
	}

	function test_JoinCLub() public {
		club.joinClub(address(2));
		club.joinClub(address(3));

		assertEq(club.isMember(address(2)), true);
		assertEq(club.isMember(address(3)), true);
		assertEq(club.isMember(address(4)), false);
	}

	function testFail_ChangeFeeWithoutOwner() public {
		// vm.prank(address(1));
		club.changeFee(30e18);
	}

	function testFail_ChangeFeesUnderLimit() public {
		vm.prank(address(1));
		club.changeFee(10e18);
	}

	function test_ChangeFees() public {
		vm.prank(address(1));
		club.changeFee(50e18);
		// assertEq(club.entryFees(), 50e18);
	}
}