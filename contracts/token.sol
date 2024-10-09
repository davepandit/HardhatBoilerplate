// mention some spdx license
pragma solidity ^0.8.0;

contract Token{
    string public name = "My Hardhat Token";
    string public symbol = "MHT";
    uint public totalSupply = 1000000;
    address public owner;
    mapping (address => uint) balances;

    constructor () {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address _to, uint _amount) external {
        require(balances[msg.sender] >= _amount, 'Not enough balance');
        balances[msg.sender] -= _amount;
        balances[owner] += _amount;
    }

    function balanceOf(address _account) external view returns (uint) {
        return balances[_account];
    }
}