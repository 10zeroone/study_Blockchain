pragma solidity ^0.4.21;

//Slight Modification to run in Remix
//Source: http://solidity.readthedocs.io/en/v0.3.2/solidity-by-example.html#safe-remote-purchase

contract Purchase {
    uint public value;
    address public seller;
    address public buyer;


    // Purchase Contract의 State 열거형 변수
    // enum type으로 Created, Locked, Inactive 3개 중의 하나의 값만 가질 수 있습니다. 
    enum State { Created, Locked, Inactive }
    State public state;


    // Ensure that `msg.value` is an even number.
    // Division will truncate if it is an odd number.
    // Check via multiplication that it wasn't an odd number.
    constructor() public payable {
        seller = msg.sender;
        value = msg.value / 2;
        require((2 * value) == msg.value);
    }

    modifier condition(bool _condition) {
        require(_condition);
        _;
    }

    // 
    modifier onlyBuyer() {
        require(msg.sender == buyer);
        _;
    }


    // onlySeller라는 modifier를 선언하고 있습니다.
    modifier onlySeller() {
        // purchase 스마트 계약은 스마트 계약의 거래 송신자와 Purchase에 저장된 셀러의 주소가 같을 경우에만 실행이 가능합니다.
        require(msg.sender == seller, "Only seller can call this.");
        _;
    }

    modifier inState(State _state) {
        require(state == _state);
        _;
    }

    // 
    event Aborted();
    event PurchaseConfirmed();
    event ItemReceived();

    /// Abort the purchase and reclaim the ether.
    /// Can only be called by the seller before
    /// the contract is locked.
    // 함수 abort()는 선언된 onlyseller() 함수 Modifier를 적용하여 정의되어 있습니다.
    function abort()
        public onlySeller inState(State.Created){
        emit Aborted();
        state = State.Inactive;
        seller.transfer(address(this).balance);
    }

    /// Confirm the purchase as buyer.
    /// Transaction has to include `2 * value` ether.
    /// The ether will be locked until confirmReceived
    /// is called.
    function confirmPurchase()
        public
        inState(State.Created)
        condition(msg.value == (2 * value))
        payable
    {
        emit PurchaseConfirmed();
        buyer = msg.sender;
        state = State.Locked;
    }

    /// Confirm that you (the buyer) received the item.
    /// This will release the locked ether.
    function confirmReceived()
        public
        onlyBuyer
        inState(State.Locked)
    {
        emit ItemReceived();
        // It is important to change the state first because
        // otherwise, the contracts called using `send` below
        // can call in again here.
        state = State.Inactive;

        // NOTE: This actually allows both the buyer and the seller to
        // block the refund - the withdraw pattern should be used.

        buyer.transfer(value);
        seller.transfer(address(this).balance);
    }
}