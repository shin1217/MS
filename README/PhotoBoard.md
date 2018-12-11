# PhotoBoard

<br>

## 페이지 소개

<hr>

사용자 및 관리자가 자유롭게 사진을 올릴 수 있는 게시판

<br>

## 구동원리

<hr>
 
 - 접속된 매장의 session을 이용하여 사진 리스트를 DB에서 가져온 후 forEach문으로 구현
 - Mysql에 limit를 이용하여 6개씩 가져온 후 parameter로 페이지정보를 넘겨 페이징처리
 - 글쓰기의 경우 파일 업로드를 위해 파일업로드용 프로젝트를 미리 AWS에 배포
 - Ajax를 이용해 multipart파일은 업로드용 프로젝트에 저장하고 DB에는 파일 이름만 저장
 - 사진을 불러올때도 업로드용 프로젝트를 경로로 설정하여 불러옴
 - 상세페이지로 가면 접속한 아이디의 session정보를 가져와 작성자와 비교하여 같을때만 삭제, 수정 버튼이 뜸
 - 가져온 session정보가 admin이라면 항상 삭제, 수정 버튼이 뜸
 - 수정을 하면 new file().delete()를 이용해 기존저장된 사진은 지워지고 새로운 사진을 저장
 - 댓글의 경우 Ajax를 이용하여 화면에 바로 나타나도록 비동기처리로 구현
 
<br>
 
## 화면

<hr>

 - PhotoBoard 메인페이지
 
 
<img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49782463-c8591c80-fd59-11e8-9469-2ebbb6c970f2.PNG"> <img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49782617-4c130900-fd5a-11e8-8837-d633e1f78016.PNG">


 - 글쓰기, 수정, 삭제 페이지
 
 
<img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49782905-51bd1e80-fd5b-11e8-8bad-e98945b1e3ad.PNG"> <img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49783011-aeb8d480-fd5b-11e8-84f7-1ddf3d43e21f.png"> 
 
 
 - 상세페이지, 댓글
 
 
<img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49783006-ac567a80-fd5b-11e8-9507-5f288ff9c987.PNG"> <img width = "350px" height = "250px" src = "https://user-images.githubusercontent.com/42988982/49783077-eaec3500-fd5b-11e8-9dcd-b74e96761c5f.PNG"> 

<br>

## [Management System (돌아가기)](../README.md#상세-기능-및-화면) <br>



