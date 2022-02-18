<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!-- 모바일 대응을 위한 뷰포트 기본 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />


<title>댕댕 게시판</title>
<link rel="stylesheet" href="/resources/css/Dang_main.css?after"
   type="text/css" />

<style>

@font-face {
    font-family: 'HSYuji-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

b:not(#footers b){
       font-family: 'HSYuji-Regular';
       font-size: 90px;
}

main {
   display: flex;
}   

section {
   display: flex;
}

section div {
   width: 500px;
   height: 800px;
   display: flex;
}

/* Scroll Animation (sa, 스크롤 애니메이션) */
.sa {
   opacity: 0;
   transition: all .5s ease;
}

/* 아래에서 위로 페이드 인 */
.sa-up {
   transform: translate(0, 100px);
}
/* 위에서 아래로 페이드 인 */
.sa-down {
   transform: translate(0, -100px);
}
/* 왼쪽에서 오른쪽으로 페이드 인 */
.sa-right {
   transform: translate(-100px, 0);
}
/* 오른쪽에서 왼쪽으로 페이드 인 */
.sa-left {
   transform: translate(100px, 0);
}

.sa.show {
   opacity: 1;
   transform: none;
}

table {
   width: 100%;
   table-layout: fixed;
   font-size: 30px;
   text-align:center;
}

td{
   color: #d4a373;
   text-align:center;
}

td img{
   max-width: 100%;
}

tr{
   margin:auto;
}


</style>
















<script src="//code.jquery.com/jquery-1.11.0.min.js">
</script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#headers").load("/resources/header.html"); //헤더 인클루드
      $("#footers").load("/resources/footer.html"); //푸터부분 인클루드
   });
   
   </script>


