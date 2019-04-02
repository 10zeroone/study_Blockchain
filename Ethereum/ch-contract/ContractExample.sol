pragma solidity ^0.4.22;

contract OwnedToken{
	TokenCreator creator;
	address owner;
	bytes32 name;

	// 생성자 정의
	constructor(bytes32 _name) public{
		owner = msg.sender;
		creator = TokenCreator(msg.sender);
		name = _name;
	}

	function changeName(bytes32 newName) public{

		if(msg.sender==address(creator))
			name = newName;
	}

	function transfer(address newOwner) public {
		if(msg.sender != owner)
			return;
		if(creator.isTokenTransferOK(owner, newOwner))
			owner = newOwner;
	}
}

// TokenCreator 스마트 계약에서 new 키워드를 통해서 OwnedToken 스마트 계약을 생성하는 예제입니다.
// 이때 Token Name을 인자로 받아 constructor 함수를 호출하게 됩니다. 
contract TokenCreator{
	function createToken(bytes32 name) public returns (OwnedToken tokenAddress){
		return new OwnedToken(name);
	}
}


//------------------------------------------------------------

contract ConstrantStateValueExample{

	uint constant x = 32**22+8;
	string constant text = "abcdef"
	bytes32 constant myHash = keccak256("abcdef");
}