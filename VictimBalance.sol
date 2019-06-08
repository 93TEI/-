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
        
        if(userBalacnces[msg.sender] == 0){
            MessageLog("No Balance.");
            return false;
        }
        
        if(!(msg.sender.call.value(userBalacnces[msg.sender])()))
        {
            throw;
        }
        
        userBalances[msg.sender] = 0;
        
        MssageLog("withdrawBalance finished");
        
        return false;
    }
}