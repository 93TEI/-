pragma solidity^0.4.11;
contract Secret {
    //input필드에서 드러나면 안되는 정보가 ASCII로 변환했을 때 드러나는 문제점이 발생한다
    string private secret; // 기밀 정보 문자열

    //생성자
    function Secret(string _secret) {
        secret = _secret;
    }

    //기밀 정보 문자열 설정
    function setSecret(string _secret) public {
        secret = _secret;
    }
}