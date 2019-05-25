pragma solidity^0.4.11;

//카 쉐어링에서 이용자는 자동차를 이용하기 위해 이용 시간에 따른 금액을 지불해야 한다.
//이때 스마트 계약에 송금하면 자동차가 송금 상황을 확인하고 잠긴 차문을 열어주는 것
contract SmartSwitch{
    //스위치가 사용할 구조체
    struct Switch{
        address addr;
        uint endTime; // 이용 종료 시각 (Unix Time)
        bool status; //true면 이용 가능
    }
    
    address public owner;   //서버 소유자 addr
    address public iot; // iot 장치의 addr
    
    mapping (unit => Switch) public switches;   // Switch 구조체를 담을 매핑
    uint public numPaid;    //결제 횟수
    
    //서비스 소유자 권한 체크
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    //생성자
    //IOT 장치의 addr를 인자로 받음
    function SmartSwitch(address _iot){
        owner = msg.sender;
        iot = _iot;
        numPaid = 0;
    }
    
    //이더를 지불할 때 호출되는 함수
    function payToSwitch() public payable {
        //1이더가 아니면 처리 종료
        require(msg.value != 1000000000000000000);
        
        //Switch 생성 
        Swtich s = switches[numPaid++];
        s.addr = msg.sender;
        s.endTime = now + 300;
        s.status = true;
    }
    
    //스테이터스를 변경하는 함수
    //이용 종료 시각에 호출되는
    //인자는 switches의 키 값
    function updateStatus(uint _index) public onlyIOT {
        //인덱스 값에 해당하는 Switch 구조체가 없으면 종료
        require(switches[_index].addr != 0);
        
        //이용 종료 시각이 되지 않았으면 종료
        require(now > switches[_index].endTime);
        
        //스테이터스 변경
        switches[_index].status = false;
    }
    
    //지불된 이더를 인출하는 함수
    function withdrowFunds() public payable onlyOwner{
        if (!owner.send(this.balance))
            throw;
        
    }
}