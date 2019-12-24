<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <script src='https://hammerjs.github.io/dist/hammer.min.js'></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <!--  <script  src="js/index.js"></script> -->
  <title>Tinder swipe cards</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<!--   <link rel="stylesheet" href="css/style.css"> -->
  <style>
        *, *:before, *:after {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
      }
      
      body {
       /*  background: #CCFBFE; */
        background: white;
        overflow: hidden;
        font-family: sans-serif;
      }
      
      .tinder {

        width: 100vw;
        height: 78vh;/* 카드랑 버튼 위치 */
        overflow: hidden;
        display: flex;
        flex-direction: column;
        position: relative;
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
      }
      
      .loaded.tinder {
        opacity: 1;
      }
      
      .tinder--status {
        position: absolute;
        top: 50%;
        margin-top: -30px;
        z-index: 2;
        width: 100%;
        text-align: center;
        pointer-events: none;
      }
      
      .tinder--status i {
        font-size: 100px;
        opacity: 0;
        -webkit-transform: scale(0.3);
                transform: scale(0.3);
        transition: all 0.2s ease-in-out;
        position: absolute;
        width: 100px;
        margin-left: -50px;
        
      }
      
      .tinder_love .fa-heart {
        opacity: 0.7;
        -webkit-transform: scale(1);
                transform: scale(1);
      }
      
      .tinder_nope .fa-remove {
        opacity: 0.7;
        -webkit-transform: scale(1);
                transform: scale(1);
      }
      
      .tinder--cards {
           /* margin-left: 215px; */
        flex-grow: 1;
        padding-top: 40px;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: flex-end;
        z-index: 1;
      }
      
       .tinder--card {
        display: inline-block;
        width: 90vw;
        max-width: 400px;
        height: 50vh;
        background: #FFFFFF;
        padding-bottom: 40px;
        border-radius: 8px;
        overflow: hidden;
        position: absolute;
        will-change: transform;
        transition: all 0.3s ease-in-out;
        cursor: -webkit-grab;
        cursor: grab;
      } 
      
      .moving.tinder--card {
        transition: none;
        cursor: -webkit-grabbing;
        cursor: grabbing;
      }
      
      .tinder--card img {
        max-width: 100%;
        height: 70%; /* 사진 길이 */
        pointer-events: none;
      }
      
      .tinder--card h3 {
        color: black;   
        margin-top: 10px;
        font-size: 32px;
        padding: 0 16px;
        pointer-events: none;
      }
      
      .tinder--card p {
        color: black;
        margin-top: 24px;
        font-size: 20px;
        padding: 0 16px;
        pointer-events: none;
      }
      
      .tinder--buttons {
                /* margin-left: 215px; */
      
        flex: 0 0 100px;
        text-align: center;
        padding-top: 20px;
      }
      
      .tinder--buttons button {
        border-radius: 50%;
        line-height: 60px;
        width: 60px;
        border: 0;
        background: #FFFFFF;
        display: inline-block;
        margin: 0 8px;
        cursor: pointer;
      }
      
      .tinder--buttons button:focus {
        outline: 0;
      }
      
      .tinder--buttons i {
        font-size: 32px;
        vertical-align: middle;
      }      
      .fa-heart {
        color: #FFACE4;
      }
      
      .fa-remove {
        color: #CDD6DD;
      }
      
      /* -----------------------------slider-------------------------------- */
      
      /* Slideshow container */
      .slideshow-container {
        max-width: 1000px;
        position: relative;
        margin: auto;
      }

      /* The dots/bullets/indicators */
      .dot {
        cursor: pointer;
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
      }
      
      .active, .dot:hover {
        background-color: #717171;
      }
      
      /* Next & previous buttons */
      .prev, .next {
        margin-left: -200px; /* 이거해줘야 pre버튼 보임. */
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: black;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
      }
      /* Position the "next button" to the right */
      .next {
        right: 0;
        border-radius: 3px 0 0 3px;
      }
      /* On hover, add a black background color with a little bit see-through */
      .prev:hover, .next:hover {
        background-color: rgba(0,0,0,0.8);
      }
      
       /* 분류 버튼들 */
      #selectGay{
         position: absolute; 
         top: 100px; 
         align-self: center;
      }
      
      #selectGay button{
         outline: none; /* 버튼 테두리에 파란거 없애기. */
         cursor: pointer;
         font-weight: 900;
         width: 80px;
         height: 35px;
         border: 2px solid #ff8282;
         background: white;
           border-radius:10px;
           font-size: 15px;
      }
      .gayBtn{
         color: #ff8282
      }
      
      #infoBtn{
         border: 0px;
         background: none;
         margin-left: 350px;
         z-index: 999;
         cursor: help;
         width:35px; 
         height: 35px;
         
      }
      
      /* 모달창 -----------------------------------------*/
      /* The Modal (background) */
      .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }
      
      /* Modal Content */
      .modal-content {
       width: 600px;
        height: 700px;
        margin-left: 43%;
      
        /* background: linear-gradient(135deg, rgba(85,239,203,1) 0%,rgba(30,87,153,1) 0%,rgba(85,239,203,1) 0%,rgba(91,202,255,1) 100%); */
        /* background: linear-gradient(135deg, rgba(85,239,203,1) 0%,rgba(449,87,153,1) 0%,rgba(561,239,203,1) 0%,rgba(463,202,255,1) 100%); */
        background: #ff6464;
        background-color: #fefefe;
        padding: 20px;
        border: 1px solid #888;
      }
      
      /* The Close Button */
      .closeModal {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }
      
      .closeModal:hover,
      .closeModal:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }
      .containerHobby {
            height: auto;
           width:auto;
         /* background:black; */

           display: flex;
          flex-wrap: wrap;
      }
       .HobbyButton:hover {
          cursor: pointer;
          border-radius: 30px;
        }
       
       .HobbyButton {
        flex: 1 1 auto;
        margin: 10px;
        padding: 20px;
        border: 2px solid #f7f7f7;
        text-align: center;
        text-transform: uppercase;
        position: relative;
        overflow:hidden;
        transition: .3s;
        }
        /* :after {
          position: absolute;
          transition: .3s;
          content: '';
          width: 0;
          left: 50%;
          bottom: 0;
          height: 3px;
          background: #f7f7f7; 
        }*/
        
