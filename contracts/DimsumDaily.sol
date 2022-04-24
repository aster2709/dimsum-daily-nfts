// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "erc721a-upgradeable/contracts/ERC721AUpgradeable.sol";
import "./utils/WhitelistUpgradeable.sol";

contract DimsumDaily is ERC721AUpgradeable, WhitelistUpgradeable {
    enum SaleType {
        Private,
        Public
    }

    SaleType public saleType;
    uint256 public price;
    string internal _uri;

    // add state vars below

    // add state vars above

    event Deploy();

    function initialize(uint256 _price, string calldata uri_) external initializer {
        __ERC721A_init("Dimsum Daily NFTs", "DDS");
        price = _price;
        _uri = uri_;
        emit Deploy();
    }

    function buy(uint256 _quantity) public payable {
        if (saleType == SaleType.Private) {
            require(whitelist[msg.sender], "You are not whitelisted");
        }
        require(msg.value == _quantity * price, "Invalid price");
        _safeMint(msg.sender, _quantity);
    }

    function setPrice(uint256 _price) public onlyOwner {
        price = _price;
    }

    function setSaleType(SaleType _saleType) public onlyOwner {
        saleType = _saleType;
    }

    function switchToPublicSale(uint256 _price) public onlyOwner {
        require(saleType == SaleType.Private, "Already in public sale");
        require(_price > 0, "Invalid price");
        setPrice(_price);
        setSaleType(SaleType.Public);
    }

    function setUri(string memory uri_) public onlyOwner {
        _uri = uri_;
    }

    function withdraw() public onlyOwner {
        uint256 balance = getBalance();
        payable(owner()).transfer(balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function _startTokenId() internal pure override returns (uint256) {
        return 1;
    }

    function _baseURI() internal view override returns (string memory) {
        return _uri;
    }
}
