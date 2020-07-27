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

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/JavaScript">
  $(function() {
    CKEDITOR.replace('faq_content'); // <TEXTAREA>태그 id 값
  });

  // content: textarea name
  if (CKEDITOR.instances['faq_content'].getData() == '') {
    window.alert('내용을 입력해 주세요.');
    CKEDITOR.instances['faq_content'].focus();
    return false;
  }
</script>

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
        <ul class="nav nav-pills nav-pills-rounded justify-content-center">
          <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list_all.do';">FAQ</a></li>
          <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_reg.do';">1:1문의</a></li>
          <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/list.do';">내 문의내역</a></li>
        </ul>

        <div class="tab-content mb-2">
          <FORM name='frm' method='POST' action='./update.do' enctype="multipart/form-data">
            <input type='hidden' name='faqno' id='faqno' value='${faqVO.faqno }'>
            <div class="tab-pane fade show active" id="javascript:;">
              <div class="table_line"></div>

              <!-- 테이블 시작 -->
              <table class="table" style="margin-top: 10px;">
                <!-- 문의유형 -->
                <tr>
                  <th scope="row" style="border-top: 2px solid #4c4c4c; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>질문유형
                  </th>
                  <td style="border-top: 2px solid #4c4c4c; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <div class="categoryArea" style="overflow: hidden;">
                      <span class="browser-default custom-select"style="width: 198px;"> 
                      <select name='faq_categrp' id="faq_categrp"required="required">
                          <option value="이용권/요금"
                            ${faqVO.faq_categrp=='이용권/요금'?"selected='selected'":"" }>이용권/요금</option>
                          <option value="결제/해지/환불"
                            ${faqVO.faq_categrp=='결제/해지/환불/요금'?"selected='selected'":"" }>결제/해지/환불</option>
                          <option value="회원정보/로그인"
                            ${faqVO.faq_categrp=='회원정보/로그인/요금'?"selected='selected'":"" }>회원정보/로그인</option>
                          <option value="플레이어/재생목록"
                            ${faqVO.faq_categrp=='플레이어/재생목록/요금'?"selected='selected'":"" }>플레이어/재생목록</option>
                          <option value="서비스문의/오류"
                            ${faqVO.faq_categrp=='서비스문의/오류/요금'?"selected='selected'":"" }>서비스문의/오류</option>
                      </select>
                      </span>
                    </div>

                    <div style="margin-top: 10px; width: 25%;">
                      <input class="form-control" type="number" required="required" name='cateno' id='cateno' placeholder="No.">
                    </div>
                  </td>
                </tr>

                <!-- 질문 제목 -->
                <tr>
                  <th scope="row"
                    style="border-top: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>질문 제목
                  </th>
                  <td style="border-top: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <input class="form-control" type="text" required="required" placeholder="제목을 입력하세요" name='faq_title' id='faq_title' value='${faqVO.faq_title }'>
                  </td>
                </tr>

                <!-- 검색어 -->
                <tr>
                  <th scope="row" style="border-top: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>검색어
                  </th>
                  <td style="border-top: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <input class="form-control" type="text" name='faq_word' value='${faqVO.faq_word }' required="required" placeholder="Keyword">
                  </td>
                </tr>

                <!-- 질문내용 -->
                <tr>
                  <th scope="row" style="border-top: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>질문내용
                  </th>
                  <td style="border-top: 1px solid #ebebea; border-bottom: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <div class="form-group">
                      <textarea class="ckeditor" name='faq_content' id='faq_content' rows='6' cols='70'>${faqVO.faq_content } </textarea>
                    </div>
                  </td>
                </tr>
              </table>

              <!-- FAQ 버튼 -->
              <div class="qna_btn_bottom">
                <input class="btn " type="submit" id="qna_btn_send" value="수정">
                <button class="btn" type="button" id="qna_btn_cancel" onclick="history.back();">취소</button>
              </div>
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