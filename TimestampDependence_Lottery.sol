pragma solidity^0.4.11;
contract TimestampDependence_Lottery{
    mapping (uint => address) public applicants;
    uint public numApplicants; //응모자 수
    address public winnerAddress; //당첨자 정보
    uint public winnerInd;

    address public owner;
    uint public timestamp;

    modifier onlyOwner() {
        
    }
}