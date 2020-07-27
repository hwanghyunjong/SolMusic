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
<link rel="stylesheet" href="../ckeditor/contents.css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style type="text/css">
@media ( min-width : 768px) {
		.content {
				padding-left: 230px;
		}
}
</style>
</head>

<body>
  <c:set var="faqno" value="${faqVO.faqno }" />
  <jsp:include page="../menu/top.jsp" flush='false' />

  <div>
    <!-- Tabs -->
    <section id="tabs">
      <div class="container">
        <h6 class="section-title h2">고객센터</h6>
        
        <!-- 메뉴 -->
        <ul class="nav nav-pills nav-pills-rounded justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list_all.do';">FAQ</a>
          </li>
          <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="javascript:;"onclick="javascript:location.href='../qna/qna_reg.do';">1:1문의</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="javascript:;"onclick="javascript:location.href='../qna/list.do';">내 문의내역</a>
          </li>
        </ul>

        <div class="tab-content mb-2">
          <FORM class="form-horizontal" name='frm' method='POST' action='./delete.do'>
            <input type='hidden' name='faqno' id='faqno' value='${faqVO.faqno }'>
            
            <div class="tab-pane fade show active" id="javascript:;">
            <div class="table_line"></div>
            <!--Card-->
              <div class="card" style="margin: 0px auto; margin-top: 40px; width: 60%;">
                <h5 class="card-header text-center" style="background-color: #ff4865; color: white;">
                  <strong>FAQ 삭제</strong>
                </h5>

                <!--Card content-->
                <div class="card-body px-lg-5">

                  <!-- name -->
                  <div class="form-group row">
                  <label for="faq_categrp" class="col-sm-2 col-form-label">카테고리</label>
                  <input type="text" class="form-control" required="required" placeholder="카테고리" style="margin-bottom: 5px; width:80%;" 
                           name="faq_categrp" id="faq_categrp" value='${faqVO.faq_categrp }'>
                  </div>

                  <!-- faq_title -->
                  <div class="form-group row">
                  <label for="faq_title" class="col-sm-2 col-form-label">제목</label>
                  <input type="text" class="form-control" style="margin-bottom: 5px; width:80%;" 
                           name='faq_title' id='faq_title' value='${faqVO.faq_title }'>
                  </div>

                  <!-- faq_content -->
                  <div class="form-group row" style="margin-left:0px;">
                  <label for="faq_content">내용</label>
                  <textarea class="form-control rounded-0" id="faq_content" rows="10" style="margin-bottom: 12px;" >'${faqVO.faq_content }'</textarea>
                  </div>

                  <!-- Sign in button -->
                  <div class="qna_btn_bottom">
                    <input class="btn " type="submit" id="qna_btn_send" value="삭제">
                    <button class="btn" type="button" id="qna_btn_cancel" onclick="history.back();">취소</button>
                  </div>

                </div>
                <!-- card body END -->
              </div>
              <!-- card END -->
            </div>
            <!-- tab pane -->
          </FORM>
        </div>
        <!-- tab-content -->
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
      $(function() {
        $('[data-toggle="tooltip"]').tooltip();
      });
    </script>

</body>
</html>