pragma solidity ^0.4.22;

contract C{

	//uint type의 public의 visibility를 갖는 data라는 이름의 변수가 선언되어 있습니다.
	// 이는 컴파일 시 자동으로 변수 이름과 같은 data라는 public getter함수가 생성된 것입니다. 그리고, 예제에서 알 수 있습니다.
	uint public data = 42;
}

contract Caller{
	//  스마트 계약 생성
	C c = new C();


	function f() public {
		// c.data()의 함수 호출을 통해서 C로 선언된 스마트 계약의 변수인 data값에 접근할 수 있습니다. 
		uint local = c.data();
	}
}