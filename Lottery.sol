pragma solidity^0.5.1;

contract Lottery{
    //������ �������� ���� �⺻���� Ʋ
    address payable[] users;
    uint randNonce = 0;
    modifier isOwner(){
        require(msg.sender== owner,"only owner can do that");
        _;
    }
    address owner;
    constructor() public {
        owner = msg.sender;
    }
    function join() payable public {
        // �ٵ� �� �ڵ�� msg.value�� Ȯ�θ� �ϰ� �Ⱥ����� �� ������
        require(msg.value == 0.1 ether, "Send 0.1 Ether");
        users.push(msg.sender);
    }
    function selectWinner() public isOwner {
        require(users.length > 0, "No users in the Lottery");
        user[randomNumber(users.length)].transfer(address(this).balance);
        delete users;
    }
    function randomNumber(uint _limit) private returns(uint){
        uint rand = uint(keccak256(abi.encodePacked(now,msg.sender, randNonce))) %_limit;
        randNonce++;
        return rand;
    }
}