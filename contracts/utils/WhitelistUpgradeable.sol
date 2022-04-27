// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract WhitelistUpgradeable is OwnableUpgradeable {
    mapping(address => bool) public whitelist;
    // add state vars below

    // add state vars above

    event Whitelisted(address indexed account);
    event Unwhitelisted(address indexed account);

    function __Whitelist_init() internal onlyInitializing {
        __Whitelist_init_unchained();
        __Ownable_init();
    }

    function __Whitelist_init_unchained() internal onlyInitializing {}

    function addWhitelist(address _account) public onlyOwner {
        require(!whitelist[_account], "WL: account already whitelisted");
        whitelist[_account] = true;
        emit Whitelisted(_account);
    }

    function removeWhitelist(address _account) public onlyOwner {
        require(whitelist[_account], "WL: account not whitelisted");
        whitelist[_account] = false;
        emit Unwhitelisted(_account);
    }

    function addWhitelistBatch(address[] memory _accounts) public onlyOwner {
        uint256 len = _accounts.length;
        for (uint256 i = 0; i < len; ) {
            addWhitelist(_accounts[i]);
            unchecked {
                ++i;
            }
        }
    }

    function removeWhitelistBatch(address[] memory _accounts) public onlyOwner {
        uint256 len = _accounts.length;
        for (uint256 i = 0; i < len; ) {
            removeWhitelist(_accounts[i]);
            unchecked {
                ++i;
            }
        }
    }
}
