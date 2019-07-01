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

    function enter() public {
        //응모자가 3명 미만인지 확인
        require(numApplicants < 3);

        //이미 응모한 사람이 아닌지 확인
        for(uint i=0; i<numApplicants; i++){
            require(applicants[i] != msg.sender);
        }

        //응모 접수 처리
        applicants[numApplicants++] = msg.sender;
    }

    // 추첨
    function hold() public onlyOwner {
        //응모자가 3명 이상인지 확인 
        require(numApplicants == 3);

        //타임스탬프 값 설정
        timestamp = block.timestamp;

        //추첨
        winnerInd = timestamp % 3 ;
        winnerAddress = applicants[winnerInd];
    }
}