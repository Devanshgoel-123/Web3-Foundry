// SPDX-License-Identifier:MIT

pragma solidity 0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol"; // TO tell that this smart contract is a script to deploy
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function run() external {
        vm.startBroadcast();
        new FundMe();
        vm.stopBroadcast();
    }
}
