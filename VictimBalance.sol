pragma solidity^0.4.11;
contract VictimBalance {
    mapping(address => uint) public userBalances;
    
    event MessageLog(string);
    event BalanceLog(uint);
    
    function VictimBalance(){
        
    }
    
    //송금 받을 때 호출되는 함수
    function addToBalance() public payable{
        userBalacnces[ms.sender] += msg.value;
    }
    
    //이더 인출하면 호출되는 함수
    function withdrawBalance() public payable returns(bool){
        MessageLog("withdrawBalance started");
        BalanceLog(this.balance);
        
        // 잔액 확인 -> 출금 -> 잔액 업데이트 = 공격 당하는 구조
        // 잔액확인 
        if(userBalacnces[msg.sender] == 0){
            MessageLog("No Balance.");
            return false;
        }
        //출금 
        if(!(msg.sender.call.value(userBalacnces[msg.sender])()))
        {
            throw;
        }
        // 잔액 업데이트
        userBalances[msg.sender] = 0;
        
        MssageLog("withdrawBalance finished");
        
        return false;
    }
}