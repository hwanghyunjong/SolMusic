<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<!-- Styles -->
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/list_style.css" rel='Stylesheet' type='text/css'>
<link href="../css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../js/plugins/swiper/css/swiper.min.css" rel='Stylesheet'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_pay').on('click', kakao);
  });

 function kakao() {
    var IMP = window.IMP; // 생략가능
    IMP.init('TC0ONETIME'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'KH Books 도서 결제',
        amount : '20000',
        buyer_email : '12314@gmail.com',
        buyer_name : '아로미',
        buyer_tel : '010-2020-1010',
        buyer_addr : '서울시',
        buyer_postcode : '123-456',
        //m_redirect_url : 'http://www.naver.com'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "./complete.jsp", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    // [3] 아직 제대로 결제가 되지 않았습니다.
                    // [4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            // 성공시 이동할 페이지
            location.href='<%=request.getContextPath()%>/payment/NewFile.jsp?msg='+msg;
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            // 실패시 이동할 페이지
            location.href="<%=request.getContextPath()%>/payment/NewFile.jsp";
            alert(msg);
        }
    });
    
};
</script>


<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
</style>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<!-- 아티스트 간략한 정보  -->
<div class="container-fluid" style="padding: 55px 180px 0px 120px;">
  <div class='title_line'>
    <span style="font-size: 28px; font-weight: 700;">MP3 이용권 구매</span>
    <div style="float: right;">
      <span class="menu_aside"><A href='./create_album_form.do'>앨범 등록</A></span>
      <span class="menu_aside"> | </span>
      <span class="menu_aside"><A href='./update_form.do'>수정</A></span>
      <span class="menu_aside"> | </span>
      <span class="menu_aside"><A href='./delete_form.do'>삭제</A></span>
    </div>
  </div>
</div>

<div class="container-fluid" style="padding: 0px 120px; margin-bottom: 75px; margin-top: 50px;">
  <div>
    <div style="width: 80%; margin: 0px auto;">
      <i class='fas fa-headphones-alt' style='font-size:24px; color: #c71744;'></i>&nbsp;
      <span style="color: #c71744; font: 500; font-size: 24px;">무제한 듣기 + 무제한 다운</span><br><br>
      <div style="height: 100px; border: 2px inset #FF4865; margin-bottom: 18px;">
        <div style="width: 30%; height: 100%; background-color: #F9ADB7; padding: 32px 75px; float: left;">
          <h4 style='color: white;'>1일 이용권</h4>
        </div>
        <div style="width: 100%; height: 100%; padding: 32px 75px;">
          <span style="font: bolder; margin-left: 50px;">▷ 1일권</span>
          <span style="font: bolder; color: #FF4865; margin-left: 130px;">1,500 원</span>
          <button type="button" id='btn_pay' class="btn btn-outline-danger" style="margin-left: 150px;">구매</button>
        </div>
      </div>
      <div style="height: 100px; border: 2px inset #FF4865; margin-bottom: 18px;">
        <div style="width: 30%; height: 100%; background-color: #F9ADB7; padding: 32px 75px; float: left;">
          <h4 style='color: white;'>7일 이용권</h4>
        </div>
        <div style="width: 100%; height: 100%; padding: 32px 75px;">
          <span style="font: bolder; margin-left: 50px;">▷ 7일권</span>
          <span style="font: bolder; color: #FF4865; margin-left: 130px;">5,500 원</span>
          <button type="button" id='btn_pay' class="btn btn-outline-danger" style="margin-left: 150px;">구매</button>
        </div>
      </div>
      <div style="height: 100px; border: 2px inset #FF4865; margin-bottom: 18px;">
        <div style="width: 30%; height: 100%; background-color: #F9ADB7; padding: 32px 70px; float: left;">
          <h4 style='color: white;'>30일 이용권</h4>
        </div>
        <div style="width: 100%; height: 100%; padding: 32px 75px;">
          <span style="font: bolder; margin-left: 50px;">▷ 30일권</span>
          <span style="font: bolder; color: #FF4865; margin-left: 120px;">15,000 원</span>
          <button type="button" id='btn_pay' class="btn btn-outline-danger" style="margin-left: 145px;">구매</button>
        </div>
      </div>
    </div>
    
  
  </div>
</div>
 

 
 <!-- bottom -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
<script src="../css/jquery.min.js"></script>
<script src="../css/material-bootstrap.min.js"></script>
<script src="../js/plugins/swiper/js/swiper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
    $(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
    
    $(".waves-effect").click(function(){
      $("a").attr("class", "waves-effect");
      $(this).attr("class", "active");
    });
</script>
<!-- Initialize Swiper -->

</body>
</html>