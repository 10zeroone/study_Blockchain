

pragma solidity ^0.4.9;
// 쓰여진 스마트 계약의 Solidity의 버전에 대해서 명시하고 있습니다.
// 이는 이전 버전의 호환성을 보장하고, 새로운 버전의 컴파일러에 의해서 오류가 생기는 것을 막기 위함입니다.


contract SimpleStorage {
// contract라는 키워드를 통해서 SimpleStorage라는 스마트 계약을 정의하고 있습니다.
// 스마트 계약은 함수와 변수, 그리고 이들 간의 연산문으로 구성되어 있습니다.
// SimpleStorage 스마트 계약은 
// storedData라는 변수와, set, get 2개의 함수를 포함하고 있으며, 
// 각각의 함수는 함수의 기능을 수행할 연산문으로 구성되어 있습니다.


    // 변수 (State variable)
    // 스마트 계약에서 사용되는 변수
    // uint type(Unsigned INT)의 변수라고 선언되어 있습니다.
    uint public storedData; 


    // Event
    // 키워드 event를 통해서 선언되는데 EVM의 로그를 생성하는데 사용됩니다.
    // 키워드 emit를 통해 event가 호출됩니다.
    event Change(string message, uint newVal);

    
    // 생성자 (생성자 함수)
    function SimpleStorage(uint initVal) {
        Change("initialized", initVal);
        storedData = initVal;
    }

    // Functions
    // 스마트 계약 내에서 실행되는 단위
    // 키워드 function으로 선언됩니다.
    // set함수
    function set(uint x) public { 
        Change("set", x);
        storedData = x;
    }

    // get함수
    function get() constant returns (uint retVal) { 
        return storedData;
    }

}