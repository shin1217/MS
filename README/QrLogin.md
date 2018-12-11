# 6. QrLogin

<br>

## 페이지 소개

<hr>

Qr코드를 통해 지정된 매장, 지정된 자리에 로그인 가능

<br>

## 구동원리

<hr>
 
 - Qr코드 생성버튼을 누르면 구글 chart API를 사용하여 Qr코드를 생성
 - Qr코드에 정보를 입력할때 chl부분은 encoding한 데이터를 넣어야 알맞게 데이터가 들어감 (escape 메서드 사용)
 ```
 - Qr로그인 -> 잔여시간이 있다면 -> 내가 다른자리에 로그인되어 있다면 -> (로그아웃 처리 후) 내가 선택한자리에 사람이 있으면 로그인 실패
                                                                 -> (로그아웃 처리 후) 내가 선택한자리에 사람이 없으면 로그인 성공
                                                                 
                               -> 내가 다른자리에 로그인되어있지 않다면 -> 내가 선택한자리에 사람이 있으면 로그인 실패
                                                                     -> 내가 선택한자리에 사람이 없으면 로그인 성공
                                                                     
           -> 잔여시간이 없다면 -> 시간충전 모달창 -> 내가 선택한자리에 사람이 있으면 로그인 실패
                                                -> 내가 선택한자리에 사람이 없으면 로그인 성공
 ```
 
<br>
 
## 화면

<hr>

 - Qr코드화면, Qr로그인 페이지
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49789500-8044f480-fd6f-11e8-9aac-3968d7ad46cc.PNG"> <img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49789504-83d87b80-fd6f-11e8-9206-43262490379f.jpg">


 - 시간 충전 페이지
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49789887-63f58780-fd70-11e8-8d14-2edb06675bbb.jpg"> <img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49789893-6657e180-fd70-11e8-8862-f2a0b91e5f53.jpg"> 
 
 
 - 기존에 로그인중일 경우, 다른사람이 사용중일 경우
 
 
<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49790110-c8184b80-fd70-11e8-9f1b-761399b6d7df.jpg"> <img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49790104-c5b5f180-fd70-11e8-8f19-298f94e3b801.jpg"> 


 - 로그인 성공 후 화면


<img width = "300px" height = "300px" src = "https://user-images.githubusercontent.com/42988982/49790225-0e6daa80-fd71-11e8-8e98-79c8b3894d30.jpg">
 
<br>

## [Management System (돌아가기)](../README.md#상세-기능-및-화면) <br>



