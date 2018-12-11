# PhotoBoard

<br>

## 페이지 소개

<hr>

사용자 및 관리자가 자유롭게 사진을 올릴 수 있는 게시판

<br>

## 구동원리

<hr>
 
 - 접속된 매장의 session을 이용하여 사진 리스트를 DB에서 가져옴
 - 관리자의 경우 자신이 갖고 있는 모든 매장을 리스트에 담아 가져온 후 forEach문으로 구현
 - mouseover기능을 이용하여 Ajax를 통해 각각의 매장정보를 보여줌
 - Ajax를 이용하여 비동기 처리로 각각의 정보를 유효성검사를 통해 수정
 - 매장삭제를 누르면 모달창을 띄운 후 로그아웃 처리
 - 매장추가를 누르면 매장추가 페이지로 이동, 각각의 유효성 검사 후 우편주소는 daum 우편 API를 사용
 - 사용자 탈퇴를 누르면 id값을 조건으로 DB에서 데이터 삭제
 
<br>
 
## 화면

<hr>

 - Admin, User Mypage 메인
 
 
<img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49773074-f24b1880-fd32-11e8-9c73-4e9f831f7c4d.PNG"> <img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49773079-f5de9f80-fd32-11e8-8563-5f56abd6a4a6.PNG">


 - 정보수정, 탈퇴 화면
 
 
<img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49773432-6cc86800-fd34-11e8-9ed0-714885988b12.PNG"> <img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49773475-aa2cf580-fd34-11e8-9e8e-3c3f1c23bb97.PNG">
 
 
 - Admin 매장정보, 매장추가 화면
 
 
<img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49773529-dc3e5780-fd34-11e8-8b7d-4e86b68c357e.png"> <img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49773532-de081b00-fd34-11e8-85b0-874c3b0b5c09.PNG"> 

<br>

## [Management System (돌아가기)](../README.md#상세-기능-및-화면) <br>



