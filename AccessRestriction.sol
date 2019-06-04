pragma solidity^0.4.11;
contract Owned{
    //DRY(do not repeat yourelf)에 따라 modifier를 이용한 접근제어를 구현할 예정
    address public owner;
    
    //접근 제어를 위한 modifier
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    //소유자 변경
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

contract AccessRestriction is Owned{
    
}