# Board

<br>

## 페이지 소개

<hr>

사용자 게시판

<br>

## 구동원리

<hr>

 - 세션에서 매장정보와 URI를 통해 get방식을 이용하여 검색어가 URI에 남겨,
   조건에 해당하는 게시물 리스트를 불러옴(페이지 이동시에도 검색 조건이 남도록 함)
   
 - 페이징 처리의 경우 해당 페이지 값을 받아 limit 조건을 이용해서 원하는 위치와 개수 만큼 게시글 정보를 List로 받아
   페이징처리를 위한 객체 생성
   또한 글 총 개수를 페이지당 보여지는 글 수를 나누고, 그 수를 올림하여 페이지 수를 구해 객체에 넣어 구현
   
 - 댓글 구현의 경우 기존의 게시판의 글번호(PK)를 FK로 받아 SQL문에서 값이 일치하는 조건만 출력,
   또한 Ajax를 이용 댓글 리스트를 출력하고, 페이지 전환없이 댓글의 등록, 수정, 삭제가 가능
   
 - 이전글, 다음글로 가는 경우는 SQL문을 이용, 이전글의 경우 현재글 번호보다 작은것중에 최대값을 구하여,
   중간에 글이 삭제된 경우에도 이전글로 갈수 있게 함.(다음글은 이와 반대의 조건)
   글이 없는 경우는 ifnull(MySQL) 함수를 이용, 특정값을 받아 버튼이 나타나지 않도록 함
 
<br>
 
## 화면

<hr>

 - 쪽지 버튼 및 안읽은 쪽지 표시
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49742037-0d8a3980-fcdb-11e8-9052-ddfb4c6fe477.PNG">


 - List화면
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49741980-f64b4c00-fcda-11e8-9f63-03a5e870b870.PNG"> <img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49742043-111dc080-fcdb-11e8-8ab7-f8c5afd3818c.PNG">
 
 
 - 관리자 쪽지보내기, 사용자 쪽지보내기, 답장
 
 
<img width = "280px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49742048-124eed80-fcdb-11e8-957a-2ce22b79cefe.png"> <img width = "280px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49742002-ffd4b400-fcda-11e8-941a-b608059ac106.PNG"> <img width = "280px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49742050-12e78400-fcdb-11e8-9248-4a931ea77089.PNG">

<br>

 ## [Management System (돌아가기)](../README.md#주요-기능) <br>

