pragma solidity^0.4.11;
contract Owned{
    //DRY(do not repeat yourelf)�� ���� modifier�� �̿��� ������� ������ ����
    address public owner;
    
    //���� ��� ���� modifier
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    //������ ����
    function owned() internal {
        owner = msg.sender;
    }
    
    //������ ����
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

contract AccessRestriction is Owned{
    string public someState;
    
    //������ 
    function AccessRestriction(){
        //Owned�� ���ǵ� own �Լ� ȣ��
        owned();
        
        //someState�� �ʱⰪ ����
        someState = "initial";
    }
    
    //someState�� ���� �����ϴ� �Լ� 
    function uppdateSomeState(string _newState) publicc onlyOwner {
        someState = _newState;
    }
}