// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";
import "../lib/forge-std/src/console.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306); // This function runs first no matter what
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        console.logAddress(address(fundMe));
    }

    function testDemo() public view {
        // Name the dunction as test... something otherwise it wont work
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerMsgSender() public view {
        // assertEq(fundMe.i_owner(), msg.sender); // This will return false
        assertEq(fundMe.i_owner(), msg.sender); // Deploy address of the contract
    }

    function testFundFailsWithoutEnoughETH() public {
        vm.expectRevert();
        fundMe.fund();
    }

    function testFundUpdatesFundedDS() public {
        fundMe.fund{value: 10e18}();
        uint256 amountFunded = fundMe.getAddressToAmountFunded(address(this));
        console.logAddress(msg.sender);
        console.logAddress(address(this));
        assertEq(amountFunded, 10e18);
    }
}
