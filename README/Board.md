# Board

<br>

## 페이지 소개

<hr>

사용자 게시판

<br>

## 구동원리

<hr>

 - 세션에서 매장정보와 URI를 통해 get방식을 이용하여 검색어가 URI에 남겨,<br>
   조건에 해당하는 게시물 리스트를 불러옴(페이지 이동시에도 검색 조건이 남도록 함)<br>
   <br>
 - 페이징 처리의 경우 해당 페이지 값을 받아 limit 조건을 이용해서 원하는 위치와 개수 만큼 게시글 정보를 List로 받아<br>
   페이징처리를 위한 객체 생성<br>
   또한 글 총 개수를 페이지당 보여지는 글 수를 나누고, 그 수를 올림하여 페이지 수를 구해 객체에 넣어 구현<br>
   <br>
 - 댓글 구현의 경우 기존의 게시판의 글번호(PK)를 FK로 받아 SQL문에서 값이 일치하는 조건만 출력,<br>
   또한 Ajax를 이용 댓글 리스트를 출력하고, 페이지 전환없이 댓글의 등록, 수정, 삭제가 가능<br>
   <br>
 - 이전글, 다음글로 가는 경우는 SQL문을 이용, 이전글의 경우 현재글 번호보다 작은것중에 최대값을 구하여,<br>
   중간에 글이 삭제된 경우에도 이전글로 갈수 있게 함.(다음글은 이와 반대의 조건)<br>
   글이 없는 경우는 ifnull(MySQL) 함수를 이용, 특정값을 받아 버튼이 나타나지 않도록 함<br>
<br>
<br>
 
## 화면

<hr>

 - 게시판(검색시)
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988725/49774220-5ec81680-fd37-11e8-90f0-04f30e7bf048.JPG"> 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988725/49774277-90d97880-fd37-11e8-8089-fd92fc94e474.JPG">


 - 게시글작성페이지
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988725/49774259-7ef7d580-fd37-11e8-831b-c0755e4463a5.JPG">


 - 게시글화면
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988725/49774426-1e1ccd00-fd38-11e8-8b1f-907ad93f4654.JPG">
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988725/49774485-44426d00-fd38-11e8-8815-a9ae385f64a8.JPG">
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988725/49774510-5ae8c400-fd38-11e8-8fa1-0689d6d000fe.JPG">




<br>

 ## [Management System (돌아가기)](../README.md#주요-기능) <br>

