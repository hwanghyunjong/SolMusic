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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Styles -->
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/artist_style.css" rel='Stylesheet' type='text/css'>
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
<script type="text/javascript">

 function spread_out() {
   // alert("test");
   $('.introduce_detail').css("display", "block");
 } 
 
 function spread_in() {
   // alert("test");
   $('.introduce_detail').css("display", "none");
 } 
 
 function delete_file(songno) {
   var sw = confirm("파일을 삭제 하시겠습니까?");
   if (sw == true) {
     location.href="../music/delete.do?songno=" + songno;
   } else {
     alert('파일 삭제를 취소합니다.');
   } 
 }
</script>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<!-- 아티스트 간략한 정보  -->
<div class="container-fluid" style="padding: 50px 120px">
<div class="artist_thumb">
    <div class="album_image_div">
      <c:set var="fname" value="${albumVO.fname.toLowerCase() }" />
      <c:choose>
      <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
        <img src="./storage/${albumVO.fname }">
      </c:when>
      <c:otherwise>
        ${albumVO.fname}
      </c:otherwise>
    </c:choose>
    </div>
    <div class="artist_info">
      <span class='span_title'> ${albumVO.title }  </span><br><br><br>
      <span class='span_name'> 아티스트</span><span class='span_value_album'><a class='up' href='../artist/read.do?artistno=${artistVO.artistno }'>${artistVO.name } </a></span><br>
      <span class='span_name'> 앨범종류</span><span class='span_value_album'>${albumVO.kind }</span><br>
      <span class='span_name'> 발매일</span><span class='span_value_album' style="padding-left: 40px;">${albumVO.release }   </span><br>
      <span class='span_name'> 장르</span><span class='span_value_album' style="padding-left: 55px;">${albumVO.genre }  </span><br>
      <span class='span_name'> 기획사</span><span class='span_value_album' style="padding-left: 40px;">${albumVO.enter }  </span>
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

<hr>

<div class="container-fluid" style="padding: 25px 50px">
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
          <col width="50%">
          <col width="15%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
        </colgroup>
        <thead>
          <tr>
            <th scope="col"><span  class="blind1"></span></th>
            <th scope="col"><span  class="blind1"></span></th>
            <th scope="col"><span  class="blind1">곡</span></th>
            <th scope="col"><span  class="blind1">아티스트</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">듣기</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">가사</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">다운</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">영상</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">기타</span></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="musicVO" items="${musicList }">
        <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div class="td_style1">${musicVO.seqno }</div></td>
          <td class="thumb"><div class="td_style1"><A class="up" href="../music/read.do?songno=${musicVO.songno }">${musicVO.title }</A></div></td>
          <td class="song"><div class="td_style1">${artistVO.name }</div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div style="margin-top: 15px;"><A href="../music/update.do?songno=${musicVO.songno }" style="font-size: 13px;">수정</A> / <A href="javascript:delete_file(${musicVO.songno})" style="font-size: 13px;">삭제</A></div></td>
         </tr>   
         </c:forEach> 
         </tbody>
      </table>
    </div> 
  </div>
 </div>
 </div>
 
 <hr>

<!-- 뮤직 비디오 -->
<!-- Swiper -->
<div class="album_video_container_fluid"> 
  <div class="heading-artist">
    <h1>앨범 소개</h1>
  </div>
  
  <div class="produce_album">
    <p>${albumVO.intro }</p>
     <div class="introduce_detail" id="int_det" style="display: none;">
        ${albumVO.detail }
    </div>
  </div>
  <div class="pro_album_end">
    <span class="Spread">
      <a id='more' onclick="if(int_det.style.display=='none'){int_det.style.display='block'; more.innerText='접기 △'} else {int_det.style.display='none'; more.innerText='펼치기 ▽'}" class="up">펼치기 ▽</a>
    </span>
  </div>
</div><!-- artist container END -->

<!-- 아티스트 -->
<!-- Swiper -->

<c:if test="${videoList[0].videono != null}">
<div class="album_video_container_fluid"> 
<div class="heading-artist">
    <h1>비디오</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="box_img2">
    <c:forEach var="videoVO" items="${videoList }">
    <figure class="mvInfo">
      <A href="../video/read.do?videono=${videoVO.videono }"><img src="../video/storage/${videoVO.fname }" style="width: 295px; height: 160px;"></A>
      <figcaption class="info">
        <p class="trackTitle">
          <span style="font-size: 15px; font-weight: bolder;">${videoVO.title }</span> <br>
          <span style="font-size: 13px; color: #999999;"> ${videoVO.artist } </span> <br>
          <span style="font-size: 13px; color: #999999;"> ${videoVO.release } </span>
        </p>
      </figcaption>
    </figure>
    </c:forEach>
  </div>
</div>
</c:if>

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
      spaceBetween: 10,
      loop:true,
      loopFillGroupWithBlank: true,
      // init: false,

      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      breakpoints: {
        640: {
          slidesPerView: 2,
          spaceBetween: 10,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 10,
        },
        1024: {
          slidesPerView: 5,
          spaceBetween:10,
        },
      }
    });
  </script>
</body>
</html>