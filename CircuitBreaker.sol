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
}