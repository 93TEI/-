// EvilBidder�� �����Ϸ���
// �������� ��ȯ�ϴµ� push�� �۱� ��� ���� �Լ��� ����Ͽ�
// ����ڰ� ���� �����ذ�����(withdraw)�ϴ� pull�� �۱��� ����ؾ� �Ѵ�.

pragma solidity^0.4.11;
contract AuctionWithdraw {
    address public highestBidder;   //�ְ� ������ address
    uint public highestBid;     //�ְ� ������
    mapping(address => uint) public userBalances; //��ȯ�� �׼��� �����ϴ� ����
    
    //������
    function AuctionWithdraw() payable {
        highestBidder = msg.sender;
        highestBid = 0;
    }
}