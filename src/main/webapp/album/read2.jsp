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
</script>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<!-- 아티스트 간략한 정보  -->
<div class="container-fluid" style="padding: 50px 120px">
<div class="artist_thumb">
    <div class="album_image_div">
      <img src="./cover/4535336.jpg">
    </div>
    <div class="artist_info">
      <span class='span_title'> NONSTOP </span><br><br><br>
      <span class='span_name'> 아티스트</span><span class='span_value_album'>오마이걸 </span><br>
      <span class='span_name'> 앨범종류</span><span class='span_value_album'>EP(미니) </span><br>
      <span class='span_name'> 발매일</span><span class='span_value_album' style="padding-left: 40px;">2020.04.27 </span><br>
      <span class='span_name'> 장르</span><span class='span_value_album' style="padding-left: 55px;">댄스/팝</span><br>
      <span class='span_name'> 기획사</span><span class='span_value_album' style="padding-left: 40px;">WM Entertainment</span>
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
          <col width="55%">
          <col width="15%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
          <col width="5%">
        </colgroup>
        <thead>
          <tr>
            <th scope="col"><span  class="blind"></span></th>
            <th scope="col"><span  class="blind"></span></th>
            <th scope="col"><span  class="blind">곡</span></th>
            <th scope="col"><span  class="blind">아티스트</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind">듣기</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind">재생목록</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind">다운</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind">영상</span></th>
          </tr>
        </thead>
        <tbody>
        <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div class="td_style1">1.</div></td>
          <td class="thumb"><div class="td_style1">살짝 설렜어(Nonstop)</div></td>
          <td class="song"><div class="td_style1">오마이걸</div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
         </tr>     
         <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div class="td_style1">2.</div></td>
          <td class="thumb"><div style="margin-top: 15px;">Dolphin</div></td>
          <td class="song"><div style="margin-top: 15px;">오마이걸</div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
         </tr>
         <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div class="td_style1">3.</div></td>
          <td class="thumb"><div style="margin-top: 15px;">꽃차 (Flower Tea)</div></td>
          <td class="song"><div style="margin-top: 15px;">오마이걸</div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
         </tr>
         <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div class="td_style1">4.</div></td>
          <td class="thumb"><div style="margin-top: 15px;">NE♡N</div></td>
          <td class="song"><div style="margin-top: 15px;">오마이걸</div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
         </tr>  
         <tr>
          <td class="rank"><input type="checkbox" style="margin-top: 15px;" ></td>
          <td class="rank"><div class="td_style1">5.</div></td>
          <td class="thumb"><div style="margin-top: 15px;">Krystal</div></td>
          <td class="song"><div style="margin-top: 15px;">오마이걸</div></td>
          <td class="album"><div class="td_style2"><A href=""><i class="far fa-play-circle" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="far fa-list-alt" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-download" style="color : #C1BEBD;"></i></A></div></td>
          <td class="option"><div class="td_style2"><A href=""><i class="fas fa-video" style="color : #C1BEBD;"></i></A></div></td>
         </tr>       
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
    <p>오마이걸, 7집 미니 앨범 [NONSTOP] 발매 <br>
      감성 코칭 보드게임 속 설레는 속마음 여행 [NONSTOP]<br>
      타이틀곡 '살짝 설렜어 (Nonstop)’로 새로운 변신 예고!
    </p>
     <div class="introduce_detail" style="display: none;">
        내용
    </div>
  </div>
  <div class="pro_album_end">
    <span class="Spread">
    <c:set var='testno' value='0' />
    <c:choose>
      <c:when test="${testno == 0}">
        <a href="javascript:spread_out()" class="up">펼치기 ▽</a>
      </c:when>
      <c:otherwise>
        <a href="javascript:spread_in()" class="up">접기 △</a>
      </c:otherwise>
    </c:choose>
      
    </span>
  </div>
</div><!-- artist container END -->

<!-- 아티스트 -->
<!-- Swiper -->
<div class="album_video_container_fluid"> 
<div class="heading-artist">
    <h1>비디오</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="box_img2">
    <figure class="mvInfo">
      <img src="./cover/572764.jpg" style="width: 295px; height: 160px;">
      <figcaption class="info">
        <p class="trackTitle">
          <span style="font-size: 17px; font-weight: bolder;">여기 적어줘</span> <br>
          <span> 청하 </span> <br>
          <span>2020.05.08 | 정규</span>
        </p>
      </figcaption>
    </figure>
    <figure class="mvInfo">
      <img src="./cover/572785.jpg" style="width: 295px; height: 160px;">
      <figcaption class="info">
        <p class="trackTitle">
          <span style="font-size: 17px; font-weight: bolder;">Stay Tonight</span> <br>
          <span> 청하 </span> <br>
          <span>2020.04.27 | 정규</span>
        </p>
      </figcaption>
    </figure>
  </div>
  
</div>


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