/*      #Slides1{
    display: block;
    }
    #Slides2{
    display: none;
    }
    #Slides3{
    display: none;
    }  */
    .footerImg{
			margin-left: 70%;
			margin-top: -8%;
		}
  </style>
</head>
   <jsp:include page="matchingMenu.jsp"/>
<body>
   <!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPathe 변수값을 만들어주자. -->
   <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
   
   
<div id="main">
     <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; AMANDA</span>
     
     <div id="tinder-body" style="margin-left: 140px;">
      <div class="tinder">
           <div class="tinder--status">
             <i class="fa fa-remove"></i>
             <i class="fa fa-heart"></i>
           </div>
           
           <div id="selectGay" style="z-index: 100;">
                 <button class="gayBtn" id="gayBtn1" value="F">W</button>&nbsp;&nbsp;
                 <button class="gayBtn" id="gayBtn2" value="FY">&nbsp;W ♥ W&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <button class="gayBtn" id="gayBtn3" value="M">M</button>&nbsp;&nbsp;
                 <button class="gayBtn" id="gayBtn4" value="MY">&nbsp;M ♥ M&nbsp;</button>
           </div>

           <div class="tinder--cards"> 
           </div>  
      
           <div class="tinder--buttons">
             <button id="previous"><i class="fa fa-undo" style="color: yellowgreen;"></i></button>
             <button id="nope"><i class="fa fa-remove"></i></button>
             <button id="love"><i class="fa fa-heart"></i></button>
             <button id="superLike"><i class="fa fa-star" style="color: skyblue;"></i></button>
           </div>
      </div>
   </div>

         <!-- MODAL창 -->
          <div id="myModal" class="modal" style="z-index: 101">
           <div class="modal-content" style="background: #ff6464;">
              <span class="closeModal">&times;</span> 
             <h2 align="center" style="margin-top: -8px;margin-bottom: 10px;"></h2>
             <h2 align="center">PHOTOS</h2>
             <div class="user_infoView" style="width:auto; height:62%; background: white; color: black">
                
             </div>
             <p align="center" style="font-size:35px">TOP3</p>
                <div class="containerHobby">
                   <div class="HobbyButton">Rounded Corners1</div>
                   <div class="HobbyButton">Rounded Corners2</div>
                   <div class="HobbyButton">Rounded Corners3</div>
               </div>
           </div>
         </div> 
         
