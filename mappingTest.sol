pragma solidity ^0.4.11;

contract mappingTest{
    mapping(address => bytes32) public map;
    address[] internal keylist; // for check out how many keys in map
    
    function add(address _key, bytes32 _value) public {
        map[_key] = _value;
    }
    
    function del(address _key) public {
        delete map[_key];
    }
    
    function checkoutlen() view public returns(uint){
        return uint(keylist.length); // ? is this Çüº¯È¯?
    }
    
    function show(address _key) constant returns(bytes32){
        return map[_key]
    }
}