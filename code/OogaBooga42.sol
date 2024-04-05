// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol';

contract OogaBooga42 is ERC20, ERC20Permit {
    // === STRUCTURES ===

    struct Operation {
        address to;
        int256 value;
        bool executed;
        uint256 numConfirmations;
    }

    // === CONSTANTS ===

    string constant NAME = 'OogaBooga42';
    string constant SYMBOL = 'OB42';
    uint256 constant INITIAL_SUPPLY = 1000;

    // === STORAGE VARIABLES ===

    address[] public owners;
    uint256 public numConfirmationsRequired;
    mapping(address => bool) private isOwner;
    mapping(uint256 => mapping(address => bool)) public isConfirmed;
    Operation[] public operations;

    // === CONSTRUCTOR ===

    constructor(
        address[] memory _owners,
        uint256 _numConfirmationsRequired
    ) ERC20(NAME, SYMBOL) ERC20Permit(NAME) {
        require(_owners.length >= 2, 'at least two owners required');
        require(
            _numConfirmationsRequired >= 2 && _numConfirmationsRequired <= _owners.length,
            'invalid number of required confirmations'
        );

        for (uint256 i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), 'invalid owner');
            require(!isOwner[owner], 'owner not unique');
            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
        _mint(msg.sender, INITIAL_SUPPLY * 10 ** decimals());
    }

    // === MODIFIERS ===

    modifier onlyOwner() {
        require(isOwner[msg.sender], 'not owner');
        _;
    }

    modifier txExists(uint256 _txIndex) {
        require(_txIndex < operations.length, 'operation does not exist');
        _;
    }

    modifier notExecuted(uint256 _txIndex) {
        require(!operations[_txIndex].executed, 'operation already executed');
        _;
    }

    // === MULTISIG METHODS ===

    function submitOperation(address _to, int256 _value) public onlyOwner {
        require(_to != address(0), 'invalid owner');
        require(_value != 0, 'useless operation');
        operations.push(Operation({to: _to, value: _value, executed: false, numConfirmations: 0}));
    }

    function confirmOperation(
        uint256 _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], 'operation already confirmed');
        operations[_txIndex].numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;
    }

    function revokeConfirmation(
        uint256 _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        require(isConfirmed[_txIndex][msg.sender], 'operation not confirmed');
        operations[_txIndex].numConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;
    }

    function executeOperation(
        uint256 _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        Operation storage operation = operations[_txIndex];
        require(operation.numConfirmations >= numConfirmationsRequired, 'not enough confirmations');
        if (operation.value > 0) {
            _mint(operation.to, uint256(operation.value));
        } else {
            _burn(operation.to, uint256(-operation.value));
        }
        operation.executed = true;
    }
}
