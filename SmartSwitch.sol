pragma solidity^0.4.11;

//ī ������� �̿��ڴ� �ڵ����� �̿��ϱ� ���� �̿� �ð��� ���� �ݾ��� �����ؾ� �Ѵ�.
//�̶� ����Ʈ ��࿡ �۱��ϸ� �ڵ����� �۱� ��Ȳ�� Ȯ���ϰ� ��� ������ �����ִ� ��
contract SmartSwitch{
    //����ġ�� ����� ����ü
    struct Switch{
        address addr;
        uint endTime; // �̿� ���� �ð� (Unix Time)
        bool state; //true�� �̿� ����
    }
    
    address public owner;   //���� ������ addr
    address public iot; // iot ��ġ�� addr
    
    mapping (unit => Switch) public switches;   // Switch ����ü�� ���� ����
    uint public numPaid;    //���� Ƚ��
    
    //���� ������ ���� üũ
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    //������
    //IOT ��ġ�� addr�� ���ڷ� ����
    function SmartSwitch(address _iot){
        owner = msg.sender;
        iot = _iot;
        numPaid = 0;
    }
    
    
}