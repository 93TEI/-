pragma solidity^0.4.11;
contract Owned{
    //DRY(do not repeat yourelf)에 따라 modifier를 이용한 접근제어를 구현할 예정
    address public owner;
    
    //접근 제어를 위한 modifier
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    //소유자 설정
    function owned() internal {
        owner = msg.sender;
    }
    
    //소유자 변경
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

contract AccessRestriction is Owned{
    string public someState;
    
    //생성자 
    function AccessRestriction(){
        //Owned에 정의된 own 함수 호출
        owned();
        
        //someState에 초기값 설정
        someState = "initial";
    }
    
    //someState의 값을 변경하는 함수 
    function uppdateSomeState(string _newState) publicc onlyOwner {
        someState = _newState;
    }
}