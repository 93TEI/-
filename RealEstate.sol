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
    event LogBuyRealEstate(
    );
    
    event LogSellRealEstate(
    );
    
    mapping (uint => Buyer) public buyerInfo;
    mapping (uint => Property) public propertyInfo;
    
    constructor() public {
        owner = msg.sender; //temp
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function RegisterRealEstate(string memory _propertyType, string memory _propertyName, string
    memory _propertyAddress, uint _constructionYear, uint _propertyPrice) public onlyOwner {
    }
    
    function buyRealEstate(uint _propertyId, string memory _buyerName, uint _buyerAge) public
    payable {
        require(_propertyId >= 0); //Check the property identity is equal or greater than zero
        require(msg.value == propertyPrice); //  Check whether a message sender has sent the same amount  of Ethereum as the real estate price
        require(propertyState); //Check whether the real estate property chosen by a message sender is sold out or not
        Buyer b = {};
        buyerInfo[] = b;
    }
    
    function getRealEstate(uint _propertyID) public view returns (string memory, string memory,
    string memory, uint, uint)
    {
    }
    function getBuyer(uint _propertyID) public view returns (address, string memory, uint)
    {
    }
}