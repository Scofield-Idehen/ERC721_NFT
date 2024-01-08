//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/test.sol";
import {myNFT} from "../src/myNFT.sol";
import {DeployNFT} from "../script/DeployNFr.s.sol";

contract BasicNFTTest is Test{
    address public USER = makeAddr("user");
    string public constant PUG = 
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    DeployNFT public deployer;
    myNFT public mynft;

    function setUp() public {
        deployer = new DeployNFT();
        mynft = deployer.run();
    }

    function testnameiscorrect() public view {
        string memory expectedname = "DogieSco";
        string memory actualname = mynft.name();
        assert(keccak256(abi.encodePacked(expectedname)) == keccak256(abi.encodePacked(actualname)));
       
    }

    function testcanMintandBal() public {
        vm.prank(USER);
        mynft.mintNFT(PUG);
        assert(mynft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(mynft.tokenURI(0))));
    }

}