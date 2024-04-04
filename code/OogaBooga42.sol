// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol';

contract OogaBooga42 is ERC20, ERC20Permit {
    string constant NAME = 'OogaBooga42';
    string constant SYMBOL = 'OB42';
    uint256 constant INITIAL_SUPPLY = 1000;

    constructor() ERC20(NAME, SYMBOL) ERC20Permit(NAME) {
        _mint(msg.sender, INITIAL_SUPPLY * 10 ** decimals());
    }
}
