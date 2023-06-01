// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import './KIP/token/KIP7/KIP7.sol';
import './KIP/token/KIP7/extensions/KIP7Pausable.sol';
import './access/Ownable.sol';

contract Favor is KIP7Pausable, Ownable {
  uint256 public constant FAVOR_SUPPLY_LIMIT = 3e8 ether; // 300,000,000

  constructor(
    string memory name,
    string memory symbol
  ) KIP7(name, symbol) Ownable() {
    _setupRole(PAUSER_ROLE, _msgSender());
    _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    _mint(_msgSender(), FAVOR_SUPPLY_LIMIT);
  }

  function setName(string memory name) public onlyOwner {
    _name = name;
  }

  function setSymbol(string memory symbol) public onlyOwner {
    _symbol = symbol;
  }
}
