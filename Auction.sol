pragma solidity^0.4.11;
contract Auction {
    address public hignestBidder;   //�ְ� ������ address
    uint public highestBid;     // �ְ� ������
    
    //������
    function Auction() payable {
        hignestBidder = msg.sender;
        highestBid = 0;
    }
    
    // ���� ó�� �Լ�
    function bid() public payable {
        //���� �������� �ְ� �����׺��� ������ Ȯ��
        require(msg.value > highestBid);
        
        //���� �ְ� �����ڿ��� ��ȯ�� �׼� ����
        uint refundAmount = highestBid;
        
        //������ ���
        address currentHighestBidder = highestBid;
        
        //���°� ������Ʈ 
        highestBid = msg.value;
        hignestBidder = msg.sender;
        
        // ���� �ְ�� �����ڿ��� ������ ��ȯ 
        // send �� => �۱� ���
        if(!currentHighestBidder.send(refundAmount)){
            throw; // �۱� ���� �� ��� �� �ǵ�����
        }
    }
}