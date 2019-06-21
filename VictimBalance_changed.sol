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
        
        // �ܾ� Ȯ�� -> ��� -> �ܾ� ������Ʈ = ���� ���ϴ� ����
        // �ܾ�Ȯ�� 
        if(userBalacnces[msg.sender] == 0){
            MessageLog("No Balance.");
            return false;
        }

        //잔액 업데이트 전 송금할 금액 계산
        uint amount = userBalances[msg.sender];

        //잔액 업데이트
        userBalances[msg.sender] = 0;

        //자신을 호출한 어드레스로 이더 반환
        if(!(msg.sender.call.value(amount)()))
        {
            throw;
        }
        MessageLog("withdrawBalance finished.");
        return true;
    }
}