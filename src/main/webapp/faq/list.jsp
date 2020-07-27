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
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<script type="text/javascript">
  /* var a = 0;

   $(function() { // 자동 실행
   $('#info_help').on('click', spread_in);
   });

   function spread_in() {
   if (a == 0) { // 펼치기 버튼 클릭시
   $('#toggle_a').attr('class', 'toggle'); // lyrics id의 태그의 클래스가 lyrics로 변경
   a = 1;
   // $('#btn_spread').html('접기 △'); // btn_spread id 태그의 텍스트가 접기로 변경
   } else {
   $('#toggle_a').attr('class', 'toggle_none');
   a = 0;
   // $('#info_help').html('펼치기 ▽');
   }
   } */
</script>

<script type="text/javascript">
  /*
   document.addEventListener("DOMContentLoaded", function(event) { 
   
   var acc = document.getElementsByClassName("accordion");
   var panel = document.getElementsByClassName('toggle_none');

   for (var i = 0; i < acc.length; i++) {
       acc[i].onclick = function() {
           var setClasses = !this.classList.contains('active');
           setClass(acc, 'active', 'remove');
           setClass(panel, 'toggle', 'remove');

           if (setClasses) {
               this.classList.toggle("active");
               this.nextElementSibling.classList.toggle("toggle");
           }
       }
   }

   function setClass(els, className, fnName) {
       for (var i = 0; i < els.length; i++) {
           els[i].classList[fnName](className);
       }
   }

   });
   */
</script>
<script type="text/javascript">
  $(document).ready(
      function() {
        jQuery(".toggle_none").hide();
        //content 클래스를 가진 div를 표시/숨김(토글)
        $(".accordion").click(
            function() {
              $(".toggle_none").not(
                  $(this).next(".toggle_none").slideToggle(100)).slideUp();
            });
      });
</script>
</head>

<body>
  <c:set var="cateno" value="${faqVO.cateno }" />
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
          <div class="tab-pane fade show active" id="javascript:;">
            <div class="table_line"></div>

            <!-- 검색 -->
            <div>
              <div class="search_faq_section">
                <fieldset class="help_search_faq">
                  <input type="text" value="" placeholder="환불,이용권,회원가입" class="iptxt">
                  <button type="button" class="btn_search">찾기</button>
                </fieldset>
              </div>

              <div class="help_faq_tab">
                <ul style="padding-left: 0px;">
                  <li class="on"><a class="btn_tab_faq_normal" href='./list_all.do'>전체</a></li>
                  <li class="on"><a class="btn_tab_faq_normal" href='./list.do?cateno=1'>이용권/요금</a></li>
                  <li class="on"><a class="btn_tab_faq_normal" href='./list.do?cateno=2'>결제/해지/환불</a></li>
                  <li class="on"><a class="btn_tab_faq_normal" href='./list.do?cateno=3'>회원정보/로그인</a></li>
                  <li class="on"><a class="btn_tab_faq_normal" href='./list.do?cateno=4'>플레이어/재생목록</a></li>
                  <li class="on"><a class="btn_tab_faq_normal" href='./list.do?cateno=5'>서비스문의/오류</a></li>
                </ul>
              </div>

              <table id="help_list_table" class="help_list_table">
                <colgroup>
                  <col width="42">
                  <col width="*">
                  <col width="90">
                </colgroup>
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col" class="info">제목</th>
                    <th scope="col"></th>
                  </tr>
                </thead>

                <tbody>
                  <c:forEach var="faqVO" items="${list }">
                    <c:set var="faqno" value="${faqVO.faqno }" />
                    <tr class="accordion">
                      <td>${faqVO.faqno }</td>
                      <td class="info_help" id="info_help"><span><b>${faqVO.faq_categrp }</b> <span>${faqVO.faq_title }</span></span></td>
                      <td>
                        <A class='faq_link' href='./update.do?faqno=${faqno }'><i class="far fa-edit mr-3"></i></A>
                        <A class='faq_link' href='./delete.do?faqno=${faqno }'><i class="far fa-trash-alt"></i></A>
                      </td>
                    </tr>
                    <tr class='toggle_none'>
                      <td colspan="3" class="help_detail">
                        <span> ${faqVO.faq_content } </span>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>

              <div>
                <button type="button" class="btn_tab_faq_normal" onclick="javascript:location.href='./reg.do';">FAQ등록</button>
                <button type="button" class="btn_tab_faq_normal" onclick="javascript:location.href='../fcate/create.do';">카테고리등록</button>
              </div>

            </div>
            <!-- 검색 END -->
          </div>
          <!-- tab-pane END -->
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
      $(function() {
        $('[data-toggle="tooltip"]').tooltip();
      });
    </script>
</body>
</html>