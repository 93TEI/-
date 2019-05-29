pragma solidity^0.4.11;
contract RealEstate{
    address payable public owner;
    uint propertyID = 0;
    struct Buyer {
        address buyerAddress;
        string buyerName;
        uint buyerAge;
    }
    struct Property {
        string propertyType;
        string propertyName;
        string propertyAddress;
        uint constructionYear;
        uint propertyPrice;
        bool propertyState;
    }
    event LogBuyRealEstate(address buyderAddress, uint propertyId);
    event LogSellRealEstate(string propertyType,string propertyName,string propertyAddress,uint constructionYear,uint propertyPrice,bool propertyState);
    
    mapping (uint => Buyer) public buyerInfo;
    mapping (uint => Property) public propertyInfo;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function RegisterRealEstate(string memory _propertyType, string memory _propertyName, string
    memory _propertyAddress, uint _constructionYear, uint _propertyPrice) public onlyOwner {
        emit LogSellRealEstate(_propertyType, _propertyName, _propertyAddress, _constructionYear, _propertyPrice, true);
    }
    
    function buyRealEstate(uint _propertyId, string memory _buyerName, uint _buyerAge) public
    payable {
        require(_propertyId >= 0); //Check the property identity is equal or greater than zero
        require(msg.value == Property[_propertyId].propertyPrice); //  Check whether a message sender has sent the same amount  of Ethereum as the real estate price
        require(Property[_propertyId].propertyState); //Check whether the real estate property chosen by a message sender is sold out or not
        owner.transfer(msg.value); // Transfer Ether to the owner
        
        Buyer b = buyerInfo[_propertyId]; //  All information of buyers are stored in blockchain
        b.buyerAddress = msg.sender;
        b.buyerName = _buyerName;
        b.buyerAge = _buyerAge;
        
        //event
        emit LogBuyRealEstate(msg.sender,_propertyID);
    }
    
    function getRealEstate(uint _propertyID) public view returns (string memory, string memory,
    string memory, uint, uint)
    {
        Property p = propertyInfo[_propertyID];
        return (p.propertyType, p.propertyName, p.propertyAddress, p.constructionYear, p.propertyPrice, p.propertyState);
    }
    function getBuyer(uint _propertyID) public view returns (address, string memory, uint)
    {
        Buyer by = buyerInfo[_propertyID];
        return (by.buyerAddress, by.buyerName, by.buyerAge);
    }
}