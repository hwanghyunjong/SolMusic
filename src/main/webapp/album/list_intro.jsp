<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Styles -->
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/list_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/album_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<div class="container-fluid" style="padding: 55px 180px 120px 120px;">
  <div class="heading-genre">
    <h1>장르</h1>
  </div>
  <div class="genre" style="margin-top: 50px;">
    <div class="row">
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-heartbeat"></i></span>
           </div>
          <a href="#"  class="up">발라드</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-music"></i></span>
           </div>
          <a href="#"  class="up">댄스</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="far fa-star"></i></span>
           </div>
          <a href="#"  class="up">아이돌</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-guitar"></i></span>
           </div>
          <a href="#"  class="up">인디</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-comment-dollar"></i></span>
           </div>
          <a href="#"  class="up">랩/힙합</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="far fa-hand-point-up"></i></span>
           </div>
          <a href="#"  class="up">락/메탈</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-headset"></i></span>
           </div>
          <a href="#"  class="up">알앤비/소울</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-podcast"></i></span>
           </div>
          <a href="#"  class="up">팝</a>
        </div>
      </div>
      <div class="col-sm-6 col-md-3" style="padding-bottom: 20px">
        <div class="genre-sub">
          <div>
            <span style="font-size: 50px; color: #99d6ff"><i class="fas fa-globe"></i></span>
           </div>
          <a href="#"  class="up">트로트</a>
        </div>
      </div>
    </div> <!-- row END -->
  </div><!-- genre END -->

</div>
 

<!-- 아티스트 -->
<!-- Swiper -->
 
 
 <!-- bottom -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
<script src="../css/jquery.min.js"></script>
<script src="../css/material-bootstrap.min.js"></script>
<script src="../js/plugins/swiper/js/swiper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
    $(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
    
    $(".waves-effect").click(function(){
      $("a").attr("class", "waves-effect");
      $(this).attr("class", "active");
    });
</script>
<!-- Initialize Swiper -->

</body>
</html>