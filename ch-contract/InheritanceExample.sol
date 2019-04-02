pragma solidity ^0.4.22;

contract owned{

	constructor(){
		owner = msg.sender;
	}

	address owner;

}


// 스마트 계약 mortal은 스마트 계약 owned의 자식 계약으로 상속받게 됩니다.
// private로 선언된 함수나 변수는 상속이 되지 않습니다. 
contract mortal is owned{

	function kill(){
		if(msg.sender==owner)
		selfdestruct(owner);
	}
}