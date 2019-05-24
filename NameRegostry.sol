pragma solidity ^0.4.11;
contract NameRegistry{
    //계약을 나타낼 구조체 
    struct Contract{
        address owner;
        address addr;
        bytes32 description;
    }
    
    //등록된 레코드 수 
    uint public numContracts;
    
    //계약을 저장할 매핑
    mapping (bytes32 => Contract) public contracts;
    
    //생성자 
    function NameRegistry(){
        numContracts = 0;
    }
    
    //계약 등록 
    function register(bytes32 _name) public returns(bool){
        //아직 사용되지 않은 이름이면 신규 등록 
        if (contracts[_name].owner == 0) {
            Contract con = contracts[_name];
            con.owner = msg.sender; // 함수를 호출한 계정 address
            numContracts++;
            return true;
        } else {
            return false;
        }
    }
    
    function unregister(bytes32 _name) public returns (bool) {
        if(contracts[_name].owner == msg.sender){
            contracts[_name].onwer = 0; // 0은 없다는 약속
            numContracts--;
            return true;
        } else {
            return false;
        }
    }
    
    //계약 소유자 변경
    function changeOwner(bytes32 _name, address _newOwner) public onlyOwner(_name) {
        contracts[_name].owner = _newOwner;
    }
    
    //계약 소유자 정보 확인
    function getOwner(bytes32 _name) constant public returns (address) {
        return contrats[_name].owner;
    }
    
    //계약 어드레스 변경
    function setAddr(bytes32 _name, address _addr) public onlyOwenr(_name) {
        contracts[_name].addr = _addr;
    }
    
    //계약 어드레스 확인
    function getAddr(bytes32 _name) constant public returns (address) {
        return contracts[_name].addr;
    }
    
    //계약 설명 변경
    function setDescription(btyes32 _name, byte32 _description) public onlyOwner(_name) {
        contracts[_name].description = _description;
    }
    
    //계약 설명 확인
    function getDescription(bytes32 _name) constant public returns (bytes32) {
        return contracts[_name].description;
    }
    
    //함수 호출 전 먼저 처리되는 modifier 정의
    modifier onlyOwner(bytes32 _name){
        require(contracts[_name] == msg.sender);
        _;
    }
}