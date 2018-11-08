<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
   rel="stylesheet">
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<style>
html, body {
   height: 100%;
}

body {
   margin: 0;
}

.container {
   min-height: 100%;
   position: relative;
}

.full {
   background-image:
      url("<%=request.getContextPath()%>/images/login-back.jpg");
   background-position: center;
   background-repeat: no-repeat;
   background-size: cover;
   height: 100%;
}

.area_inputs {
   position: absolute;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
   margin: auto;
   width: 30%;
   height: 30%;
}
</style>
</head>
<body>
   <div class="full">
      <div style="float: right; margin-top: 30px; margin-right: 30px;">
         <a href="admin"> <img
            src="${pageContext.request.contextPath}/images/adminLogin-move.png"
            style="height: 50px;" />
         </a>
      </div>
      <div class="container">
         <div class="area_inputs wow fadeIn">
            <form method="post">
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="inputId">아이디</label>
                  <div>
                     <input type="text" class="form-control" id="inputId" name="user_id"
                        placeholder="아이디">
                  </div>
               </div>
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="inputPassword">비밀번호</label>
                  <div>
                     <input type="password" class="form-control" id="inputPassword" name="user_pw"
                        placeholder="비밀번호">
                  </div>
               </div>
               <div class="form-group">
                  <div>
                     <button type="submit" class="btn btn-primary btn-block">로그인</button>
                  </div>
               </div>
            </form>
            <div class="col-sm-10">
               <a class="btn btn-primary"
                  href="${pageContext.request.contextPath}/user/reg">회원가입</a>
            </div>
         </div>
      </div>
   </div>
</body>
<script>
   new WOW().init();
</script>
</html>