pragma solidity^0.4.11;
contract VictimBalance {
    mapping(address => uint) public userBalances;
    
    event MessageLog(string);
    event BalanceLog(uint);
    
    function VictimBalance(){
        
    }
    
    //�۱� ���� �� ȣ��Ǵ� �Լ�
    function addToBalance() public payable{
        userBalacnces[ms.sender] += msg.value;
    }
    
    //�̴� �����ϸ� ȣ��Ǵ� �Լ�
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