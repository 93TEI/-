pragma solidity ^0.4.11;
contract HelloEthereum{
    string public msg1; //public�� ���� ������
    string public msg2;
    
    address public owner;
    uint8 public counter;
    
    //������
    function HelloEthereum(string _msg1){
        //msg1�� _msg1�� �� ����
        msg1 = _msg1;
        
        //owner�� ���� �� ����� ������ ���� ��巹�� ����
        owner = msg.sender;
        
        //counter�� 0���� �ʱ�ȭ 
        counter = 0;
    }
    
    //msg2 ������ �޼��� 
    function getMsg2() constant public returns(sting) {
        return meg2;
    }
    
    function setCointer() public {
        //for�� ���
        for(uint8 i = 0; i<3;i++0){
            counter++;
        }
    }
}