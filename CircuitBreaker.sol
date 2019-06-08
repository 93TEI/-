pragma solidity^0.4.11;
contract CircuitBreaker {
    //���׳� ������� �߰ߵǾ��� �� ��Ŷ�극��Ŀ
    bool public stopped; //true�� ��� ���� ����
    address public owner;
    bytes16 public message;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier isStopped() {
        require(!stopped);
        _;
    }
    //������ 
    function CircuitBreaker() {
        owner = msg.sender;
        stopped = false;
    }
    
    function toggleCircuit(bool _stopped) public onlyOwner {
        stopped = _stopped;
    }
    
    //msg�� ����
    //��Ŷ �극��ũ ������ ���� ���� ���� 
    function setMessage(byte16 _message) public isStopped {
        message = _message;
    }
}