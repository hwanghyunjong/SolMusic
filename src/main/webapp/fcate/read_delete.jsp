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

<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</head>

<body>
  <jsp:include page="../menu/top.jsp" flush='false' />

  <div>
    <!-- Tabs -->
    <section id="tabs">
      <div class="container">
        <h6 class="section-title h2">고객센터</h6>
        <ul class="nav nav-pills nav-pills-rounded justify-content-center">
          <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list_all.do';">FAQ</a></li>
          <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_reg.do';">1:1문의</a></li>
          <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_list.do';">내 문의내역</a></li>
        </ul>

        <!-- 카테고리 그룹 시작 -->
        <div class="card" style="margin: 0px auto; margin-top: 40px; width: 60%;">
          <h5 class="card-header text-center" style="background-color: #ff4865; color: white;"><strong>FAQ 카테고리 그룹 목록</strong></h5>

          <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
            <FORM name='frm_create' id='frm_create' method='POST' action='./delete.do'>
              <input type='hidden' name='cateno' id='cateno' value='${fcateVO.cateno }'> <label>그룹 번호</label>
              <input type='number' name='cateno' value='${fcateVO.cateno }' required="required" style='width: 10%;'> 
              <label>카테고리 이름</label> 
              <input type='text' name='name' value='${fcateVO.name }' required="required" style='width: 25%;'>

              <button type="submit" id='submit'>삭제</button>
              <button type="button" onclick="location.href='./list.do'">취소</button>
            </FORM>
          </DIV>

          <!--Card content-->
          <div class="card-body px-lg-5">
            <div class="qna_table_line">
              <table class="table table-hover">
                <colgroup>
                  <col style='width: 10%; text-align: center;' />
                  <col style='width: 60%; text-align: center;' />
                  <col style='width: 30%; text-align: center;' />
                </colgroup>
                <thead>
                  <tr>
                    <th class="qna_th_bs">No.</th>
                    <th class="qna_th_bs">Name.</th>
                    <th class="qna_th_bs">*</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="fcateVO" items="${list }">
                    <c:set var="cateno" value="${fcateVO.cateno }" />
                    <tr>
                      <td class="qna_td_bs">${fcateVO.cateno}</td>
                      <td class="qna_td_bs"><A href="./fcate_read.do?fcateno=${cateno }">${fcateVO.name}</A></td>
                      <td class="qna_td_bs">
                        <A class='faq_link' href='./update.do?cateno=${cateno }'>수정</A><span class='top_menu_sep'>&nbsp;</span> 
                        <A class='faq_link' href='./delete.do?cateno=${cateno }'>삭제</A><span class='top_menu_sep'>&nbsp;</span>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <div>
              <button type="button" class="btn btn-outline-secondary" id="btn_read_list"
                onclick="javascript:location.href='./create.do';">등록</button>
              <button type="button" class="btn btn-outline-secondary" id="btn_read_list"
                onclick="javascript:location.href='../faq/list_all.do';">FAQ 목록</button>
              <button type="button" class="btn btn-outline-secondary" id="btn_read_list"
                onclick="javascript:location.href='../qna/qna_reg.do';">QNA 목록</button>
            </div>
          </div>
          <!-- card-body END -->
        </div>
        <!-- card END -->
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




