//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/script.sol";
import {moodNFT} from "../src/moodNft.sol";

contract DeployNFT is Script{
    function run() external returns(moodNFT){
        vm.startBroadcast();
        moodNFT moodnft = new moodNFT();
        vm.stopBroadcast();
        return moodnft;

    }
}