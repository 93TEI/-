pragma solidity ^0.4.11;
contract CrowndFunding{
    
    //투자자 구조체 
    struct Investor{
        address addr; // 투자자의 어드레스
        uint amount; // 투자액
    }
    
    address public owner; //계약 소유자
    uint public numInvestors; //투자자 수
    uint public deadline; //마감일(UnixTime)
    string public status // 모금활동 상태
    bool public ended // 모금 종료 여부
    uint public goalAmount; //모금액
    uint public totalAmount //총 투자액
    
    mapping (uint => Investor) public investors; //투자자 관리를 위한 매핑
    
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    //생성자
    function CrowndFunding(uint _duration, uint _goalAmount) {
        owner = msg.sender;
        
        //마감일 설정(UnixTime)
        deadline = now + _duration;
        
        goalAmount = _goalAmount;
        staus = "Funding"
        ended = false;
        
        numInvestors = 0;
        totalAmount = 0;
    }
    
    //투자 시 호출되는 함수
    function fund() payable {
        //모금이 끝났다면 처리 중단
        require(!ended);
        
        Investor inv = investors[numInvestors++];
        inv.addr = msg.sender;
        inv.amount = msg.value;
        totalAmount += inv.amount;
    }
    
    //목표액 달성 여부 확인
    //+ 모금 성공/길패 여부에 따라 송금
    function checkCoalReached () public onlyOwner{
        //모금이 끝났다면 처리 중단 
        require(!ended);
        
        //마감이 지났다면 처리 중단 
        require(now >= deadline);
        
        if(totalAmount >= goalAmount) { // 모금 성공 시 
            status = "Campaign Succeeded";
            ended = ture;
            //계약 소유자에게 계약에 있는 모든 이더를 송금
            if(!owner.send(this.balance)){
                throw;
            }
        } else{ //모금 실패 시
            uint i = 0;
            status = "Campaign Failed";
            ended = true;
            
            //각 투자자에게 투자금을 돌려줌
            while (i<=numInvestors){
                if(!investors[i].addr.send(investors[i].amount)){
                    throw;
                }
                i++;
            }
        }
    }
    
    //계약을 소멸시키는 함수
    function kill() public onlyOwner {
        selfdestruct(owner);
    }
}