// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
// https://eips.ethereum.org/EIPS/eip-20
interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address tokenOwner)
        external
        view
        returns (uint256 balance);

    function allowance(address tokenOwner, address spender)
        external
        view
        returns (uint256 remaining);

    function transfer(address to, uint256 tokens)
        external
        returns (bool success);

    function approve(address spender, uint256 tokens)
        external
        returns (bool success);

    function transferFrom(
        address from,
        address to,
        uint256 tokens
    ) external returns (bool success);

    // event defines the transfer of tokens from one account to another
    event Transfer(address indexed from, address indexed to, uint256 tokens);

    // event returns the tokenOwner address, the spender address and the number of tokens
    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint256 tokens
    );
}
