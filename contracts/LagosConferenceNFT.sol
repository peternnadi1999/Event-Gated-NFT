
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// nft-address = 0xAaEa0e09f45e8bAf2539316DFaFb13DFA97A802E

contract LagosConferenceNFT is ERC721, ERC721URIStorage, Ownable {
    constructor()
        ERC721("LagosConferenceNFT", "LCNFT")
        Ownable(msg.sender)
    {}

    function safeMint(address to, uint256 tokenId)
        public
        onlyOwner
    {
         string memory url = "ipfs://QmVHMkmbUUpq8qP4aDRHvVTedcmhD86fxsV6hjCRujQptS";
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, url);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}