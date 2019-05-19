pragma solidity ^0.5.8;

contract Coin {
    // The keyword "public" makes those variables
    // easily readable from outside.
    address public minter;
    mapping (address => uint) public balances;

    // Events allow light clients to react to
    // changes efficiently.
    event Sent(address from, address to, uint amount);

    // This is the constructor whose code is
    // run only when the contract is created.
    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

/*

	주소 : 20바이트(이더리움 주소 크기)
		주소 유형에는 회원이 있으며 모든 계약서의 기반

	주소 구성원 : 밸런스 - 지갑이나 컨트랜트의 이더 잔고를 조회
			트랜스퍼 : 이더를 전송할 때 사용
			send, call, callcode, gas ..

	mint는 계약서 작성한 계정 외 다른사람 호출 불가
	require 함수는 평가 후 false면 원래 값으로 돌려놓음


*/