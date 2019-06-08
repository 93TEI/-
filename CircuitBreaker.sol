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
}