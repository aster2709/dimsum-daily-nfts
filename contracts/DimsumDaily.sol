// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DimsumDaily is ERC721A, Ownable {
    uint256 public price;
    string internal _uri;

    event Deploy();

    constructor(uint256 _price, string memory uri_)
        ERC721A("Dimsum Daily", "DIMSUM")
    {
        price = _price;
        _uri = uri_;
        emit Deploy();
    }

    function buy(uint256 _quantity) public payable {
        require(msg.value == _quantity * price, "Invalid price");
        _safeMint(msg.sender, _quantity);
    }

    function setPrice(uint256 _price) public onlyOwner {
        price = _price;
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
