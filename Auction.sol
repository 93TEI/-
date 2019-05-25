pragma solidity^0.4.11;
contract Auction {
    address public hignestBidder;   //최고 입찰자 address
    uint public highestBid;     // 최고 입찰액
    
    //생성자
    function Auction() payable {
        hignestBidder = msg.sender;
        highestBid = 0;
    }
    
    // 입찰 처리 함수
    function bid() public payable {
        //현재 입찰액이 최고 입찰액보다 높은지 확인
        require(msg.value > highestBid);
        
        //기존 최고 입찰자에게 반환할 액수 설정
        uint refundAmount = highestBid;
        
        //돌려줄 사람
        address currentHighestBidder = highestBid;
        
        //상태값 업데이트 
        highestBid = msg.value;
        hignestBidder = msg.sender;
        
        // 이전 최고액 입찰자에게 입찰금 반환 
        // send 앞 => 송금 대상
        if(!currentHighestBidder.send(refundAmount)){
            throw; // 송금 실패 시 모든 거 되돌리기
        }
    }
}