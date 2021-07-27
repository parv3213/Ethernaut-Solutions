
pragma solidity 0.8.0;

interface Elevator{
    function goTo(uint _floor) external;
}

contract Building{
    Elevator internal elevator;
    bool internal reverse;

    constructor (Elevator _elevator) {
        elevator = _elevator;
    }

    function goTo() external {
        elevator.goTo(5);
    }

    function isLastFloor(uint256 _floor) external returns(bool) {
        bool _oldReverse = reverse;
        reverse = !reverse;
        return _oldReverse;
    }

}