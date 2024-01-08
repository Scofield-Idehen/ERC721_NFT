//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/script.sol";
import {myNFT} from "../src/myNFT.sol";

contract DeployNFT is Script{

    function run() external returns(myNFT){
        vm.startBroadcast();
        myNFT mynft = new myNFT();
        vm.stopBroadcast();
        return mynft;

    }

}