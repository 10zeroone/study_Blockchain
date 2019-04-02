pragma solidity ^0.4.22;

contract ErrorHandlingExample{
	function buy(uint amount) payable{
		if(amount > msg.value/2 ether)
			// revert, require를 통해서 exception을 발생시킬 수 있습니다.
			revert("Not enough Ether provided.");

		// revert, require를 통해서 exception을 발생시킬 수 있습니다.
		require(
			amount <= msg.value/2 ether, "Not enough Ether provided"
		);

	}
}