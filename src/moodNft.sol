//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract moodNft is ERC721{

    //error
    error mood__notOwner();

    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    constructor(string memory sadSvgImageUri, string memory happysvgImageUri) ERC721("MoodSco", "Hepie") {
        s_tokenCounter = 0;
        s_sadSvg = sadSvgImageUri;
        s_happySvg = happysvgImageUri;   
    }
    enum{
        Happy,
        Sad
    }

    mapping (uint256 => string) private s_tokenIdToMood; 

    function mintNFT() public{
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = "Happy";
        s_tokenCounter++;
    }

    function _base64 () internal pure override returns (string memory){
        return "data:application/json;base64,";
    }

    function MooodSwingNFT(uint tokenId) public{
        if (!_isApprovedOrOwner(msg.sender, tokenId)){
            revert mood__notOwner();
        }
        if(s_tokenIdToMood[tokenId] == "Happy"){
            s_tokenIdToMood[tokenId] = "Sad";
        }else{
            s_tokenIdToMood[tokenId] = "Happy";
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory){

        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == "Happy"){
            imageURI = s_happySvg;

            }else {
                imageURI = s_sadSvg;
            }


        return 
            string(
                abi.encodePacked(
                     _base64(),
                    Base64.encode(
                        bytes(
                        abi.encodePacked(
                            '{ "name": "',
                            name(),
                            '", "description": "An NFT that changes based on the mood of the owner","attributes": [{"trait_type": "moodiness", "Value": 100}], "image": "', imageURI, '"}'
                    )
                )
            )
        ));

     
}  
