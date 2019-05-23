pragma solidity ^0.4.11;

contract mappingTest{
    mapping(address => bytes32) public map;
    
    function add(address _key, bytes32 _value) public {
        map[_key] = _value;
    }
    
    function del(address _key) public {
        delete map[_key];
    }
    
    function show(address _key) constant returns(bytes32){
        return map[_key]
    }
}