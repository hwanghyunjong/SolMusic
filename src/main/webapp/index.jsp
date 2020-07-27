<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SolMusic</title>

<!-- Styles -->
<link href="./css/new_style.css" rel='Stylesheet' type='text/css'>
<link href="./css/material-bootstrap.min.css" rel='Stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./js/plugins/swiper/css/swiper.min.css" rel='Stylesheet' >

<style type="text/css">
  @media (min-width: 768px) {
    .content { padding-left: 230px; }
  }
  
  @media (max-width: 1499px){
    .today_mag .link_wrap{width: 964px;}
}

</style>


</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />


<div class="container-fluid" style="padding-right: 0px; padding-left: 0px;">
  <div class="today_mag">
    <h2 class="blind">매거진 헤드라인</h2>
    <div class="link_wrap">
      <a href="#" class="link">
        <div class="thumb">
          <img src="https://music-phinf.pstatic.net/20200716_218/1594873744233D4Izj_JPEG/01.jpg?type=w720" alt="" class="img_thumb">      
        </div>
        <div class="text_area">
          <img src="https://music-phinf.pstatic.net/20190527_64/1558943253671FKQca_PNG/icon_GENRE.png" alt="Pick" class="icon_mag">
          <strong class="title">다시 찾아온 여름, <br> 새롭게 찾아온 여성 아이돌</strong>
        <div class="info">
            주거니 받거니 하듯이 남성 아이돌 그룹과 여성 아이돌 그룹이 일정 시기마다 번갈아 가며 음반을 발표하고 있다. 특히 이번 시즌의 경우 솔로 데뷔와 유닛 활동도 눈에 띈다. 올여름 귀에서 머물 여성 음악가의 음악을 찾아 들어보자. - 하박국   
        </div>
        <div class="sub">
          <span class="item">
            <span class="blind">작성자</span>
            SOL MAG
          </span>
          <span class="item">
            <span class="blind">작성일</span>
            2020.07.16
          </span>
        </div>
        </div>
      </a>
    </div>
  </div>
</div><!--container END -->

<div class="container-fluid" style="padding-top:50px; padding-right:50px; padding-left: 50px;">
  <div class="heading-album">
    <h1>발매앨범</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="list_panel">
    <ul class="thumbnail_list">
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/62/799/10462799_20200717150822_500.jpg?adcaec1a0d99e7a379c098d31dca68da/melon/resize/156/quality/80/optimize" width="200" height="200" alt="다시 여기 바닷가">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>다시 여기 바닷가</span>
          </a>
          <a href="" class="artist_title_text">
            <span>싹스리</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/51/566/10451566_20200626114914_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="How You Like That">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>How You Like That</span>
          </a>
          <a href="" class="artist_title_text">
            <span>BLACKPINK</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/52/351/10452351_20200629152036_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="마리아(Maria)">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>마리아(Maria)"</span>
          </a>
          <a href="" class="artist_title_text">
            <span>화사</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/53/701/10453701_20200701151802_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="Summer Hate">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>Summer Hate</span>
          </a>
          <a href="" class="artist_title_text">
            <span>지코(ZICO)</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/26/648/10426648_20200506153340_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="에잇">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>에잇(Prod.&Feat.SUGA of BTS)</span>
          </a>
          <a href="" class="artist_title_text">
            <span>아이유</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="NONSTOP">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/23/289/10423289_20200427153909_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="NONSTOP">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>살짝 설렜어(Nonstop)</span>
          </a>
          <a href="" class="artist_title_text">
            <span>오마이걸</span>
          </a>     
        </div>
      </li>
      
            <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="More&More">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/37/786/10437786_20200601141555_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="More&More">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>More & More</span>
          </a>
          <a href="" class="artist_title_text">
            <span>TWICE(트와이스)</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="Boyhood">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/59/162/10359162_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="Boyhood">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>METEOR</span>
          </a>
          <a href="" class="artist_title_text">
            <span>창모(CHANGMO)</span>
          </a>     
        </div>
      </li>
      
            <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="Love poem">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/46/650/10346650_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="Love poem">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>Blueming</span>
          </a>
          <a href="" class="artist_title_text">
            <span>아이유</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="MAP OF THE SOUL">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/77/346/10377346_20200221153622_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="MAP OF THE SOUL">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>ON</span>
          </a>
          <a href="" class="artist_title_text">
            <span>방탄소년단</span>
          </a>     
        </div>
      </li>
      
            <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="Error">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/54/538/10454538_20200702150451_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="Error">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>Error(Feat.Loopy)</span>
          </a>
          <a href="" class="artist_title_text">
            <span>ASH ISLAND</span>
          </a>     
        </div>
      </li>
      
            <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="항해">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/31/947/10331947_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="항해">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>어떻게 이별까지 사랑하겠어, 널 사랑하는 거지</span>
          </a>
          <a href="" class="artist_title_text">
            <span>AKMU(악동뮤지션)</span>
          </a>     
        </div>
      </li>
      
            <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="The ReVe Festival">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/68/053/10368053_20191223155246_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="The ReVe Festival">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>Psyco</span>
          </a>
          <a href="" class="artist_title_text">
            <span>Red Velvet(레드벨벳)</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="回:Song of the Sirens">
              <img src="https://cdnimg.melon.co.kr/cm2/album/images/104/59/845/10459845_20200713152520_500.jpg/melon/resize/120/quality/80/optimize" width="200" height="200" alt="回:Song of the Sirens">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span>Apple</span>
          </a>
          <a href="" class="artist_title_text">
            <span>여자친구(GFRIEND)</span>
          </a>     
        </div>
      </li>   
    </ul>
  </div>
