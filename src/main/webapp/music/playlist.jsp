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
  var audio = new Audio();
  audio.src = "../music/storage/mp3/${listVO.s_mp3}";

  $(function() { // 자동 실행
    audio.play();
  });
  
  function play_music() {
    audio.play();
    // alert($('#play').attr('id'));
    /* if ($('#play').attr('id') == 'play') {
      $('#play').attr('class', 'far fa-pause-circle');
      audio.play();
      
      $('#play').attr('id', 'stop');
      
    } else if($('#play').attr('id') == 'stop') {
      $('#play').attr('class', 'far fa-play-circle');
      audio.pause();
      
      $('#play').attr('id', 'play');
      
    } */
    
    /* if ($('#player').paused == false) {
      $('#player').pause();
    } else {
      $('#player').play();
    } */
    
    
    
  }
  
  function stop_music() {
    audio.pause();
  }
  
  
</script>
</head>

<body>


<!-- 아티스트 간략한 정보  -->
<div class="container-fluid">
   <div class="playlist_image">
      <img src='../album/storage/${listVO.l_fname}' style='width: 100px; height: 100px;'>
   </div>
   <div class="playlist_info">
      <span class='span_name_artist'>${listVO.s_title }</span> <br>
      <span class='span_name_make'>${listVO.r_name }</span><br>
      <%-- <audio autoplay="autoplay" src="../music/storage/mp3/${listVO.s_mp3}"></audio> --%>
      <A href="" style="font-size: 25px; color: #999999;"><i class="fas fa-step-backward"></i></A>
      <A href="javascript:play_music();" style="font-size: 25px; color: #999999;"><i id='play' class="far fa-play-circle"></i></A>
      <A href="javascript:stop_music();" style="font-size: 26px; color: #999999;"><i id='play' class="far fa-pause-circle"></i></A>
      <A href="" style="font-size: 25px; color: #999999;"><i class="fas fa-step-forward"></i></A>
   </div>
</div>

<hr>

<div class="container_fluid_container" style='width: 384px; height: 480px;'>
  <form action="">
  <ul style="overflow: scroll; width: 384px; height: 480px;">
    <li class='listrow'><span style="font: bold; color: #999999; font-size: 14px;">재생 목록</span>
    <c:forEach var="musicVO" items="${musicList}">
      <li class='listrow'><input type="checkbox">&nbsp;&nbsp;<A href="./playlist.do?songno=${musicVO.songno }"><span style="color: #999999; font-size: 14px;">${musicVO.title }</a></span>  |  <span style="color: #999999; font-size: 14px;">창모</span></li>
    </c:forEach>     
  </ul>
  </form>
</div>

<div class="container_fluid_bottom">
  <input type="hidden" style="padding-left: 15px;">
  <button type="button" class="btn btn-outline-danger" style="border: 1px solid #d7d7d7; background-color: #fbfbfb; color: #232323; font-size: 13px; border-radius: 5px; margin-left: 7px;">△</button>&nbsp;&nbsp;
  <button type="button" class="btn btn-outline-danger" style="border: 1px solid #d7d7d7; background-color: #fbfbfb; color: #232323; font-size: 13px; border-radius: 5px;">▽</button>&nbsp;&nbsp;
  <button type="button" class="btn btn-outline-danger" style="border: 1px solid #d7d7d7; background-color: #fbfbfb; color: #232323; font-size: 13px; border-radius: 5px;">담기</button>&nbsp;&nbsp;
  <button type="button" class="btn btn-outline-danger" style="border: 1px solid #d7d7d7; background-color: #fbfbfb; color: #232323; font-size: 13px; border-radius: 5px;">삭제</button>&nbsp;&nbsp;
  <button type="button" class="btn btn-outline-danger" style="border: 1px solid #d7d7d7; background-color: #fbfbfb; color: #232323; font-size: 13px; border-radius: 5px;">다운</button>&nbsp;&nbsp;
</div>
 <!-- bottom -->
<%-- <jsp:include page="../menu/bottom.jsp" flush='false' /> --%>
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