pragma solidity ^0.4.21;

contract MappingExample{

	// address type의 key와 unit type의 value로 구성된 mapping type의 balance 변수를 선언
	mapping(address => unit) public balances;

	// 함수 update는 이더리움 계정 주소에 해당하는 balances를 업데이트하게 됩니다.
	function update(unit newBalance) public{
		// msg.sender: 스마트 계약에 Message Call 또는 Transaction을 발생시킨 Sender address를 의미합니다.
		// msg.sender에 해당하는 balance를 newBalance라는 input 인자를 받아 값을 업데이트합니다.
		balances[msg.sender] = newBalance;
	}
}

contract MappingUser{
	function f() public returns (unit){
		MappingExample m = new MappingExample();
		m.update(100);

		return m.balances(this);
	}
}