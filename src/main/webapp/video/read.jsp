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
<div class="container-fluid" style="padding: 55px 180px 0px 120px;">
  <div class='title_line'>
    <span style="font-size: 28px; font-weight: 700;">뮤직비디오</span>
    <div style="float: right;">
      <span class="menu_aside"><A href='./update_form.do'>수정</A></span>
      <span class="menu_aside"> | </span>
      <span class="menu_aside"><A href='./delete_form.do'>삭제</A></span>
    </div>
    
  </div>
</div>

<div class="container-fluid" style="padding: 55px 180px 0px 120px;">
  ${videoVO.youtube }<br>
  <div class='video_section'>
    <h3>${videoVO.title }</h3><br>
    <A href='' class='up' style='font-size: 13px; color: #999999;'>${videoVO.artist }</A><br>
    <span class='video_name_make' style="padding-top: 9px;">${videoVO.release }</span>
  </div>
  <hr>
</div> 

<div class="container-fluid" style="padding: 0px 180px 50px 120px;">
    <span class='section_title'>이 뮤비의 관련 곡</span>
    <div class="table-responsive text-nowrap" style="margin-top: 15px;"> 
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
            <th scope="col"><span  class="blind1"></span></th>
            <th scope="col"><span  class="blind1"></span></th>
            <th scope="col"><span  class="blind1">곡</span></th>
            <th scope="col"><span  class="blind1">아티스트</span></th>
            <th scope="col"><span  class="blind1">앨범</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">듣기</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">재생목록</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">다운</span></th>
            <th scope="col" style="text-align: center;"><span  class="blind1">영상</span></th>
          </tr>
        </thead>
        <tbody>
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
        </tbody>
      </table>
    
    </div>
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