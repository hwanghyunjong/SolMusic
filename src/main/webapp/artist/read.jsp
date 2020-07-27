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
<link href="../css/artist_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/album_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/song_style.css" rel='Stylesheet' type='text/css'>
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
<div class="container-fluid" style="padding: 50px 120px">
<div class="artist_thumb">
    <div class="artist_image_div">
    <c:set var="fname" value="${artistVO.fname.toLowerCase() }" />
    <c:choose>
      <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
        <img src="./storage/${artistVO.fname }" class="artist_image">
      </c:when>
      <c:otherwise>
        ${artistVO.fname}
      </c:otherwise>
    </c:choose>
    </div>
    <div class="artist_info">
      <span style="font-size: 36px; font-weight: 700;"> ${artistVO.name } </span><br><br><br>
      <span class='span_name'> 데뷔</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='span_value'>${artistVO.debut } </span><br>
      <span class='span_name'> 장르</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='span_value'>${artistVO.genre } </span><br>
      <span class='span_name'> 국적</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='span_value'>${artistVO.nation } </span><br>
      <span class='span_name'> 유형</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='span_value'>${artistVO.type }</span>
    </div>
    <div class="just_div"></div>
    <div class="artist_like">
      <div class="likey">
        <A href=" "><i class="far fa-heart" style="font-size: 24px; color: #F457B4"></i></A><span style="font-size: 24px;">&nbsp;${artistVO.likey }</span>
      </div>
      <div style="margin-top: 50px;">
        <span class='span_name'> 공유</span>&nbsp;&nbsp;&nbsp;
        <a href=" "><img src="./images/instagram.png"></a>&nbsp;
        <a href=" "><img src="./images/facebook.png"></a>&nbsp;
        <a href=" "><img src="./images/youtube.png"></a>
      </div>
    </div>
</div>
</div>


<div class="container-fluid" style="padding: 25px 50px; background-color: #F4F2F3;">
<div class="row">
  <div class="col-sm-12">
  <div class="heading"><h1 class="chart">노래</h1>
    <span class="view_all"><a href="#">더 보기 ▷</a></span>
  </div>
    <div class="table-responsive text-nowrap"> 
      <table class="table">
        <colgroup>
          <col width="5%">
          <col width="5%">
          <col width="40%">
          <col width="15%">
          <col width="15%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
        </colgroup>
        <thead>
          <tr>
            <th scope="col"><span class="blind1"></span></th>
            <th scope="col"><span class="blind1"></span></th>
            <th scope="col"><span class="blind1">곡</span></th>
            <th scope="col"><span class="blind1">아티스트</span></th>
            <th scope="col"><span class="blind1">앨범</span></th>
            <th scope="col" style="text-align: center;"><span class="blind1">듣기</span></th>
            <th scope="col" style="text-align: center;"><span class="blind1">재생목록</span></th>
            <th scope="col" style="text-align: center;"><span class="blind1">다운</span></th>
            <th scope="col" style="text-align: center;"><span class="blind1">영상</span></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="musicVO" items="${musiclist }" varStatus="status" begin="1" end="5">
        <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div style="width: 60px; height: 60px;"><A href="../music/read.do?songno=${musicVO.s_songno }"><img src="../album/storage/${musicVO.l_fname}" class="img-thumbnail" style="width: 50px; height: 50px"></A></div></td>
          <td class="thumb"><div class="td_style1"><A href="../music/read.do?songno=${musicVO.s_songno }" class=up>${musicVO.s_title }</A></div></td>
          <td class="song"><div class="td_style1">${musicVO.r_name }</div></td>
          <td class="artist"><div class="td_style1"><A href="../album/read.do?albumno=${musicVO.l_albumno }" class=up>${musicVO.l_title }</A></div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
         </tr>
         </c:forEach>
         </tbody>
      </table>
    </div> 
  </div>
 </div>
 </div>
 

<!-- 뮤직 비디오 -->
<!-- Swiper -->
<div class="artist-container-fluid"> 
  <div class="heading-artist">
    <h1>앨범</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <c:forEach var="albumVO" items="${albumlist }">
      <c:set var="fname" value="${albumVO.fname.toLowerCase() }" />
      <div class="swiper-slide">
        <div class="box">
          <div class="box_img">
            <a href="../album/read.do?albumno=${albumVO.albumno }"><img alt="" src="../album/storage/${albumVO.fname }" style="width: 200px; height: 200px;"></a>
          </div>
          <div class="box_text">
            <span style="font-size: 14px; color: #232323;">${albumVO.title }</span>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    </div><!--swiper-container END -->
</div><!-- artist container END -->

<!-- VIDEO -->
<c:if test="${videolist[0].videono != null}">
<div class="video-container-fluid"> 
<div class="heading-artist">
    <h1>비디오</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="box_img2">
    <c:forEach var="videoVO" items="${videolist }">
    <figure class="mvInfo">
      <A href="../video/read.do?videono=${videoVO.videono }"><img src="../video/storage/${videoVO.fname }" style="width: 295px; height: 160px;"></A>
      <figcaption class="info">
        <p class="trackTitle">
          <span style="font-size: 15px; font-weight: bolder;">${videoVO.title }</span> <br>
          <span style="font-size: 13px; color: #999999;"> ${videoVO.artist } </span> <br>
          <span style="font-size: 13px; color: #999999;">${videoVO.release }</span>
        </p>
      </figcaption>
    </figure>
    </c:forEach>
  </div>
  
  
  
</div><!-- artist container END -->
</c:if>


<!--  장르 -->
<!-- <div class="genre-container-fluid" style="padding: 5px 50px">
  
 </div> --><!-- genre-container-fluid END -->
 
 
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
</script>
<!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 5,
      loop:false,
      loopFillGroupWithBlank: false,
      // init: false,

      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      breakpoints: {
        640: {
          slidesPerView: 2,
          spaceBetween: 5,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 5,
        },
        1024: {
          slidesPerView: 5,
          spaceBetween:5,
        },
      }
    });
  </script>
</body>
</html>