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
<DIV class='title_line'>뮤비 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' 
                enctype="multipart/form-data" class="form-horizontal">
  
  <div class="form-group">
    <label class="col-md-1">뮤비 제목</label>
    <div class="col-md-9">
      <input type='text' name='title' value='' required="required" 
               autofocus="autofocus" class="form-control" style='width: 40%;'>
    </div>
  </div>    
  
  <div class="form-group">
    <label class="col-md-1">아티스트</label>
    <div class="col-md-9">
      <input type='text' name='artist' value='' required="required" 
               autofocus="autofocus" class="form-control" style='width: 40%;'>
    </div>
  </div>    
  
  <div class="form-group">
    <label class="col-md-1">게시일자</label>
    <div class="col-md-9">
      <input type='text' name='release' value='' required="required" 
               autofocus="autofocus" class="form-control" style='width: 40%;'>
    </div>
  </div>  
  
  <div class="form-group">
    <label class="col-md-1">유튜브 </label>
    <div class="col-md-9">
      <textarea rows="5" cols="" name='youtube' class="form-control" style='width: 60%;'></textarea>
    </div>
  </div>  
  
  <div class="form-group">
    <label class="col-md-1">노래 번호</label>
    <div class="col-md-9">   
      <input type='number' name='songno' value='${param.songno }' required="required" 
               placeholder="" min="1" max=2020 step="1" style='width: 25%;' class="form-control">
     </div>
  </div> 
  
  <div class="form-group">
    <label class="col-md-1">앨범 번호</label>
    <div class="col-md-9">   
      <input type='number' name='albumno' value='${param.albumno }' required="required" 
               placeholder="" min="1" max=2020 step="1" style='width: 25%;' class="form-control">
     </div>
  </div>
  
  <div class="form-group">
    <label class="col-md-1">아티스트 번호</label>
    <div class="col-md-9">   
      <input type='number' name='artistno' value='${param.artistno }' required="required" 
               placeholder="" min="1" max=2020 step="1" style='width: 25%;' class="form-control">
     </div>
  </div>
  
  <div class="form-group">
    <label class="col-md-1">출력 번호</label>
    <div class="col-md-9">   
      <input type='number' name='seqno' value='' required="required" 
               placeholder="" min="1" max=2020 step="1" style='width: 25%;' class="form-control">
     </div>
  </div>
  
  <div class="form-group">   
    <label class="col-md-1">이미지</label> 
    <div class="col-md-9">
      <%-- 실제 컬럼명: mp3, Spring File 객체 대응: mp3MF --%>
      <input type='file' class="form-control" name='fnamesMF' id='fnamesMF' 
                value='' placeholder="파일 선택" multiple="multiple">
    </div>
  </div>
  
  <div class="content_bottom_menu" style="padding-right: 20%">
    <button type="submit" class="btn">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
  </div>

</FORM>
</div>


<!--  장르 -->
<div class="genre-container-fluid" style="padding: 5px 50px">
  
 </div><!-- genre-container-fluid END -->
 
 
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
</body>
</html>