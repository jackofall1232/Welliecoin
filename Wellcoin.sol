// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract WELLToken is ERC20, Ownable {
    uint256 public constant TOTAL_SUPPLY = 20_000_000 * 10**18; // 20 million tokens
    uint256 public constant INITIAL_MINT = 10_000_000 * 10**18; // 10 million tokens minted initially

    constructor() ERC20("WELL Token", "WELL") {
        _mint(msg.sender, INITIAL_MINT); // Mint initial 10 million to deployer
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= TOTAL_SUPPLY, "Exceeds max supply");
        _mint(to, amount);
    }
}
