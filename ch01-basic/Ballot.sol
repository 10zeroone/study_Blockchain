contract Ballot {
    // This declares a new complex type which will
    // be used for variables later.
    // It will represent a single voter.


    // Struct
	//• 개발자 정의 데이터 유형
	//• 키워드 struct에 의해서 선언됩니다.
	//• C언어의 struct와 같은 개념으로 여러 state variables를 포함하는 구조체 변수입니다.
    // Voter라는 struct 변수는 weight, voted, delegate, vote라는 4개의 변수를 포함하고 있습니다. 
    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted;  // if true, that person already voted
        address delegate; // person delegated to
        uint vote;   // index of the voted proposal
    }
}