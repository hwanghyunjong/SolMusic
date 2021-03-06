<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
 
<DIV class='title_line'><H2 style='text-align: center;'>알림</H2></DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul style='list-style:none; text-align: center;'>
        <c:choose>
          <c:when test="${param.cnt == 0}">
            <li class='li_none' >[${param.user_name}] 회원 정보 삭제에 실패했습니다.</li>
          </c:when>
          <c:otherwise>
            <li class='li_none' >[${param.user_name}] 회원 정보 삭제에 성공했습니다.</li>
          </c:otherwise>
        </c:choose>
     
        <li class='li_none' >
          [<A href='./list.do'>목록</A>]
          [<A href='${pageContext.request.contextPath}/index.jsp'>확인</A>]
        </li>
        
      </ul>
    </fieldset>    
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 