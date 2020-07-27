<%@ page contentType="text/html; charset=UTF-8"%>

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
</head>

<body>
  <jsp:include page="../menu/top.jsp" flush='false' />

  <div>
    <!-- Tabs -->
    <section id="tabs">
      <div class="container">
        <h6 class="section-title h2">고객센터</h6>
        <ul class="nav nav-pills nav-pills-rounded justify-content-center">
          <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../faq/list_all.do';">FAQ</a></li>
          <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./qna_reg.do';">1:1문의</a></li>
          <li class="nav-item"><a class="nav-link " data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list.do';">내 문의내역</a></li>
        </ul>

        <div class="tab-content mb-2">
          <FORM name='frm' method='POST' action='./qna_reg.do' enctype="multipart/form-data">
            <div class="tab-pane fade show active" id="javascript:;">
            <div class="table_line"></div>
            
            <input type="hidden" name='userno' id='userno' value='${sessionScope.userno}'>
              
              <!-- 테이블 시작 -->
              <table class="table" style="margin-top: 10px;">
                <!-- 문의유형 -->
                <tr>
                  <th scope="row" style="border-top: 2px solid #4c4c4c; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>문의유형
                  </th>
                  <td style="border-top: 2px solid #4c4c4c; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <div class="categoryArea" style="overflow: hidden;">
                      <span class="browser-default custom-select" style="width: 198px;"> 
                      <select name='qna_categrpname' id="qna_categrpname" required="required">
                        <option value="pc">PC</option>
                        <option value="스마트폰">스마트폰</option>
                        <option value="플레이어">플레이어</option>
                        <option value="멤버십">멤버십</option>
                        <option value="쿠폰">쿠폰</option>
                        <option value="이벤트">이벤트</option>
                        <option value="기타">기타</option>
                      </select>
                      </span>
                    </div>
                  </td>
                </tr>

                <%-- <!-- 이메일 -->
                <tr>
                  <th scope="row" style="border-top: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>이메일
                  </th>
                  <td style="border-top: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <input class="form-control" type="text" required="required" name='qna_email' id='qna_email' placeholder="이메일을 입력하세요" value='${sessionScope.userno}'>
                  </td>
                </tr> --%>

                <!-- 문의제목 -->
                <tr>
                  <th scope="row" style="border-top: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>문의제목
                  </th>
                  <td style="border-top: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <input class="form-control" type="text" name='qna_title' id='qna_title' required="required">
                  </td>
                </tr>

                <!-- 문의내용 -->
                <tr>
                  <th scope="row"style="border-top: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">
                    <i class="fas fa-asterisk fa-xs"></i>문의내용
                  </th>
                  <td style="border-top: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <div class="form-group">
                      <textarea class="form-control" name="qna_content" id="qna_content" rows="7" required="required"></textarea>
                      <small id="FormControlTextarea" class="text-muted">0/5000글자</small>
                    </div>
                  </td>
                </tr>

                <!-- 파일첨부 -->
                <tr>
                  <th scope="row" style="border-top: 1px solid #ebebea; border-bottom: 1px solid #ebebea; width: 175px !important; color: #666; background-color: #f8f9fb; text-align: left; vertical-align: top;">파일첨부</th>
                  <td style="border-top: 1px solid #ebebea; border-bottom: 1px solid #ebebea; padding: 10px 20px; color: #3a3635; background-color: #fff;">
                    <div class="file-upload-wrapper">
                      <input type='file' class="form-control input" name='fnamesMF' value='' placeholder="파일 선택" multiple="multiple">
                      <div>
                        <small id="FormControlTextarea" class="text-muted">실행파일(exe), 링크(link), 아이콘(ico)은 첨부되지 않습니다.</small>
                      </div>
                    </div>
                  </td>
                </tr>
              </table>

              <!-- qna 버튼 -->
              <div class="qna_btn_bottom">
                <input class="btn " type="submit" id="qna_btn_send" value="확인">
                <button class="btn" type="button" id="qna_btn_cancel"onclick="javascript:location.reload();">취소</button>
              </div>
            </div>
            <!-- tab-pane END -->
          </FORM>
        </div>
        <!-- tab-content ENd -->
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

<script type="text/javascript">
  $(document).ready(function(){
    $('ul li a').click(function(){
      $('li a').removeClass("active");
      $(this).addClass("active");
    });
  });
</script>

</body>
</html>