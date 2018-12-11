# Social Login

<br>

## 페이지 소개

<hr>

각종 소셜 아이디로 로그인 접속 및 회원가입이 가능하다.

<br>

## 구동원리

<hr>
 
 1. 각 Developers에서 제공하는 REST API를 이용하여 Authorization Code를 받아온다.
 2. 발급된 Authorization Code를 통해 Access Token을 요청하여 받는다.
 3. Access Token을 이용하여 필요한 사용자 정보를 요청하여 가져온다.
 4. 사용자 정보 중 소셜 고유 아이디를 DB에서 확인 후 회원가입 및 로그인 처리를 한다. 
 
<br>
 
## 화면

<hr>

 - 소셜로그인 화면
 
<img src="https://thumbs.gfycat.com/EasygoingSnarlingIguana-small.gif">


<br>

## [Management System (돌아가기)](https://github.com/shin1217/MS#%EC%83%81%EC%84%B8-%EA%B8%B0%EB%8A%A5-%EB%B0%8F-%ED%99%94%EB%A9%B4) <br>

