//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract myNFT is ERC721 {
    uint256 public s_tokenCounter;
    mapping(uint256 => string) public s_tokenIdToUri;

    constructor() ERC721("DogieSco", "SCO") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public{
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory){
        return s_tokenIdToUri[tokenId];
    }
}
