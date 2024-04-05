// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MultiSigWallet {
    // === STORAGE VARIABLES ===

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;

    struct Transaction {
        address to;
        uint value;
        bool executed;
        uint numConfirmations;
    }

    mapping(uint => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;

    // === MODIFIERS ===

    modifier onlyOwner() {
        require(isOwner[msg.sender], 'not owner');
        _;
    }

    modifier txExists(uint _txIndex) {
        require(_txIndex < transactions.length, 'tx does not exist');
        _;
    }

    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, 'tx already executed');
        _;
    }

    // === DEFAULT METHODS ===

    constructor(address[] memory _owners, uint _numConfirmationsRequired) {
        require(_owners.length >= 2, 'at least two owners required');
        require(
            _numConfirmationsRequired >= 2 && _numConfirmationsRequired <= _owners.length,
            'invalid number of required confirmations'
        );

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), 'invalid owner');
            require(!isOwner[owner], 'owner not unique');
            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
    }

    receive() external payable {}

    // === MULTISIG METHODS ===

    function submitTransaction(address _to, uint _value) public onlyOwner {
        transactions.push(
            Transaction({to: _to, value: _value, executed: false, numConfirmations: 0})
        );
    }

    function confirmTransaction(
        uint _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], 'tx already confirmed');
        transactions[_txIndex].numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;
    }

    function revokeConfirmation(
        uint _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        require(isConfirmed[_txIndex][msg.sender], 'tx not confirmed');
        transactions[_txIndex].numConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;
    }

    function executeTransaction(
        uint _txIndex
    ) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
        Transaction storage transaction = transactions[_txIndex];
        require(transaction.numConfirmations >= numConfirmationsRequired, 'cannot execute tx');
        (bool success, ) = transaction.to.call{value: transaction.value}('');
        require(success, 'tx failed');
        transaction.executed = true;
    }

    // === GETTERS ===

    function getOwners() public view returns (address[] memory) {
        return owners;
    }

    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }

    function getTransaction(
        uint _txIndex
    ) public view returns (address to, uint value, bool executed, uint numConfirmations) {
        Transaction storage transaction = transactions[_txIndex];

        return (
            transaction.to,
            transaction.value,
            transaction.executed,
            transaction.numConfirmations
        );
    }
}
