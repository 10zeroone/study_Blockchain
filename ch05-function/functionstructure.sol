pragma solidity ^0.4.21;

// FunctionExample 스마트 계약은 arithmetics라고 하는 public 함수를 갖고 있습니다.
contract FunctionExample{
	// atrithmetics() 함수는 _a와 _b라는 양수 정수형(unit) input 인자를 정의하고 있습니다.
	// 이때, Input 인자의 매개변수명에 언더스코어(_)로 시작하는 것은 이더리움의 코딩 관습으로 강제사항은 아닙니다.
	function atrithmetics(unit _a, unit _b) public pure returns (unit o_sum, unit o_product){
		// o_sum이라는 양수 정수와 o_product라는 양수 정수 두 값을 반환합니다.
		o_sum =  _a + _b;
		o_product = _a + _b;
	}
}


//------------------------------------------------------------

contract FunctionCallsExample{
	// 내부 함수 호출은 Contract 내부에서 함수를 호출합니다. 동일 스마트 계약 내 함수들끼리만 가능합니다. 
	// 함수 g가 함수 f를 호출하는 것을 볼 수 있습니다.
	function g(unit _a) public pure returns (unit ret){
		return f();
	}

	// 함수 f는 g()호출한 반환값화 f()함수를 호출한 반환값을 다시 반환하고 있습니다.
	function f(unit _a) internal pure returns (unit ret){
		return g(7)+f();
	}
}



//------------------------------------------------------------
contract InfoFeed{
	function info() public payable returns (unit ret){
		return 42;
	}
}

contract Consumer{
	InfoFeed feed;

	function setFeed(address addr) public {
		feed = InfoFeed(addr);
	}

	function callFeed() public {
		// Message Call 형태이므로 value와 gas가 전달되어야 하며, .value()와 .gas()함수를 통해서 호출됩니다.
		// 10 wei의 Ether와 800 gas를 이용해서 message call을 발생시키고 있습니다.
		feed.info.value(10).gas(800)();
	}

}





//------------------------------------------------------------
contract ValueAssignmentExample{
	// 정수형 배열
	unit[] data;

	// function f는 3개의 output 인자를 가지며, 3개의 값을 반환합니다.
	function f() public pure returns(uint, bool, uint){
		// 함수 f() 는 return 키워드를 통해 3개의 리턴 값을 반환하고 있습니다.
		return (7, true, 2);
	}

	function g() public{
		// 함수 f() 의 3개의 리턴 값을 3개의 변수로 구성된 리스트에 한 번에 값을 할당하는 것을 확인할 수 있습니다.
		(uint x, bool b, uint y) = f();

		(x, y) = (y, x);

		(data.length,,)=f();

		(x,)=(1,);
	}
}



//------------------------------------------------------------
contract ScopeExample{



	function scoping() public {
		uint i = 0;

		// scoping() 함수를 보면 uint type의 same1을 첫 번째 while 블록에서 정의하고 있습니다.
		while(i++<1){
			uint same1 = 0;
		}

		// 다시 두 번째 while 블록에서 uint type의 same1의 변수를 다시 선언하고 있습니다.
		// 그리고 same1 변수는 동일한 변수가 두 번 선언되어, 
		// compile 시에 식별자가 이미 선언되었다(Identifier already declared)는 오류를 발생시켜 컴파일하지 않게 됩니다.
		while(i++<2){
			// 중복해서 선언하고 있어서 Error가 발생합니다.
			uint same1 = 0;
		}
	}