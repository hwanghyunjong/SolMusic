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
      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./qna_reg.do';">1:1문의</a></li>
      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="javascript:;" onclick="javascript:location.href='./list.do';">내 문의내역</a></li>
    </ul>

    <div class="tab-content mb-2" > 
    <!-- 내 문의 내역 시작 -->
      <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='qnano' value='${qnaVO.qnano }'>
      <div class="tab-pane fade show active" id="javascript:;">
      <h4 style="margin-top:40px; text-align:left">나의 문의 내역</h4> 
      <div class="qna_list_line">
        <span> - 문의주신 내용을 24시간 이내 답변을 드릴 수 있도록 노력하고 있습니다.</span><br>
        <span> - 문의 접수가 집중되거나, 확인절차가 많아지는 경우 답변이 지연될 수 있습니다.</span>
      
        <ASIDE style='float: right;'>
          <c:choose>
            <c:when test="${param.word != ''}"> <%-- 검색하는 경우 --%>
               ${param.word } ${search_count } 건 검색됨.
            </c:when>
            <c:otherwise> <%-- 검색하지 않는 경우 --%>
               ${search_count } 건 등록됨
            </c:otherwise>
          </c:choose>
          <c:choose>
            <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
              <input type='text' class='ipt_word' name='word' id='word' value='${param.word }' placeholder="Search..." style='width: 35%;'>
            </c:when>
            <c:otherwise> <%-- 검색하지 않는 경우 --%>
              <input type='text' class='ipt_word' name='word' id='word' value='' placeholder="Search..." style='width: 40%;'>
            </c:otherwise>
          </c:choose>
          <button type='submit' class="search">검색</button>
          <c:if test="${param.word.length() > 0 }">
          <button type='button' class="search"
                     onclick="location.href='./list.do?qna_title=${qnaVO.qna_title}&word='">검색 취소</button>  
          </c:if>          
        </ASIDE>
      </div>
        
      <div class="qna_table_line">
        <table class="table table-hover">
          <colgroup>
    
            <col style='width: 10%; text-align:center;'/>
            <col style='width: 30%; text-align:center;'/>
            <col style='width: 15%; text-align:center;'/>
            <col style='width: 15%; text-align:center;'/>    
            <col style='width: 15%; text-align:center;'/>
          </colgroup>
          <thead>
            <tr>
        
              <th class="qna_th_bs">no.</th>
              <th class="qna_th_bs">제목</th>
              <th class="qna_th_bs">문의유형</th>
              <th class="qna_th_bs">작성자</th>
              <th class="qna_th_bs">작성일</th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="qnaVO" items="${list }">
              <c:set var="qnano" value="${qnaVO.qnano }" />
              <c:set var="grpno" value="${qnaVO.grpno }" />
              <c:set var="indent" value="${qnaVO.indent }" />
              <c:set var="ansnum" value="${qnaVO.ansnum }" />
              <tr>
                <td class="qna_td_bs">${qnano}</td>
                <td class="qna_td_title">
                <c:choose>
                  <c:when test="${ansnum == 0 }"> <%-- 부모글인 경우 아이콘 출력 --%>
                    
                  </c:when>
                  <c:when test="${ansnum > 0 }"> <%-- 자식글 아이콘 출력, 들여 쓰기 --%>
                    <img src='./images/white.png' style='width: ${indent * 20}px; height: 40px; opacity: 0.0;'>
                    <img src='./images/reply3.png'>
                  </c:when>
                </c:choose>
                <A href="./qna_read.do?qnano=${qnano }">${qnaVO.qna_title}</A>
                </td>      
                
                <td class="qna_td_bs">${qnaVO.qna_categrpname}</td>
                <td class="qna_td_bs">${sessionScope.userID}</td>
                <td class="qna_td_bs">${qnaVO.qna_rdate.substring(0, 10)}</td>
              </tr>
            </c:forEach>
          </tbody> 
        </table>
        <DIV class='bottom_menu'>${paging }</DIV>

      </div>
      <!-- qna_table_line END -->              

      </div>
      <!-- tab-pane -->
      </form>
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