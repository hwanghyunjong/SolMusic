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


<!-- 아티스트 간략한 정보  -->
<div class="container-fluid" style="padding: 55px 180px 0px 120px;">
  <div class='title_line'>
    <span style="font-size: 28px; font-weight: 700;">앨범 수정</span>
    <div style="float: right;">
      <span class="menu_aside"><A href='./list.do'>목록</A></span>
    </div>
    
  </div>
</div>

<div class="container-fluid" style="padding: 0px 120px; padding-bottom: 50px;">
<c:forEach var="albumVO" items="${list }">
<c:set var="fname" value="${albumVO.l_fname.toLowerCase() }" />
<div style="width: 100%;">
    <div class="artist_thumnail">
    <c:choose>
      <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
        <A href='./update.do?albumno=${albumVO.l_albumno }'><img src="./storage/${albumVO.l_fname }" style="width: 100%; height: 100%;"></A> <br>
        <span style="font-size: 14px; font-weight: bold; float: left; color: #232323;">${albumVO.l_title }</span><br>
        <span style="font-size: 13px; float: left; color: #999999;">${albumVO.r_name }</span>
      </c:when>
      <c:otherwise>
        ${albumVO.l_fname}
      </c:otherwise>
    </c:choose>
   </div>
  </div>
</c:forEach>
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
    
    /* $(".waves-effect").click(function(){
      $("a").attr("class", "waves-effect");
      $(this).attr("class", "active");
    }); */
</script>
<!-- Initialize Swiper -->

</body>
</html>