</head>
<body>

   <div id="headers"></div>
   <% int num = (int)(Math.random()*5+1);%>
   <video muted autoplay loop>
      <source src="/resources/imgs/dog<%=num%>.mp4" type="video/mp4">
   </video>
   <div class="jb-text">
      <h1 style="text-shadow: 0 0 6px grey">For your lovely pet</h1>
      <h3 style="text-shadow: 0 0 6px grey">당신의 사랑스런 친구를 위해.</h3>

   </div>



   <br>
   <br>
   <br>

      <table>
         <tr class="sa sa-up">
            <td>
            <img src="/resources/imgs/pngwing.com (22).png"
               ></td>
            <td><b>어제 샀던 간식이 얼마였더라? </b><br><br>댕댕 다이어리는 반려동물을 위한 맞춤 솔루션 가계부입니다!<br>우리 아이의
               식비, 예방접종, 유치원 방문 기록까지 <br>데이터를 통해 한눈에 볼 수 있어요.</td>
         </tr>
         <tr class="sa sa-down">
            <td><b>깔끔한 통계</b><br><br>지출패턴을 스마트하게 필터링할 수 있으며 <br>기간별로 깔끔한 통계를 제공합니다.
               <br><br>내가 어디에 많이 소비했는지, 얼마나 사용했는지에 대한 통계를 <br>차트로 한눈에 확인해 볼 수 있습니다!</td>
            <td ><img src="/resources/imgs/pngwing.com (35).png"></td>
         </tr>
         <tr class="sa sa-down">
            <td ><img src="/resources/imgs/cal2.jpg" width=755; height=424;></td>
            <td><img src="/resources/imgs/back2.PNG"></td>
         </tr>
         <tr class="sa sa-right">
            <td><img src="/resources/imgs/pngwing.com (31).png"></td>
            <td><b>입력이 쉬워요!</b><br><br>지출을 입력하면 자동으로 어느 항목의 지출이 많은지 <br>가계 지출 관리 및 변동을 간단히
               파악할 수 있습니다.<br><br>심플하고 직관적인 아이콘으로 <br>소비 패턴을 한 눈에 확인할 수 있는 것이 가장 큰 장점입니다.</td>
         </tr>
         </table>
         <br><br>
   <div class="container">
         <table>
         <tr class="sa sa-left">
            <td><h1>귀여운 우리 아이를 위해, <br>댕댕 다이어리로 스마트한 집사가 되어보세요!</h1></td>
         </tr>
         <tr class="sa sa-left">
         
            <td><img src="/resources/imgs/pngwing.com (29).png"></td>
         </tr>

      </table>


      <div class="section2">
         <div class="infinity-slide">
            <div id="slide">
               <img src="/resources/imgs/1.PNG"
                  onclick='window.open("http://prod.danawa.com/info/?pcode=11334894");'>
               <img src="/resources/imgs/2.PNG"
                  onclick='window.open("http://prod.danawa.com/info/?pcode=11334894");'>
               <img src="/resources/imgs/3.PNG"
                  onclick='window.open("https://www.11st.co.kr/products/2493461985?gclid=EAIaIQobChMIv6P56ZWE9gIVilVgCh3yXwvfEAYYASABEgLhKfD_BwE&utm_term=&utm_campaign=%B1%B8%B1%DB%BC%EE%C7%CEPC+%C3%DF%B0%A1%C0%DB%BE%F7&utm_source=%B1%B8%B1%DB_PC_S_%BC%EE%C7%CE&utm_medium=%B0%CB%BB%F6");'>
               <img src="/resources/imgs/4.PNG"
                  onclick='window.open("https://www.gegomall.com/goods/goods_view.php?goodsNo=9000&inflow=naver&gclid=EAIaIQobChMI8dKv95WE9gIVMdWWCh3dNgEsEAYYASABEgKZGfD_BwE");'>
               <img src="/resources/imgs/6.PNG"
                  onclick='window.open("https://www.terracanis.com/en-uk/dry-food-chicken-1554.html");'>
               <img src="/resources/imgs/7.PNG"
                  onclick='window.open("https://www.gegomall.com/goods/goods_view.php?goodsNo=8223&inflow=naver&gclid=EAIaIQobChMI6b7ynJaE9gIVBq2WCh0Wlwk5EAQYBCABEgKwsvD_BwE");'>
               <img src="/resources/imgs/8.PNG"
                  onclick='window.open("https://www.gegomall.com/goods/goods_view.php?goodsNo=8729&inflow=naver&gclid=EAIaIQobChMIs7bjp5aE9gIVTrGWCh1MKgJgEAQYASABEgKpS_D_BwE");'>
               <img src="/resources/imgs/9.PNG"
                  onclick='window.open("https://m.biteme.co.kr/goods/goods_view.php?goodsNo=1000011356");'>
               <img src="/resources/imgs/10.PNG"
                  onclick='window.open("https://shopping.interpark.com/product/productInfo.do?prdNo=6811234125&goods_no=6811234125&gclid=EAIaIQobChMIxLrW7JaE9gIVEXkqCh3cuAGGEAQYAiABEgLhpvD_BwE");'>
               <img src="/resources/imgs/11.PNG" onclick='window.open("");'>
               <img src="/resources/imgs/12.PNG" onclick='window.open("");'>
            </div>
         </div>
      </div>
      <!-- 슬라이드쇼 끝 -->

      <div id="footers"></div>

   </div>
</body>

<script type="text/javascript">

   

   // Scroll Animation (sa, 스크롤 애니메이션)
      const saDefaultMargin = 300;
      let saTriggerMargin = 0;
      let saTriggerHeight = 0;
      const saElementList = document.querySelectorAll('.sa');

      const saFunc = function() {
        for (const element of saElementList) {
          if (!element.classList.contains('show')) {
            if (element.dataset.saMargin) {
              saTriggerMargin = parseInt(element.dataset.saMargin);
            } else {
              saTriggerMargin = saDefaultMargin;
            }

            if (element.dataset.saTrigger) {
              saTriggerHeight = document.querySelector(element.dataset.saTrigger).getBoundingClientRect().top + saTriggerMargin;
            } else {
              saTriggerHeight = element.getBoundingClientRect().top + saTriggerMargin;
            }

            if (window.innerHeight > saTriggerHeight) {
              element.classList.add('show');
            }
          }
        }
      }

      window.addEventListener('load', saFunc);
      window.addEventListener('scroll', saFunc);


   
</script>
<script>history.scrollRestoration = "manual"</script>
<a style="display:scroll;position:fixed;bottom:0px;right:10px; " href="#" title=”맨위로"><img src="/resources/imgs/top.PNG" style="border-radius: 70%;"></a>

</html>