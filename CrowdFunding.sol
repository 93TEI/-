pragma solidity ^0.4.11;
contract CrowndFunding{
    
    //������ ����ü 
    struct Investor{
        address addr; // �������� ��巹��
        uint amount; // ���ھ�
    }
    
    address public owner; //��� ������
    uint public numInvestors; //������ ��
    uint public deadline; //������(UnixTime)
    string public status // ���Ȱ�� ����
    bool public ended // ��� ���� ����
    uint public goalAmount; //��ݾ�
    uint public totalAmount //�� ���ھ�
    
    mapping (uint => Investor) public investors; //������ ������ ���� ����
    
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    //������
    function CrowndFunding(uint _duration, uint _goalAmount) {
        owner = msg.sender;
        
        //������ ����(UnixTime)
        deadline = now + _duration;
        
        goalAmount = _goalAmount;
        staus = "Funding"
        ended = false;
        
        numInvestors = 0;
        totalAmount = 0;
    }
    
    //���� �� ȣ��Ǵ� �Լ�
    function fund() payable {
        //����� �����ٸ� ó�� �ߴ�
        require(!ended);
        
        Investor inv = investors[numInvestors++];
        inv.addr = msg.sender;
        inv.amount = msg.value;
        totalAmount += inv.amount;
    }
    
    //��ǥ�� �޼� ���� Ȯ��
    //+ ��� ����/���� ���ο� ���� �۱�
    function checkCoalReached () public onlyOwner{
        //����� �����ٸ� ó�� �ߴ� 
        require(!ended);
        
        //������ �����ٸ� ó�� �ߴ� 
        require(now >= deadline);
        
        if(totalAmount >= goalAmount) { // ��� ���� �� 
            status = "Campaign Succeeded";
            ended = ture;
            //��� �����ڿ��� ��࿡ �ִ� ��� �̴��� �۱�
            if(!owner.send(this.balance)){
                throw;
            }
        } else{ //��� ���� ��
            uint i = 0;
            status = "Campaign Failed";
            ended = true;
            
            //�� �����ڿ��� ���ڱ��� ������
            while (i<=numInvestors){
                if(!investors[i].addr.send(investors[i].amount)){
                    throw;
                }
                i++;
            }
        }
    }
    
    //����� �Ҹ��Ű�� �Լ�
    function kill() public onlyOwner {
        selfdestruct(owner);
    }
}