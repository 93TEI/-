pragma solidity^0.5.1;

contract Lottery{
    //무제한 참여자일 때의 기본적인 틀
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
        // 근데 이 코드는 msg.value를 확인만 하고 안보내는 거 같은데
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