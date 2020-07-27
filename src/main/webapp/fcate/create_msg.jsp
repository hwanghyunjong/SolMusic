<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/new_style.css" rel='Stylesheet' type='text/css'>
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
  <jsp:include page="../menu/top.jsp" flush='false' />

  <div>
    <!-- Tabs -->
    <section id="tabs">
      <div class="container">
        <h6 class="section-title h2">고객센터</h6>
        <div class="section_line"></div>
        <h4>1:1문의하기</h4>
        <ul>
          <c:choose>
            <c:when test="${cnt == 1 }">
              <LI class='li_none'><span class='qna_span_success'>카테고리 그룹이 정상적으로 등록되었습니다.</span><br>
              <div style="margin-bottom: 20px;"></div></LI>
            </c:when>
            <c:otherwise>
              <LI class='li_none'><span class='qna_span_fail'>카테고리 등록에 실패했습니다.</span></LI>
            </c:otherwise>
          </c:choose>

          <c:choose>
            <c:when test="${cnt == 1 }">
              <div class="qna_btn_bottom">
                <button class="btn" type='button' id="qna_btn_info" onclick="location.href='./list_all.do'">문의/답변 확인</button>
                <button class="btn" type="button" id="qna_btn_info"onclick="location.href='./create.do'">등록하기</button>
              </div>
            </c:when>
            <c:otherwise>
              <div class="qna_btn_bottom">
                <button class="btn btn-info" type='button' style="margin: 10px auto;" onclick="history.back();">다시시도</button>
              </div>
            </c:otherwise>
          </c:choose>
        </ul>

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