

pragma solidity ^0.4.9;
// 쓰여진 스마트 계약의 Solidity의 버전에 대해서 명시하고 있습니다.
// 이는 이전 버전의 호환성을 보장하고, 새로운 버전의 컴파일러에 의해서 오류가 생기는 것을 막기 위함입니다.


contract SimpleStorage {
// contract라는 키워드를 통해서 SimpleStorage라는 스마트 계약을 정의하고 있습니다.
// 스마트 계약은 함수와 변수, 그리고 이들 간의 연산문으로 구성되어 있습니다.
// SimpleStorage 스마트 계약은 storedData라는 변수와, set, get 2개의 함수를 포함하고 있으며, 
// 각각의 함수는 함수의 기능을 수행할 연산문으로 구성되어 있습니다.

    uint public storedData; // 변수 (State variable)

    event Change(string message, uint newVal);

    function SimpleStorage(uint initVal) {
        Change("initialized", initVal);
        storedData = initVal;
    }

    function set(uint x) { // set함수
        Change("set", x);
        storedData = x;
    }

    function get() constant returns (uint retVal) { // get함수
        return storedData;
    }

}