//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/script.sol"; 
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {myNFT} from "../src/myNFT.sol";

contract MintNFT is Script{
    string public constant PUG = 
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run() external{
        address mostRecentNFT = DevOpsTools.get_most_recent_deployment("myNFT", block.chainid);
        mostNNewNFT(mostRecentNFT);

    }

    function mostNNewNFT(address contractAddress) public{
        vm.startBroadcast();
        myNFT(contractAddress).mintNFT(PUG);
        vm.stopBroadcast();
    }
}