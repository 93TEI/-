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
        
    }
}