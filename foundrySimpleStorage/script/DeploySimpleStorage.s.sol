// SPDX-License-Identifier:MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol"; // TO tell that this smart contract is a script to deploy
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeplopySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast(); // Hey everything here and betweem should be sent to rpc url
        SimpleStorage simpleStorage = new SimpleStorage(); // this creates a new smart contract
        vm.stopBroadcast();
        return simpleStorage;
    }
}
