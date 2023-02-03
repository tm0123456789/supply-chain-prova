// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    uint256 private constant MAX_UINT256 = 2**256 - 1;
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;

    uint256 public totSupply;
    string public name;
    string public symbol;
    uint8 public decimals;

    // Create token and assign initial values
    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) {
        balances[msg.sender] = _initialAmount; // the creator owns all initial tokens
        totSupply = _initialAmount; // update total token supply
        name = _tokenName; // store the token name, number of decimals, symbol (used for display only)
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
    }

    // Transfer tokens from msg.sender to a specified address
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(
            balances[msg.sender] >= _value,
            "Insufficient funds for transfer source."
        );
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Transfer tokens from one specified address to another specified address
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        uint256 allowanceValue = allowed[_from][msg.sender];
        require(
            balances[_from] >= _value && allowanceValue >= _value,
            "Insufficient allowed funds for transfer source."
        );
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowanceValue < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value);
        return true;
    }

    // Return the current balance of a specified address
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    // Approve allowance for specific spender
    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Return the allowed amount for specific spender
    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256 remaining)
    {
        return allowed[_owner][_spender];
    }

    // Return the total number of tokens in circulation
    function totalSupply() public view returns (uint256 totSupp) {
        return totSupply;
    }
}
