// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC721/ERC721.sol";

contract LagosConferenceNFT is ERC721URIStorage {
    uint256 private _tokenIds;

    constructor() ERC721("LagosConferenceNFT", "LCNFT") {}

    function mintNFT(address recipient)
        public
        returns (uint256)
    {
        _tokenIds++; 

         string memory tokenURI = "ipfs://QmVHMkmbUUpq8qP4aDRHvVTedcmhD86fxsV6hjCRujQptS"
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}