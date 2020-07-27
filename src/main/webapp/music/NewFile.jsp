<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
  
  .help_list_table {
    height: 220px;
    overflow: hidden;
  }
  
  .lyrics {
    font-size: 13px;
    color: #999999;
    line-height: 22px;
  }
</style>
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_spread').on('click', spread_in);
  });
  
  function spread_in() {
    if ($('#btn_spread').html() == '펼치기 ▽' ) {
      $('#lyrics').attr('class', 'lyrics');
      $('#btn_spread').html('접기 △');
    } else {
      $('#lyrics').attr('class', 'lyrics_hide');
      $('#btn_spread').html('펼치기 ▽');
    }
  }
  
</script>
</head>

<body>
<c:set var="faqno" value="${faqVO.faqno }"/>
<jsp:include page="../menu/top_sub.jsp" flush='false' />

<div>
<!-- Tabs -->
<section id="tabs">
  <div class="container">
  <h6 class="section-title h2">고객센터</h6>
    <ul class="nav nav-pills nav-pills-rounded justify-content-center">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./reg.do';">FAQ</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_reg.do';">1:1문의</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='../qna/qna_list.do';">내 문의내역</a>
      </li>
    </ul>

    <div class="tab-content mb-2" >
      
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
          <ul style="padding-left:0px;">
          <li class="on">
            <button type="button" class="btn_tab_faq_normal">전체</button>
          </li>
          <li class="on">
             <button type="button" class="btn_tab_faq_normal">이용권/요금</button>
          </li>
          <li class="on">
             <button type="button" class="btn_tab_faq_normal">결제/해지/환불</button>
          </li>
          <li class="on">
             <button type="button" class="btn_tab_faq_normal">회원정보/로그인</button>
          </li>
          <li class="on">
             <button type="button" class="btn_tab_faq_normal">플레이어/재생목록</button>
          </li>
          <li class="on">
             <button type="button" class="btn_tab_faq_normal">서비스문의/오류</button>
          </li>  
          </ul>
        </div>
          
        <!--Accordion wrapper-->
        
        <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true">

        <!-- header -->
        <div class="help_list" role="tab" id="headingTwo1">
          <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#collapse"
               aria-expanded="false" aria-controls="collapse">
           
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
              <tr class="faq_list">
                <td>${faqVO.faqno }</td>
                <td class="info_help">
                <span>
                  <b>${faqVO.faq_categrp }</b>
                  <span>${faqVO.faq_title }</span>
                </span>
                </td>
                <td><i class="fas fa-angle-down rotate-icon"></i></td>
              </tr>
              </c:forEach>
            </tbody>
                 
          </table>  
          </a>
      </div>

      <!-- Card body -->

      <div id="collapse" class="collapse" role="tabpanel" aria-labelledby="collapse"data-parent="#accordionEx1">
      <div class="card-body">
        <br>
        <span>${faqVO.faq_content }</span>
      </div>
      </div>
     
      </div><!-- accordion END -->

      <div>
        <button type="button" class="btn_tab_faq_normal">등록</button>
        <button type="button" class="btn_tab_faq_normal">삭제</button>
      </div>
      
      
      </div><!-- 검색 END -->          
    </div><!-- tab-pane END -->    
    </FORM>
    </div> <!-- tab-content END --> 
  </div> <!-- container END -->
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