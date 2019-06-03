// EvilBidder를 방지하려면
// 입찰금을 반환하는데 push형 송금 대신 전용 함수를 사용하여
// 사용자가 직접 인출해가도록(withdraw)하는 pull형 송금을 사용해야 한다.

pragma solidity^0.4.11;
contract AuctionWithdraw {
    address public highestBidder;   //최고 입찰자 address
    uint public highestBid;     //최고 입찰액
    mapping(address => uint) public userBalances; //반환할 액수를 관리하는 매핑
    
    //생성자
    function AuctionWithdraw() payable {
        highestBidder = msg.sender;
        highestBid = 0;
    }
    
    function bid() public payable {
        //입찰액이 현재 최고 입찰액보다 큰지 확인
        require(msg.value > highestBid);
        
        //최고 입찰자 어드레스에 대한 반환액 업데이트 
        userBalances[highestBidder] += highestBid;
        
        //상태 업데이트
        highestBid = msg.value;
        highestBidder = msg.sender;
    }
    
    function withdraw() public{
        //반환액이 0보다 큰지 확인 
        require(userBalances[msg.sender]) > 0);
        
        //반환액을 구함
        uint refundAmount = userBalances[msg.sender];
        
        //반환액 업데이트 
        userBalances[msg.sender] = 0;
        
        //입찰금 반환 처리 
        if(!msg.sender.send(refundAmount)){
            throw;
        }
    }
}