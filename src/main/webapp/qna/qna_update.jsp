<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/new_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
<script>
  function clickUpdate(frm) {
    frm.action = "./qna_update.do";
    frm.method = "post";
    frm.submit();
  }
</script>

</head>

<body>
<c:set var="qnano" value="${qnaVO.qnano }"/>
<jsp:include page="../menu/top.jsp" flush='false' />

<div>
  <!-- Tabs -->
  <section id="tabs">
    <div class="container">
    <h6 class="section-title h2">고객센터</h6>
    <ul class="nav nav-pills nav-pills-rounded justify-content-center">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#pill2-1">1:1문의 수정</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list.do';">내 문의내역</a>
      </li>
    </ul>

    <div class="tab-content mb-2" >
      <FORM name='frm' id='frm' method='POST' action='./qna_update.do' enctype="multipart/form-data">
        <div class="tab-pane fade show active" id="pill2-1">
        <div class="table_line"></div>
       
        <!-- 테이블 시작 -->
        <table class="table" style="margin-top:10px;">
          
          <!-- 문의유형 -->
          <tr>
            <th scope="row" style="border-top:2px solid #4c4c4c; width:175px !important; color:#666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
              <i class="fas fa-asterisk fa-xs"></i>문의유형
            </th>
            <td style="border-top:2px solid #4c4c4c; padding:10px 20px; color:#3a3635; background-color: #fff;">
              <div class="categoryArea" style="overflow:hidden;">
                <span class="browser-default custom-select" style="width:198px;">
                <input type='hidden' name='qnano' id='qnano' value='${qnaVO.qnano }'>
                  <select name='qna_categrpname' id="qna_categrpname" >
                    <option value="pc"  ${qnaVO.qna_categrpname=='PC'?"selected='selected'":"" }>PC</option>
                    <option value="스마트폰" ${qnaVO.qna_categrpname=='스마트폰'?"selected='selected'":"" }>스마트폰</option>
                    <option value="플레이어" ${qnaVO.qna_categrpname=='플레이어'?"selected='selected'":"" }>플레이어</option>
                    <option value="멤버십" ${qnaVO.qna_categrpname=='멤버십'?"selected='selected'":"" }>멤버십</option>
                    <option value="쿠폰" ${qnaVO.qna_categrpname=='쿠폰'?"selected='selected'":"" }>쿠폰</option>
                    <option value="이벤트" ${qnaVO.qna_categrpname=='이벤트'?"selected='selected'":"" }>이벤트</option>
                    <option value="기타" ${qnaVO.qna_categrpname=='기타'?"selected='selected'":"" }>기타</option>
                  </select>
                </span>
              </div>
            </td>
          </tr>
        
          <!-- 이메일 -->
          <tr>
            <th scope="row" style="border-top:1px solid #ebebea; width:175px !important; color:#666; background-color: #f8f9fb; text-align: left; vertical-align: top; ">
              <i class="fas fa-asterisk fa-xs"></i>이메일
            </th>
            <td style="border-top:1px solid #ebebea; padding:10px 20px; color:#3a3635; background-color: #fff;">
              <input class="form-control" type="text" required="required" name='qna_email' id='qna_email' value='${qnaVO.qna_email}'>
            </td> 
          </tr>

          <!-- 문의제목 -->
          <tr>
            <th scope="row" style="border-top:1px solid #ebebea; width:175px !important; color:#666; background-color: #f8f9fb; text-align: left; vertical-align: top; ">
              <i class="fas fa-asterisk fa-xs"></i>문의제목
            </th>
            <td style="border-top:1px solid #ebebea; padding:10px 20px; color:#3a3635; background-color: #fff;">
              <input class="form-control" type="text" name='qna_title' id='qna_title' value='${qnaVO.qna_title}' required="required">
            </td> 
          </tr>        
        
          <!-- 문의내용 -->
          <tr>
            <th scope="row" style="border-top:1px solid #ebebea; width:175px !important; color:#666; background-color: #f8f9fb; text-align: left; vertical-align: top; ">
              <i class="fas fa-asterisk fa-xs"></i>문의내용
            </th>
            <td style="border-top:1px solid #ebebea; padding:10px 20px; color:#3a3635; background-color: #fff;">
              <div class="form-group">
                <textarea class="form-control" name="qna_content" id="qna_content" rows="7" required="required">${qnaVO.qna_content}</textarea> 
                <small id="FormControlTextarea" class="text-muted">0/5000글자</small>
              </div>
            </td> 
          </tr>
         
          <!--파일첨부
          <tr>
            <th scope="row" style="border-top:1px solid #ebebea; border-bottom:1px solid #ebebea; width:175px !important; color:#666; background-color: #f8f9fb;  text-align: left; vertical-align: top; ">파일첨부</th>
              <td style="border-top:1px solid #ebebea; border-bottom:1px solid #ebebea; padding:10px 20px; color:#3a3635; background-color: #fff;">
                <div class="file-upload-wrapper">
                  <input type='file' class="form-control input" name='fnamesMF'  value='' placeholder="파일 선택" multiple="multiple">
                <div>
                <small id="FormControlTextarea" class="text-muted">실행파일(exe), 링크(link), 아이콘(ico)은 첨부되지 않습니다.</small>
              </td> 
          </tr>--> 
        
        </table>
        
        <!-- qna 버튼 -->
        <div class="qna_btn_bottom">
          <button class="btn " type="button" id="qna_btn_send" data-toggle="modal" data-target="#qnaupdateModal">수정</button>
          <button class="btn" type="button" id="qna_btn_cancel" onclick="javascript:location.href='./qna_list.do?qnano=${param.qnano}';">취소</button>   
        </div> 
        
        <div class="modal fade" id="qnaupdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"aria-hidden="true"> 
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h6 class="modal-title" id="qnaupdateModal">글 수정</h6> 
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              </div>
              <div class="modal-body">수정된 변경사항을 저장하시겠습니까?</div>
              <div class="modal-footer">            
                <button type="submit" class="btn btn-primary" onclick="clickUpdate(frm)" >저장하기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
              </div>
            </div>
            <!-- modal-content END -->
          </div>
          <!-- modal-dialog END -->   
        </div>
        <!-- modal END -->   
         
        </div>
        <!-- tab-pane END -->    
      </FORM>
    </div>
    <!-- tab-content END -->    
    </div> 
    <!-- container END -->
  </section>
</div>


 <!-- bottom -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
<script src="../css/jquery.min.js"></script>
<script src="../css/material-bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
    $(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</body>
</html>