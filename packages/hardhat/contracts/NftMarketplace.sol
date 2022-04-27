pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
 import "@openzeppelin/contracts/access/Ownable.sol"; 
 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; 

contract MyNftMarketplace is ERC721URIStorage, Ownable {

  
  constructor() ERC721("My NFT Marketplace", "MyN") payable {
    // what should we do on deploy?
  }

  

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
