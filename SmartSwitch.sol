pragma solidity^0.4.11;

//ī ������� �̿��ڴ� �ڵ����� �̿��ϱ� ���� �̿� �ð��� ���� �ݾ��� �����ؾ� �Ѵ�.
//�̶� ����Ʈ ��࿡ �۱��ϸ� �ڵ����� �۱� ��Ȳ�� Ȯ���ϰ� ��� ������ �����ִ� ��
contract SmartSwitch{
    //����ġ�� ����� ����ü
    struct Switch{
        address addr;
        uint endTime; // �̿� ���� �ð� (Unix Time)
        bool status; //true�� �̿� ����
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
    
    //�̴��� ������ �� ȣ��Ǵ� �Լ�
    function payToSwitch() public payable {
        //1�̴��� �ƴϸ� ó�� ����
        require(msg.value != 1000000000000000000);
        
        //Switch ���� 
        Swtich s = switches[numPaid++];
        s.addr = msg.sender;
        s.endTime = now + 300;
        s.status = true;
    }
    
    //�������ͽ��� �����ϴ� �Լ�
    //�̿� ���� �ð��� ȣ��Ǵ�
    //���ڴ� switches�� Ű ��
    function updateStatus(uint _index) public onlyIOT {
        //�ε��� ���� �ش��ϴ� Switch ����ü�� ������ ����
        require(switches[_index].addr != 0);
        
        //�̿� ���� �ð��� ���� �ʾ����� ����
        require(now > switches[_index].endTime);
        
        //�������ͽ� ����
        switches[_index].status = false;
    }
    
    //���ҵ� �̴��� �����ϴ� �Լ�
    function withdrowFunds() public payable onlyOwner{
        if (!owner.send(this.balance))
            throw;
        
    }
}