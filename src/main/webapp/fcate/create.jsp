<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/new_style.css" rel='Stylesheet' type='text/css'>
<link rel="stylesheet" href="../ckeditor/contents.css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<div>
  <!-- Tabs -->
  <section id="tabs">
    <div class="container">
    <h6 class="section-title h2">고객센터</h6>
      <ul class="nav nav-pills nav-pills-rounded justify-content-center">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list_all.do';">FAQ</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_reg.do';">1:1문의</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_list.do';">내 문의내역</a></li>
     </ul>
      
     <!-- 카테고리 그룹 시작 -->
     <div class="card" style="margin:0px auto; margin-top:40px; width:60%;">  
     <h5 class="card-header text-center" style="background-color:#ff4865; color:white;"><strong>FAQ 카테고리 그룹 등록</strong></h5>
   
     <!--Card content-->
     <div class="card-body px-lg-5">
     <form class="form-horizontal" style="color: #757575;" name='frm' method='POST' action='./create.do'>
     <p>FAQ 카테고리 그룹을 등록하세요</p>

     <!-- cateno -->
     <div class="form-group row">
       <label for="inputEmail3MD" class="col-sm-2 col-form-label">No. </label>
       <input type="number"  id="cateno" name="cateno" class="form-control" required="required" placeholder="카테고리번호" style="margin-bottom:10px; width:30%;">
     </div>

     <!-- name -->
     <div class="form-group row">
       <label for="inputEmail3MD" class="col-sm-2 col-form-label">Name. </label>
       <input type="text" id="name" name="name" class="form-control" required="required" placeholder="카테고리이름" style="width:50%;">
     </div>
     
     <!-- Sign in button -->
     <div class="qna_btn_bottom">
       <input class="btn " type="submit" id="qna_btn_send" value="등록">
       <button class="btn" type="button" id="qna_btn_cancel" onclick="location.href='./list.do'">카테고리 목록</button>   
     </div>
     <!-- button END -->   
     </form>
     </div>
     <!-- card-body END -->
     </div>
     <!-- card END -->     
    </div> 
    <!-- container END -->
  </section>
</div>

<!-- bottom -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
<script src="../css/jquery.min.js"></script>
<script src="../css/material-bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
    $(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</body>
</html>