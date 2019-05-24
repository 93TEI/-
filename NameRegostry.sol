pragma solidity ^0.4.11;
contract NameRegistry{
    //����� ��Ÿ�� ����ü 
    struct Contract{
        address owner;
        address addr;
        bytes32 description;
    }
    
    //��ϵ� ���ڵ� �� 
    uint public numContracts;
    
    //����� ������ ����
    mapping (bytes32 => Contract) public contracts;
    
    //������ 
    function NameRegistry(){
        numContracts = 0;
    }
    
    //��� ��� 
    function register(bytes32 _name) public returns(bool){
        //���� ������ ���� �̸��̸� �ű� ��� 
        if (contracts[_name].owner == 0) {
            Contract con = contracts[_name];
            con.owner = msg.sender; // �Լ��� ȣ���� ���� address
            numContracts++;
            return true;
        } else {
            return false;
        }
    }
    
    function unregister(bytes32 _name) public returns (bool) {
        if(contracts[_name].owner == msg.sender){
            contracts[_name].onwer = 0; // 0�� ���ٴ� ���
            numContracts--;
            return true;
        } else {
            return false;
        }
    }
    
    //��� ������ ����
    function changeOwner(bytes32 _name, address _newOwner) public onlyOwner(_name) {
        contracts[_name].owner = _newOwner;
    }
    
    //��� ������ ���� Ȯ��
    function getOwner(bytes32 _name) constant public returns (address) {
        return contrats[_name].owner;
    }
    
    //��� ��巹�� ����
    function setAddr(bytes32 _name, address _addr) public onlyOwenr(_name) {
        contracts[_name].addr = _addr;
    }
    
    //��� ��巹�� Ȯ��
    function getAddr(bytes32 _name) constant public returns (address) {
        return contracts[_name].addr;
    }
    
    //��� ���� ����
    function setDescription(btyes32 _name, byte32 _description) public onlyOwner(_name) {
        contracts[_name].description = _description;
    }
    
    //��� ���� Ȯ��
    function getDescription(bytes32 _name) constant public returns (bytes32) {
        return contracts[_name].description;
    }
    
    //�Լ� ȣ�� �� ���� ó���Ǵ� modifier ����
    modifier onlyOwner(bytes32 _name){
        require(contracts[_name] == msg.sender);
        _;
    }
}