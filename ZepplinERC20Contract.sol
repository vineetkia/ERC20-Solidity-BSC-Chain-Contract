// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts@4.4.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.4.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.4.1/security/Pausable.sol";
import "@openzeppelin/contracts@4.4.1/access/Ownable.sol";
import "@openzeppelin/contracts@4.4.1/token/ERC20/extensions/ERC20FlashMint.sol";

/// @custom:security-contact admin@website.com
contract TokenName is ERC20, ERC20Burnable, Pausable, Ownable, ERC20FlashMint {
    constructor() ERC20("TokenName", "TKN") {
        _mint(msg.sender, 60000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
