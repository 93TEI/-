pragma solidity ^0.4.11;
contract HelloEthereum{
    string public msg1; //public은 접근 제어자
    string public msg2;
    
    address public owner;
    uint8 public counter;
    
    //생성자
    function HelloEthereum(string _msg1){
        //msg1에 _msg1의 값 대입
        msg1 = _msg1;
        
        //owner의 값에 이 계약을 생성한 계정 어드레스 대입
        owner = msg.sender;
        
        //counter를 0으로 초기화 
        counter = 0;
    }
    
    //msg2 수정자 메서드 
    function getMsg2() constant public returns(sting) {
        return meg2;
    }
    
    function setCointer() public {
        //for문 사용
        for(uint8 i = 0; i<3;i++0){
            counter++;
        }
    }
}