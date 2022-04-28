//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol"; 

contract MyNFT is ERC721PresetMinterPauserAutoId {

    // Define state variables and events

    constructor() ERC721PresetMinterPauserAutoId("My NFT Token", "MyN", "https://mynft/nftmetadata") { 
        
    }

    // Define _internal functions


    // Define external functions


    // to support receiving ETH by default
    receive() external payable {}
    fallback() external payable {}
}