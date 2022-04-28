const { ethers, network } = require("hardhat");
const { use, expect } = require("chai");
const { solidity } = require("ethereum-waffle");

use(solidity);

describe("MyNFT Contract", function () {
  let factory, inst;
  let owner, alice, bob;

  before( async () => {
    factory = await ethers.getContractFactory("MyNFT"); // insert a contract Name
    [owner, alice, bob] = await ethers.getSigners();
  });

  beforeEach(async () => {
    inst = await factory.deploy(); // insert parameters for constructor
    await inst.deployed();
  })

  xdescribe("Name, Symbol", function () {

    it("Should be success", async function() { 
      const name = await inst.name();
      expect(name).to.eq("My NFT Token");
      const symbol = await inst.symbol();
      expect(symbol).to.eq("MyN");
    });

  }); 

 
  xdescribe("mint()", function () {
    it("Should be success when Owner call mint a new NFT and transfer to Alice", async function() { 
      await expect(
        inst.mint(alice.address)
      ).to.emit(inst, "Transfer")
        .withArgs(ethers.constants.AddressZero, alice.address, 0)
    });
 
    it("Should be fail when Alice who not a owner of contract that mint a new NFT", async function() {  
      await expect(
        inst.connect(alice).mint(alice.address)
      ).to.be.revertedWith('ERC721PresetMinterPauserAutoId: must have minter role to mint')
    });

   });  

  
  xdescribe("burn()", async () => {

    it("Should be success", async function() { 
      await inst.mint(alice.address);
      await inst.burn(0);

      await expect(result).to.emit(inst, "Transfer")
        .withArgs(ethers.constants.AddressZero, alice.address, 0)
    });

    it("Should be fail", async function() {  });

  });

  
  xdescribe("pause()", function () {
    it("Should be success", async function() {  });

    it("Should be fail", async function() {  });

  });


  xdescribe("unpause()", function () {
    it("Should be success", async function() {  });

    it("Should be fail", async function() {  });

  });
  
  
  xdescribe("Should be able get Token URI", function () {
    it("Should be success", async function() {  });
  
    it("Should be fail", async function() {  });
  
  });
    
});