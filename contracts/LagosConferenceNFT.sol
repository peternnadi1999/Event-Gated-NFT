
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// nft-address = 0x4475A8FBeF5Cf4a92a484B6f5602A91F3abC72D8
// LagosConferenceNFTModule#LagosConferenceNFT - 0x4475A8FBeF5Cf4a92a484B6f5602A91F3abC72D8
// EventRegistrationModule#EventRegistration - 0x593552366229BDf5251a96a27dE904D047c72fDE

contract LagosConferenceNFT is ERC721, ERC721URIStorage, Ownable {
    constructor()
        ERC721("LagosConferenceNFT", "LCNFT")
        Ownable(msg.sender)
    {}

    function safeMint(address to, uint256 tokenId)
        public
        onlyOwner
    {
         string memory url = "ipfs://QmP8EPGEwNuvXH8Gj59ktWSSJL3uyzJWCZVZCndpAvNvqa";
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