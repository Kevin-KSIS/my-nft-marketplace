pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; 

contract MyNFTMarketplace is Ownable {

  struct MarketItem {
    uint id;
    address nftContract;
    uint256 tokenId;
    address payable seller;
    address payable buyer;
    uint256 price;
    State state;
  }

  enum State { Created, Release, Inactive }
  uint256 public listingFee = 0.025 ether;
  mapping(uint256 => MarketItem) private marketItems;

  // Events
  event MarketItemCreated (
    uint indexed id,
    address indexed nftContract,
    uint256 indexed tokenId,
    address seller,
    address buyer,
    uint256 price,
    State state
  );

  event MarketItemSold (
    uint indexed id,
    address indexed nftContract,
    uint256 indexed tokenId,
    address seller,
    address buyer,
    uint256 price,
    State state
  );

  function setListingFee (uint value) public onlyOwner {
    listingFee = value;
  }

  // List a NFT
  function createMarketItem(address nftContract,uint256 tokenId,uint256 price) public payable {}
  
  // delist a NFT
  function deleteMarketItem(uint256 itemId) public {}

  // Make for sale
  function createMarketSale(address nftContract,uint256 id) public payable {}

  function fetchActiveItems() public view returns (MarketItem[] memory) {}
  function fetchMyPurchasedItems() public view returns (MarketItem[] memory) {}
  function fetchMyCreatedItems() public view returns (MarketItem[] memory) {}


}
