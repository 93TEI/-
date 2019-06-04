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
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

contract AccessRestriction is Owned{
    
}