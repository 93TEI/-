pragma solidity^0.4.11;
contract TimestampDependence_Lottery{
    mapping (uint => address) public applicants;
    uint public numApplicants; //응모자 수
    address public winnerAddress; //당첨자 정보
    uint public winnerInd;

    address public owner;
    uint public timestamp;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function TimestampDependence_Lottery() {
        owner = msg.sender;
        numApplicants = 0;
    }

    //추첨 응모 처리 함수
    function enter() public {
        //응모자가 3명 미만인지 확인
        
    }
}