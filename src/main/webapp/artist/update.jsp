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
<DIV class='title_line'>아티스트 수정</DIV>
 
<FORM name='frm' method='POST' action='./update.do' 
                enctype="multipart/form-data" class="form-horizontal">
  <input type='hidden' name='artistno' id='artistno' value='${artistVO.artistno}'>
  
  <div class="form-group">
    <label class="col-md-1">아티스트 이름 </label>
    <div class="col-md-9">
      <input type='text' name='name' value='${artistVO.name }' required="required" 
               autofocus="autofocus" class="form-control" style='width: 40%;'>
    </div>
  </div>    
  
  <div class="form-group">
    <label class="col-md-1">데뷔년도 </label>
    <div class="col-md-9">   
      <input type='number' name='debut' value='${artistVO.debut }' required="required" 
               placeholder="" min="1" max=2020 step="1" style='width: 25%;' class="form-control">
     </div>
  </div> 
  
    <div class="form-group">
    <label class="col-md-1">장르 </label>
    <div class="col-md-9">   
      <select name='genre' class="form-control" style='width:25%'>
          <option value='K-POP' ${artistVO.genre == 'K-POP' ? "selected='selected'" : ""}>K-POP</option>
          <option value='락/메탈' ${artistVO.genre == '락/메탈' ? "selected='selected'" : ""}>락/메탈</option>
          <option value='랩/힙합' ${artistVO.genre == '랩/힙합' ? "selected='selected'" : ""}>랩/힙합</option>
          <option value='댄스/팝' ${artistVO.genre == '댄스/팝' ? "selected='selected'" : ""}>댄스/팝</option>
          <option value='발라드' ${artistVO.genre == '발라드' ? "selected='selected'" : ""}>발라드</option>
          <option value='인디' ${artistVO.genre == '인디' ? "selected='selected'" : ""}>인디</option>
          <option value='트로트' ${artistVO.genre == '트로트' ? "selected='selected'" : ""}>트로트</option>
        </select>
     </div>
  </div> 
  
  <div class="form-group">
    <label class="col-md-1">국가 </label>
    <div class="col-md-9">
      <input type='text' name='nation' value='${artistVO.nation }' required="required" 
               class="form-control" style='width: 40%;'>
    </div>
  </div> 
  
  <div class="form-group">
    <label class="col-md-1">출력 순서 </label>
    <div class="col-md-9">   
      <input type='number' name='seqno' value='${artistVO.seqno }' required="required" 
               placeholder="" min="1" max=2020 step="1" style='width: 25%;' class="form-control">
     </div>
  </div> 
  

  <div class="form-group">
    <label class="col-md-1">유형 </label>
    <div class="col-md-9">
      <input type='text' name='type' value='${artistVO.type }' required="required" 
               class="form-control" style='width: 40%;'>
    </div>
  </div> 
  
  <div class="form-group">  
    <label class="col-md-1">이미지 </label> 
    <div class="col-md-9">
      <input type='file' class="form-control" name='fnamesMF'  
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