</div>

<script>

 var infoView;
   // ajax의 작업을 먼저 완료하고, 그다음에 다큐먼트들을 긁어온다음, 카드들을 생성해야되.

        // onload 이벤트보다 먼저 발생한다. 빠른 실행속도가 필요할때 적합하다.
       /*  window.addEventListener('DOMContentLoaded', function(){ 
           //makeAfterCard("");
          makeCard("");
           
        })
      window.onload = function() {
         makeCard("");
      } */
         makeCard("");
    // 자동실행 부분
    $(function(){
       
   //makeAfterCard("");
      var tinderContainer = document.querySelector('.tinder');
      var allCards = document.querySelectorAll('.tinder--card');
      var nope = document.getElementById('nope');
      var love = document.getElementById('love');
      
      /* 1. 카드시작 함수 */
      function initCards(card, index) {
        var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
      
        newCards.forEach(function (card, index) {
          card.style.zIndex = allCards.length - index;
          card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
          card.style.opacity = (10 - index) / 10;
        });
        tinderContainer.classList.add('loaded');
      }
      
      initCards();
      
      /* 모든 카드에게, 드래그 먹이는 작업. */
      allCards.forEach(function (el) {
        var hammertime = new Hammer(el);
      
        hammertime.on('pan', function (event) {
          el.classList.add('moving');
        });
      
        hammertime.on('pan', function (event) {
          if (event.deltaX === 0) return;
          if (event.center.x === 0 && event.center.y === 0) return;
      
          // event.delta(X,Y) : 지금까지 드래그한 거리값을 가져옴.
          // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(양수)일때 값을 love로 지정한다는거.
          // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(음수)일때 값을 nope로 지정한다는거.
          tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
          tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
      
          var xMulti = event.deltaX * 0.03;
          var yMulti = event.deltaY / 80;
          var rotate = xMulti * yMulti;
      
          event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
        });
      
        hammertime.on('panend', function (event) {
          el.classList.remove('moving');
          tinderContainer.classList.remove('tinder_love');   
          tinderContainer.classList.remove('tinder_nope');
      
          var moveOutWidth = document.body.clientWidth;
          var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
      
          event.target.classList.toggle('removed', !keep);
      
          if (keep) {
            event.target.style.transform = '';
          } else {
            var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
            var toX = event.deltaX > 0 ? endX : -endX;
            var endY = Math.abs(event.velocityY) * moveOutWidth;
            var toY = event.deltaY > 0 ? endY : -endY;
            var xMulti = event.deltaX * 0.03;
            var yMulti = event.deltaY / 80;
            var rotate = xMulti * yMulti;
      
            event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
            initCards();
          }
        });
      });
      
      function createButtonListener(love) {
        return function (event) {
          var cards = document.querySelectorAll('.tinder--card:not(.removed)');
          var moveOutWidth = document.body.clientWidth * 1.5;
      
          if (!cards.length) return false;
      
          var card = cards[0];
      
          card.classList.add('removed');
          
          var latest = $(".removed #tUser-email").last().val(); // 가장 최근 카드 선택자
          if (love) { // 좋아요 누를시 카드 움직임.
           alert(latest);
                card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
                
                $.ajax({
                    url:"mLike.do",
                     type:"get",
                     data: {u_mid: "${loginUser2.u_mid }",sender: "${loginUser2.user_id }", receiver: latest},
                     success: function(data) {
                        if(data == "success"){
                           alert("데이터 삽입 성공");
                        }
                     }
                });
                
          } else { // 취소 누를 시 카드 움직임
            alert("싫어요 하시겠습니까?");
            var latest2 = $(".removed #tUser-name").last().text(); // 가장 최근 카드 선택자
               card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
               $.ajax({
                    url:"mHate.do",
                     type:"get",
                     data: {sender: "${loginUser2.user_nick }",
                            receiver: latest2,
                            userNo: "${loginUser2.u_mid }" },
                     success: function(data) {
                        if(data == "success"){
                           alert("데이터 삽입 성공");
                        }
                     }
                });  
          }
          
          initCards();
      
          event.preventDefault();
        };
      }
      
      var nopeListener = createButtonListener(false);
      var loveListener = createButtonListener(true);
      
      nope.addEventListener('click', nopeListener);
      love.addEventListener('click', loveListener);
    });



    // ajax 카드만들기 함수.
      var indexsize = null;
    var chatIndex = 0;
    function makeCard(parameter) {
       $.ajax({
          url:"mList.do",
          type:"get",
          data: {
                    loginUser: "${loginUser2.user_nick }",
                    genderSelect: parameter
                },
          async: false,
          contentType:"application/json;charset=utf-8",
          success: function(testlist) {
             $(".tinder--cards").html(""); // 앞의 카드 비워주기.
          //   alert(testlist[0].memberlist[user_id]);
              chatConnList = testlist;      
             $.each(testlist, function(index, value) {
                var str = 
                           "<div id = card"+(index)+" class=tinder--card >"+
                           "      <div class=mySlides" +index+" id='Slides1' style='pointer-events: none;'>"+
                           "         <img src =${contextPath }/resources/userface/" + testlist[index].imglist[0].renameFileName + " style='width: 400px; height: 300px;'>"+
                           "      </div>"+
                           "      <div class=mySlides"+index+ " id='Slides2' style='pointer-events: none;'>"+
                           "         <img src =${contextPath }/resources/userface/" + testlist[index].imglist[1].renameFileName + " style='width: 400px; height: 300px;'>"+
                           "      </div>"+
                           "      <div class=mySlides"+index+" id='Slides3' style='pointer-events: none ;'>"+
                           "         <img src =${contextPath }/resources/userface/" + testlist[index].imglist[2].renameFileName + " style='width: 400px; height: 300px;'>"+
                           "      </div>"+
                           "      <a class=prev onclick=plusSlides(-1,"+index+")>&#10094;</a>"+
                           "      <a class=next onclick=plusSlides(1,"+index+")>&#10095;</a>"+
                           "      <div style=text-align:center style='pointer-events: none;'>"+
                           "          <span class=dot onclick=currentSlide(1,"+index+")></span>"+
                           "          <span class=dot onclick=currentSlide(2,"+index+")></span>"+
                           "          <span class=dot onclick=currentSlide(3,"+index+")></span>"+
                           "      </div>"+
                           "      <h3 id=tUser-name>"+testlist[index].memberlist.user_nick +"</h3>"+
                           "      <p id=tUser-summary>"+testlist[index].memberlist.user_into +"</p>"+
                           "      <input type='hidden' id= tUser-email value =" + testlist[index].memberlist.user_id + ">"+
                           "      <input type='hidden' value =" + testlist[index].memberlist.u_mid + ">"+
                           "      <br>"+
                           "</div>";
                       $(".tinder--cards").append(str);
                    $(".mySlides"+(index)).eq(0).css("display","block");
                       $(".mySlides"+(index)).eq(1).css("display","none");
                       $(".mySlides"+(index)).eq(2).css("display","none");	
               });
           
            console.log(chatConnList);

          },
          error:function(){
         		alert("일치하는 맴버가 없습니다.");
          }
       });

    }
    
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("infoBtn");
    var span = document.getElementsByClassName("closeModal")[0];

       
