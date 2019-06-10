pragma solidity^0.4.11;

contract EvilReceiver{
    address public target; //공격 대상 계약의 addr
    event MessageLog(string);
    event BalanceLog(uint);

    function EvilReceiver(address _target) {
        target = _target;
    }
    
}