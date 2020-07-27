<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/new_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet'
  type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet">

<style type="text/css">
@media ( min-width : 768px) {
		.content {
				padding-left: 230px;
		}
}
</style>
<script>
  function clickDel(frm) {
    frm.action = "./qna_delete.do";
    frm.method = "post";
    frm.submit();
  }
</script>

</head>

<body>
  <c:set var="qnano" value="${qnaVO.qnano }" />
  <jsp:include page="../menu/top.jsp" flush='false' />


  <div>
    <!-- Tabs -->
    <section id="tabs">
      <div class="container">

      <h6 class="section-title h2">고객센터</h6>
      <ul class="nav nav-pills nav-pills-rounded justify-content-center">
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../faq/list_all.do';">FAQ</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./qna_reg.do';">1:1문의</a></li>
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list.do';">내 문의내역</a></li>
      </ul>

      <div class="tab-content mb-2">
      <!-- 내 문의 내역 시작 -->
        <div class="tab-pane fade show active" id="javascript:;">
        <h4 style="margin-top: 40px; text-align: left">나의 문의 내역</h4>
          
          <!-- 상단 -->
          <div class="qna_read_line">
            <span class="qna_read_cate">[${qnaVO.qna_categrpname}]</span> 
            <span class="qna_read_title"> ${qnaVO.qna_title}</span>
          </div>

          <div style="height: 30px;">
            <span class="read_td" style="padding-left: 25px;">${qnaVO.qna_email}</span> 
            <span class="read_td" style="padding-left: 25px;">${qnaVO.qna_rdate.substring(0, 16)}</span>
          </div>
          <div style="border-bottom: 1px solid #E3E3E3;"></div>
          
          <!-- 내용 -->
          <ul class="qna_read_cont">
            <li class="read_none">
              <div style="padding-top: 15px;">
                <span class="read_cont_mark">Q:</span> 
                <span class="read_cont">${qnaVO.qna_content}</span>
              </div>
            </li>
          </ul>
          <div style="margin-top: 10px; border-top: 1px solid #E3E3E3;"></div>
          
          <!-- 하단 -->
          <c:choose>
            <c:when test="${qnaVO.qna_thumb.endsWith('jpg') || qnaVO.qna_thumb.endsWith('png') || qnaVO.qna_thumb.endsWith('gif')}">
              <div class="read_img">
                <p>첨부파일 ></p>
                <IMG src='./storage/${qnaVO.qna_thumb }'>
              </div>
            </c:when>
          </c:choose>

          <div style="margin-top: 10px;">
            <button type="button" class="btn btn-outline-secondary" id="btn_read_list"
                       onclick="javascript:location.href='./list.do';">목록</button>
            <button type="button" class="btn btn-outline-secondary" id="btn_read_list"
                       onclick="javascript:location.href='./reply.do?qnano=${qnano}';">답변</button>
            <button type="button" class="btn btn-outline-secondary" id="btn_read_update"
                       onclick="javascript:location.href='./qna_update.do?qnano=${qnano}';">수정</button>
            <button type="button" class="btn btn-outline-secondary" id="btn_read_delete" data-toggle="modal"
                       data-target="#qnareadModal">삭제</button>
          </div>

          <!-- 삭제 Modal -->
          <FORM name='frm' id='frm' method='POST' action='./qna_delete.do'>
            <input type='hidden' name='qnano' id='qnano' value=' ${qnaVO.qnano }'>
            <div class="modal fade" id="qnareadModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                
                <div class="modal-content">
                  <!-- 모달 상단 -->
                  <div class="modal-header">
                    <h6 class="modal-title" id="qnareadModal">글 삭제</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  </div>
                  
                  <div class="modal-body">작성하신 글을 삭제하시겠습니까?</div>
                  
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" onclick="clickDel(frm)">삭제하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                  </div>
                </div>
                <!-- modal-content END -->
              </div>
              <!-- modal-dialog END -->
            </div>
            <!-- modal END -->
          </FORM>
        </div>
        <!--tab-pane END  -->
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