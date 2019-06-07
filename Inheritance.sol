pragma solidity^0.5.1;
// solidity에서의 상속 개념 연습
contract ParentContract {
    uint internal simpleInteger;
    function SetInteger(uint _value) public {
        simpleInteger = _value;
    }
}

contract ChildContract is ParentContract {
    bool private simpleBool;
    function Getinteger() public view returns (uint){
        rreturn simpleInteger;
    }
}

contract client {
    ChildContract pc = new ChildContract();
    function workWithInheritance() public returns (uint) {
        pc.SetInteger(100);
        return pc.GetInteger();
    }
}
