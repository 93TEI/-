pragma solidity^0.5.11;
contract MarketPlaceTOD{
    address public owner;
    uint public price;  //단가
    uint public stockQuantity   //재고량

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    event UpdatePrice(uint _price);
    event Buy(uint _price, uint _quantity, uint _value, uint _change);

    //생성자
    function MarketPlaceTOD(){
        owner = msg.sender;
        price = 1;
        stockQuantity = 100;
    }

    //단가 업데이트
    function updatePrice(uint _price) public onlyOwner{
        price = _price;
        UpdatePrice(price);
    }
}