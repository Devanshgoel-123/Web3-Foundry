//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;
import {Script} from "../lib/forge-std/src/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    function fundFundMe(address mostRecentDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).fund{value: 10e18}();
        vm.stopBroadcast();
    }

    function run() external {
        //set ffi=true in your foundry.foml file
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        fundFundMe(mostRecentDeployed);
    }
}

contract WithdrawFundMe is Script {}