</script>
       
<script>

    function infoBtnn(a) {
      modal.style.display = "block";
      console.log(a);
      
    }
    
    span.onclick = function() {
      modal.style.display = "none";
    }
    
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    } 
</script>

    <!-- selectGay 버튼  -->
    <script>
       $("#gayBtn1").click(function() {
         $(this).css('background','#ff8282').css('color','white');
         $("#gayBtn2").css('background','white').css('color','#ff8282');
         $("#gayBtn3").css('background','white').css('color','#ff8282');
         $("#gayBtn4").css('background','white').css('color','#ff8282');
          btn1 = $(this).val();
         alert("변수에담자" + btn1); 
         makeCard(btn1);
          
         
         
          var tinderContainer = document.querySelector('.tinder');
            var allCards = document.querySelectorAll('.tinder--card');
            var nope = document.getElementById('nope');
            var love = document.getElementById('love');
            
            /* 1. 카드시작 함수 */
            function initCards(card, index) {
              var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
            
              newCards.forEach(function (card, index) {
                card.style.zIndex = allCards.length - index;
                card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
                card.style.opacity = (10 - index) / 10;
              });
              
              tinderContainer.classList.add('loaded');
            }
            
            initCards();
            
            /* 모든 카드에게, 드래그 먹이는 작업. */
            allCards.forEach(function (el) {
              var hammertime = new Hammer(el);
            
              hammertime.on('pan', function (event) {
                el.classList.add('moving');
              });
            
              hammertime.on('pan', function (event) {
                if (event.deltaX === 0) return;
                if (event.center.x === 0 && event.center.y === 0) return;
            
                // event.delta(X,Y) : 지금까지 드래그한 거리값을 가져옴.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(양수)일때 값을 love로 지정한다는거.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(음수)일때 값을 nope로 지정한다는거.
                tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
                tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
            
                var xMulti = event.deltaX * 0.03;
                var yMulti = event.deltaY / 80;
                var rotate = xMulti * yMulti;
            
                event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
              });
            
              hammertime.on('panend', function (event) {
                el.classList.remove('moving');
                tinderContainer.classList.remove('tinder_love');   
                tinderContainer.classList.remove('tinder_nope');
            
                var moveOutWidth = document.body.clientWidth;
                var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
            
                event.target.classList.toggle('removed', !keep);
            
                if (keep) {
                  event.target.style.transform = '';
                } else {
                  var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
                  var toX = event.deltaX > 0 ? endX : -endX;
                  var endY = Math.abs(event.velocityY) * moveOutWidth;
                  var toY = event.deltaY > 0 ? endY : -endY;
                  var xMulti = event.deltaX * 0.03;
                  var yMulti = event.deltaY / 80;
                  var rotate = xMulti * yMulti;
            
                  event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                  initCards();
                }
              });
            });
            
            /* ----------- */
            showSlides();
           /* ----------- */
            
      });
      $("#gayBtn2").click(function() {
         $(this).css('background','#ff8282').css('color','white');
         $("#gayBtn1").css('background','white').css('color','#ff8282');
         $("#gayBtn3").css('background','white').css('color','#ff8282');
         $("#gayBtn4").css('background','white').css('color','#ff8282');
         btn1 = $(this).val();
         alert("변수에담자" + btn1); 
         makeCard(btn1);
         
          var tinderContainer = document.querySelector('.tinder');
            var allCards = document.querySelectorAll('.tinder--card');
            var nope = document.getElementById('nope');
            var love = document.getElementById('love');
            
            /* 1. 카드시작 함수 */
            function initCards(card, index) {
              var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
            
              newCards.forEach(function (card, index) {
                card.style.zIndex = allCards.length - index;
                card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
                card.style.opacity = (10 - index) / 10;
              });
              
              tinderContainer.classList.add('loaded');
            }
            
            initCards();
            
            /* 모든 카드에게, 드래그 먹이는 작업. */
            allCards.forEach(function (el) {
              var hammertime = new Hammer(el);
            
              hammertime.on('pan', function (event) {
                el.classList.add('moving');
              });
            
              hammertime.on('pan', function (event) {
                if (event.deltaX === 0) return;
                if (event.center.x === 0 && event.center.y === 0) return;
            
                // event.delta(X,Y) : 지금까지 드래그한 거리값을 가져옴.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(양수)일때 값을 love로 지정한다는거.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(음수)일때 값을 nope로 지정한다는거.
                tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
                tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
            
                var xMulti = event.deltaX * 0.03;
                var yMulti = event.deltaY / 80;
                var rotate = xMulti * yMulti;
            
                event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
              });
            
              hammertime.on('panend', function (event) {
                el.classList.remove('moving');
                tinderContainer.classList.remove('tinder_love');   
                tinderContainer.classList.remove('tinder_nope');
            
                var moveOutWidth = document.body.clientWidth;
                var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
            
                event.target.classList.toggle('removed', !keep);
            
                if (keep) {
                  event.target.style.transform = '';
                } else {
                  var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
                  var toX = event.deltaX > 0 ? endX : -endX;
                  var endY = Math.abs(event.velocityY) * moveOutWidth;
                  var toY = event.deltaY > 0 ? endY : -endY;
                  var xMulti = event.deltaX * 0.03;
                  var yMulti = event.deltaY / 80;
                  var rotate = xMulti * yMulti;
            
                  event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                  initCards();
                }
              });
            });
         
            /* ----------- */
            showSlides();
           /* ----------- */
            
      });
      $("#gayBtn3").click(function() {
         $(this).css('background','#ff8282').css('color','white');
         $("#gayBtn1").css('background','white').css('color','#ff8282');
         $("#gayBtn2").css('background','white').css('color','#ff8282');
         $("#gayBtn4").css('background','white').css('color','#ff8282');
         btn1 = $(this).val();
         alert("변수에담자" + btn1); 
         makeCard(btn1);
         
          var tinderContainer = document.querySelector('.tinder');
            var allCards = document.querySelectorAll('.tinder--card');
            var nope = document.getElementById('nope');
            var love = document.getElementById('love');
            
            /* 1. 카드시작 함수 */
            function initCards(card, index) {
              var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
            
              newCards.forEach(function (card, index) {
                card.style.zIndex = allCards.length - index;
                card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
                card.style.opacity = (10 - index) / 10;
              });
              
              tinderContainer.classList.add('loaded');
            }
            
            initCards();
            
            /* 모든 카드에게, 드래그 먹이는 작업. */
            allCards.forEach(function (el) {
              var hammertime = new Hammer(el);
            
              hammertime.on('pan', function (event) {
                el.classList.add('moving');
              });
            
              hammertime.on('pan', function (event) {
                if (event.deltaX === 0) return;
                if (event.center.x === 0 && event.center.y === 0) return;
            
                // event.delta(X,Y) : 지금까지 드래그한 거리값을 가져옴.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(양수)일때 값을 love로 지정한다는거.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(음수)일때 값을 nope로 지정한다는거.
                tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
                tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
            
                var xMulti = event.deltaX * 0.03;
                var yMulti = event.deltaY / 80;
                var rotate = xMulti * yMulti;
            
                event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
              });
            
              hammertime.on('panend', function (event) {
                el.classList.remove('moving');
                tinderContainer.classList.remove('tinder_love');   
                tinderContainer.classList.remove('tinder_nope');
            
                var moveOutWidth = document.body.clientWidth;
                var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
            
                event.target.classList.toggle('removed', !keep);
            
                if (keep) {
                  event.target.style.transform = '';
                } else {
                  var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
                  var toX = event.deltaX > 0 ? endX : -endX;
                  var endY = Math.abs(event.velocityY) * moveOutWidth;
                  var toY = event.deltaY > 0 ? endY : -endY;
                  var xMulti = event.deltaX * 0.03;
                  var yMulti = event.deltaY / 80;
                  var rotate = xMulti * yMulti;
            
                  event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                  initCards();
                }
              });
            });
         
            /* ----------- */
            showSlides();
            /* ----------- */
      
      });
      $("#gayBtn4").click(function() {
         $(this).css('background','#ff8282').css('color','white');
         $("#gayBtn1").css('background','white').css('color','#ff8282');
         $("#gayBtn2").css('background','white').css('color','#ff8282');
         $("#gayBtn3").css('background','white').css('color','#ff8282');
         btn1 = $(this).val();
         alert("변수에담자" + btn1); 
         makeCard(btn1);
      
          var tinderContainer = document.querySelector('.tinder');
            var allCards = document.querySelectorAll('.tinder--card');
            var nope = document.getElementById('nope');
            var love = document.getElementById('love');
            
            /* 1. 카드시작 함수 */
            function initCards(card, index) {
              var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
            
              newCards.forEach(function (card, index) {
                card.style.zIndex = allCards.length - index;
                card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
                card.style.opacity = (10 - index) / 10;
              });
              
              tinderContainer.classList.add('loaded');
            }
            
            initCards();
            
            /* 모든 카드에게, 드래그 먹이는 작업. */
            allCards.forEach(function (el) {
              var hammertime = new Hammer(el);
            
              hammertime.on('pan', function (event) {
                el.classList.add('moving');
              });
            
              hammertime.on('pan', function (event) {
                if (event.deltaX === 0) return;
                if (event.center.x === 0 && event.center.y === 0) return;
            
                
                // event.delta(X,Y) : 지금까지 드래그한 거리값을 가져옴.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(양수)일때 값을 love로 지정한다는거.
                // event.deltaX > 0 : x축방향 즉, 0을기준으로 오른쪽(음수)일때 값을 nope로 지정한다는거.
                tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
                tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);
            
                var xMulti = event.deltaX * 0.03;
                var yMulti = event.deltaY / 80;
                var rotate = xMulti * yMulti;
            
                event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
              });
            
              hammertime.on('panend', function (event) {
                el.classList.remove('moving');
                tinderContainer.classList.remove('tinder_love');   
                tinderContainer.classList.remove('tinder_nope');
            
                var moveOutWidth = document.body.clientWidth;
                var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;
            
                event.target.classList.toggle('removed', !keep);
            
                if (keep) {
                  event.target.style.transform = '';
                } else {
                  var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
                  var toX = event.deltaX > 0 ? endX : -endX;
                  var endY = Math.abs(event.velocityY) * moveOutWidth;
                  var toY = event.deltaY > 0 ? endY : -endY;
                  var xMulti = event.deltaX * 0.03;
                  var yMulti = event.deltaY / 80;
                  var rotate = xMulti * yMulti;
            
                  event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                  initCards();
                }
              });
            });
            
         /* ----------- */
         showSlides();
         /* ----------- */
      });
    </script>
     
    <!-- previous 버튼 누를 시. -->
    <script>
       $("#previous").on('click', function() {
           var test = $(".removed").last();
         test.removeClass('removed');
           test.css('transform','translate(0px, 0px) rotate(0deg)').css('z-index','800');
      });
    </script>
    
    <!-- superLike 버튼 누를 시 -->
    <script>
    var chatConnList;
       $("#superLike").on('click', function() {
    	 var chatIndex = $(".tinder--card.removed").length+1;
    	 
    	 var chatConnIndex = $(".tinder--card:nth-child("+chatIndex+")").children("input").last().val();
    	 console.log("hhh"+chatConnIndex);
         
         if(chatConnIndex > 0){
	         newWindow("${loginUser.u_mid}", chatConnIndex);	      
         }
      
      });
       
    </script>
     
    <!-- 이미지 슬라이드 관련 --> 
    <script>
        // 1. 슬라이드가 1(처음)일 때,,,
      var slideIndex = 1;

      // 2. 다음 슬라이드로 넘어갈 때,,, 
       function plusSlides(n,e) {
        showSlides(slideIndex += n,e);
      } 
      // 3. 현재 슬라이드 보고 있을 때,,,
      function currentSlide(n,e) {
        showSlides(slideIndex = n,e);
      }
      
      // 위의 1,2,3 에서 매개변수 갖고와서 돌자.
      // 슬라이드 보여주는 함수
      function showSlides(n,e) {
          var i;
          var s = $(".mySlides"+e);
          console.log(s[0]);
          console.log(s[1]);
          console.log(s[2]);
          console.log("현재 index:" +e + s.eq(0));
          console.log("현재 index:" +e + s.eq(1));
          console.log("현재 index:" +e + s.eq(2));
          console.log("현재 n값 : " + n);
       if(n == 0){
   		   console.log(n);
   		s.eq(0).css("display","none");
   		s.eq(1).css("display","none");
   		s.eq(2).css("display","block");
   		   slideIndex = 3;
   	   }
   	   if(n == 4){
   		   console.log(n);
   		s.eq(0).css("display","block");
   		s.eq(1).css("display","none");
   		s.eq(2).css("display","none");
   		   slideIndex = 1;
   	   }
   	   if(n == 1){
   		   console.log(n);
   		s.eq(0).css("display","block");
   		s.eq(1).css("display","none");
   		s.eq(2).css("display","none");	
      	   }
   	   if(n == 2){
   		   console.log(n);
   		s.eq(0).css("display","none");
   		s.eq(1).css("display","block");
   		s.eq(2).css("display","none");
      	   }
   	   if(n == 3){
   		   console.log(n);
   		s.eq(0).css("display","none");
   		s.eq(1).css("display","none");
   		s.eq(2).css("display","block");
  			
   	   }   

	}

   </script>
     <div class="footerImg">
		<img src="resources/images/al.gif">
	</div>
     
</body>
   <%-- <jsp:include page="matchingFooter.jsp"/> --%>
</html>