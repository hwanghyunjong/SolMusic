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
<link href="../css/song_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_spread').on('click', spread_in);
    $('#btn_play').on('click', btn_open);
    //alert($('#userno').val());
  });
  
  function spread_in() {
    if ($('#btn_spread').html() == '펼치기 ▽' ) { // 펼치기 버튼 클릭시
      $('#lyrics').attr('class', 'lyrics'); // lyrics id의 태그의 클래스가 lyrics로 변경
      $('#btn_spread').html('접기 △'); // btn_spread id 태그의 텍스트가 접기로 변경
    } else {
      $('#lyrics').attr('class', 'lyrics_hide');
      $('#btn_spread').html('펼치기 ▽');
    }
  }
  
  function btn_open() {
    if ($('#userno').val().length == 0) {
      alert('로그인이 필요합니다!!')
      return;  // 실행 종료
    } 
    
    window.open('playlist.do?songno=${musicVO.s_songno}','window_name','width=384,height=695,location=no,status=no,scrollbars=yes');
  }
  
</script>

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<!-- 아티스트 간략한 정보  -->
<div class="container-fluid" style="padding: 50px 200px">
<div class="artist_thumb">
    <div class="song_image_div">
        <img src="../album/storage/${musicVO.l_fname }" class='song_image'>
    </div>
    <div class="artist_info">
      <span class='span_title_song'> ${musicVO.s_title }  </span><br>
      <span class='span_name_artist'> ${musicVO.r_name }</span><br>
      <span class='span_name_make'> 작사&nbsp;</span><span class='span_name_make'>${musicVO.s_lyricist } </span><br>
      <span class='span_name_make'> 작곡&nbsp;</span><span class='span_name_make'>${musicVO.s_composer } </span><br>
      <span class='span_name_make'> 편곡&nbsp;</span><span class='span_name_make'>${musicVO.s_composer } </span><br><br>
      <button type="button" id=btn_play class="btn btn-outline-danger" style="border: 1px solid #ff1150; background-color: #ff1150; color: #fff; font-size: 15px; border-radius: 5px;">▶ 재생</button>&nbsp;
      <button type="button" class="btn btn-outline-danger" style="border: 1px solid #d7d7d7; background-color: #fbfbfb; color: #232323; font-size: 15px; border-radius: 5px;">MP3 구매</button>&nbsp;&nbsp;
      <A href=" "><i class="far fa-heart" style="font-size: 32px; color: #F457B4; padding-top: 12px;"></i></A>
      <span class="menu_aside"><A href='../video/create.do?songno=${param.songno}'>뮤비 등록</A></span>
    </div>
</div>
</div>

<hr>

<div class="container-fluid" style="padding: 25px 200px">
<div class="row">
  <input type='hidden' name='userno' id='userno' value='${sessionScope.userno}'>
  <div class="song_heading"><h1 class="chart">가사</h1></div><br>
 </div>
  <p id='lyrics' class='lyrics_hide'>
    ${musicVO.s_lyrics }
  </p>
  <span style="font-size: 13px;">
    <a id='btn_spread' class="up">펼치기 ▽</a>
  </span>
</div>
 
 <hr>

<!-- 뮤직 비디오 -->
<!-- Swiper -->
<div class="song_container_fluid"> 
  <div class="heading-artist">
    <h1>수록 앨범</h1>
  </div>
  <div>
    <div class="song_album_cover">
      <A href="../album/read.do?albumno=${musicVO.l_albumno }"><img src="../album/storage/${musicVO.l_fname }" style="width: 100%; height: 100%;"></A>
    </div>
    <div class="song_album_tjf_parents">
      <div class="inner">
        <a href=""><span class='span_name_artist'>${musicVO.l_title }</span></a><br>
        <span class='span_name_make'>${musicVO.r_name }</span><br>
        <span class='span_name_make' style="padding-top: 9px;">${musicVO.l_release }</span>
      </div>
    </div>
  </div>
</div><!-- artist container END -->

<c:if test="${videoVO.videono != null }">
<div class="song_container_fluid" style="height: 375px;]"> 
  <div class="heading-artist">
    <h1>이 곡의 뮤직비디오</h1>
  </div>
  <div>
    <div class="song_video_cover">
      <a href="../video/read.do?videono=${videoVO.videono }"><img src="../video/storage/${videoVO.fname }" style="width: 100%; height: 100%;"></a>
    </div>
    <div>
      <div style="padding-top: 10px;">
        <a href="../video/read.do?videono=${videoVO.videono }"><span class='span_name_artist'>${videoVO.title}</span></a><br>
        <span class='span_name_make'>${videoVO.artist}</span><br>
      </div>
    </div>
  </div>
</div><!-- artist container END -->
</c:if>

<!-- 아티스트 -->
<!-- Swiper -->
<div class="container-fluid" style="padding: 25px 200px; padding-bottom: 50px;">
  <div class="heading-artist">
    <h1>관련 아티스트 앨범</h1>
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
    spaceBetween: 4,
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
        spaceBetween: 4,
      },
      768: {
        slidesPerView: 3,
        spaceBetween: 4,
      },
      1024: {
        slidesPerView: 4,
        spaceBetween: 4,
      },
    }
  });
  </script>
</body>
</html>