</div> 


<!-- 아티스트 -->
<!-- Swiper -->
<div class="artist-container-fluid"> 
  <div class="heading-artist">
    <h1>아티스트</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="swiper-container">
    <div class="swiper-wrapper">
    
      <div class="swiper-slide">
        <div class="box">
          <div class="box_img">
            <img alt="" src="./images/artist/artist1.png" >
          </div>
          <div class="box_text">
            <h3><a href="#">아무개</a></h3>
          </div>
        </div>
      </div>
      
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist2.png" >
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
        </div>
        </div>
        
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist3.png" >
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
          </div>
          </div>
          
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist4.png">
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
        </div>
        </div>
        
        <div class="swiper-slide">
          <div class="box">
            <div class="box_img">
              <img alt="" src="./images/artist/artist5.png">
            </div>
            <div class="box_text">
              <h3> <a href="#">아무개</a></h3>
            </div>
          </div>       
        </div>
        
        <div class="swiper-slide">Slide 6</div>
        <div class="swiper-slide">Slide 7</div>
        <div class="swiper-slide">Slide 8</div>
        <div class="swiper-slide">Slide 9</div>
        <div class="swiper-slide">Slide 10</div>
    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    </div><!--swiper-container END -->
</div><!-- artist container END -->


<!-- 뮤직비디오 -->
<div class="container-fluid" style="padding-right:50px; padding-left: 50px;">
  <div class="heading-mv">
    <h1>뮤직비디오</h1>
      <span class="view_all"><a href="#">더 보기 ></a></span>
  </div>
  <div class="list_panel">
    <ul class="thumbnail_list">
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">         
            <a href="" class="link_thumbnail" title="여름안에서">
              <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/23/152/50223152_20200710151009_640.jpg/melon/resize/240/quality/80/optimize" width="200" height="200" alt="여름안에서">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge all"></span>
            <span>여름 안에서</span>
          </a>
          <a href="" class="artist_title_text">
            <span>싹스리(유두래곤,린다G,비룡)</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="How You Like That">
              <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/22/554/50222554_20200626173231_640.jpg/melon/resize/240/quality/80/optimize" width="200" height="200" alt="How You Like That">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge o12"></span>
            <span>How You Like That</span>
          </a>
          <a href="" class="artist_title_text">
            <span>BLACKPINK</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/22/648/50222648_20200629172809_640.jpg/melon/resize/240/quality/80/optimize" width="200" height="200" alt="마리아(Maria)">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge o15"></span>
            <span>마리아(Maria)"</span>
          </a>
          <a href="" class="artist_title_text">
            <span>화사</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="다시 여기 바닷가">
              <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/22/761/50222761_20200701175946_640.jpg/melon/resize/240/quality/80/optimize" width="200" height="200" alt="Summer Hate">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge o15"></span>
            <span>Summer Hate</span>
          </a>
          <a href="" class="artist_title_text">
            <span>지코(ZICO)</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="깡">
              <img src="https://cdnimg.melon.co.kr/cm/mv/images/wide/501/76/468/50176468_2_640.jpg/melon/resize/240/quality/80/optimize" width="200" height="200" alt="깡">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge o15"></span>
            <span>깡</span>
          </a>
          <a href="" class="artist_title_text">
            <span>비</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="NONSTOP">
              <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/19/624/50219624_20200427160545_640.jpg/melon/resize/240/quality/80/optimize" width="240" height="135" alt="NONSTOP">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge o12"></span>
            <span>살짝 설렜어(Nonstop)</span>
          </a>
          <a href="" class="artist_title_text">
            <span>오마이걸</span>
          </a>     
        </div>
      </li>
      
      <li>
        <div class="thumbnail_item_area">
          <div class="album_thumbnail">
            <a href="" class="link_thumbnail" title="More&More">
              <img src="https://cdnimg.melon.co.kr/cm2/mv/images/wide/502/21/265/50221265_20200601143117_640.jpg/melon/resize/240/quality/80/optimize" width="200" height="200" alt="More&More">    
            </a>
            <button class="btn_thumbnail_play"></button>
          </div>
          <a href="" class="album_title_text">
            <span class="badge all"></span>
            <span>More & More</span>
          </a>
          <a href="" class="artist_title_text">
            <span>TWICE(트와이스)</span>
          </a>     
        </div>
      </li>
    </ul>
  </div>
</div> 


<div class="introduce_section">
  <strong class="title">
  지금 바로 로그인하고<br>
  한땀 한땀 만든 플레이리스트 듣기!
  </strong>
  <p class="text">
  다양한 가수들을 아우르는 건 기본.<br>
  다양한 장르의 노래를 트렌드에 맞게 업데이트.
  </p>
  <div class="img_playlists"></div>
</div>


 
 <!-- bottom -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
<script src="./css/jquery.min.js"></script>
<script src="./css/material-bootstrap.min.js"></script>
<script src="./js/plugins/swiper/js/swiper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
    $(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 10,
      loop:true,
      loopFillGroupWithBlank: true,
      // init: false,

      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      breakpoints: {
        640: {
          slidesPerView: 2,
          spaceBetween: 10,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 10,
        },
        1024: {
          slidesPerView: 5,
          spaceBetween:10,
        },
      }
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