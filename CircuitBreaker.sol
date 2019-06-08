pragma solidity^0.4.11;
contract CircuitBreaker {
    //버그나 취약점이 발견되었을 때 서킷브레이커
    bool public stopped; //true면 긴급 정지 상태
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
    //생성자 
    function CircuitBreaker() {
        owner = msg.sender;
        stopped = false;
    }
    
    function toggleCircuit(bool _stopped) public onlyOwner {
        stopped = _stopped;
    }
    
    //msg값 변경
    //서킷 브레이크 상태일 때만 수정 가능 
    function setMessage(byte16 _message) public isStopped {
        message = _message;
    }
}