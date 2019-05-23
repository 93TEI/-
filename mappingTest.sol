pragma solidity ^0.4.11;

contract mappingTest{
    struct entry{
        uint index;
        bytes32 value;
    }
    
    mapping(address => entry) internal map;
    address[] internal keylist; // for check out how many keys in map
    
    function add(address _key, bytes32 _value) public {
        entry en = map[_key];
        en.value = _value;
        
        if(en.index > 0){ //exist
            return;
        } else {
            keylist.push(_key);
            uint keylistIndex = keylist.length - 1 ;
            en.index = keylistIndex + 1 ;
        }
    }
    
    function del(address _key) public {
        delete map[_key];
    }
    
    function contain() public returns(bool){ // exist
        return map[_key].index > 0 ;
    }
    
    function checkoutlen() view public returns(uint){
        return uint(keylist.length); // ? is this Çüº¯È¯?
    }
    
    function show(address _key) constant returns(bytes32){
        return map[_key]
    }
}