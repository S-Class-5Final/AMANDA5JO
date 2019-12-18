<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- modal start -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- modal end -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style>
*{margin:0; padding:0;}
/* 메인 DIV */
.myUpdateMemberBody{width:900px; height:1800px; margin-top:50px; margin-left:600px; border:1px solid; font-size:15px;}
/* 각각의 lavel div 포함한 DIV  */
.myUpdateMemberDiv{width:100%; height:80px;line-height:20px; border:1px solid;  margin-top:15px; border-bottom:1px dotted #ccc;}
.myUpdateMemberDiv label{margin-left:50px; font-weight:bold; font-weight:bold;}
.myUpdateMemberDiv input{margin-left:50px;}
.myUpdateMemberDiv select{margin-left:50px;}


/*  .myHobbyCheck { display: none;}   /* input 체크박스 hidden */  */
..myHobbyDiv{border:1px solid;}  /* 각각의 체크박스 div */


.myUpdateMemberImg{
	width:170px; 
	height:180px; 
	margin-top:10px; 
	margin-left:100px;
	border:1px solid ;
	
}

/* 모달 checkbox div 클릭시 컬러  */
.myAddClassColor{color:black;}
.myRemoveClassColor{color:blue;}

</style>




</head>
<body>
<jsp:include page="../common/matchingMenu.jsp"/>
   <!-- 메인 DIV -->
<div id="myUpdateMainDiv">
	<form action="myupdate.do" id="myMemberUpdateForm" method="post" enctype="multipart/form-data">
   <div class="myUpdateMemberBody" >
      <label>이미지</label>
     <div id="myUpdateMemberImgDiv">
    
     <!-- 이미지 보여지는 div -->
 <!--  <div class="mysortable" style="background:red; height:400px;" >
    <img class="myUpdateMemberImg" id="mytitleImg" data-order=0; style="margin-top:100px;">
    <img  class="myUpdateMemberImg" id="mytitleImg1" data-order=1; style="margin-top:100px;">
    <img  class="myUpdateMemberImg" id="mytitleImg2" data-order=2; style="margin-top:100px;">
    </div>  -->
   

   <!-- 파일  -->
   <div id="myfileList">
   <div id="myFileListDiv1">
   <img class="myUpdateMemberImg" id="mytitleImg" data-order=0; style="margin-top:100px;" src="resources/userface/${mymImgList[0].renameFileName}">
   <input type="file" style="display:none" id="mythumbnailImg1" class="mythumbnailImg" multiple="multiple" name="mythumbnailImg" onchange="LoadImg(this,1)">
   <input type="hidden" name = "imgorginname" value="${mymImgList[0].originalFileName}">
   </div>
    <div id="myFileListDiv2">
     <img  class="myUpdateMemberImg" id="mytitleImg1" data-order=1; style="margin-top:100px;" src="resources/userface/${mymImgList[1].renameFileName}">
   <input type="file" style="display:none" id="mythumbnailImg2"  class="mythumbnailImg"  multiple="multiple" name="mythumbnailImg" onchange="LoadImg(this,2)">
   <input type="hidden" name = "imgorginname" value="${mymImgList[1].originalFileName}">
    </div>
    <div id="myFileListDiv3">
    <img  class="myUpdateMemberImg" id="mytitleImg2" data-order=2; style="margin-top:100px;" src="resources/userface/${mymImgList[2].renameFileName}">
   <input type="file" style="display:none" id="mythumbnailImg3"  class="mythumbnailImg"  multiple="multiple" name="mythumbnailImg" onchange="LoadImg(this,3)" >
   <input type="hidden" name = "imgorginname" value="${mymImgList[2].originalFileName}">
   </div>
  </div> 

   
   <!-- 이미지 삭제 버튼 -->
    <div id="myImagefileDelete">
    <button type="button" id="myUpdateMemberImgDelete">삭제합니다</button>
    <button type="button" id="myUpdateMemberImgDelete2">삭제합니다</button>
    <button type="button" id="myUpdateMemberImgDelete3">삭제합니다</button>
    </div>
  </div>

   
   <!-- 아이디 DIV  휴대폰DIV-->
   <div class="myUpdateMemberDiv" style="float:left; width:45%; " >
      <label>아이디 </label>
      <div id="myUpdateMemberId"><input type="email" id="myid" name="user_id" style="background:#ebebeb" value="${myMember.user_id }"></div>
  </div>
  
    <div class="myUpdateMemberDiv" >
      <label>핸드폰 번호</label>
       <c:forTokens var="myPhoneTokens" items="${myMember.phone }" delims="-" varStatus="status">
      
		<c:if test="${status.index eq 0 }">
      <div id="myUpdateMemberPhone">
      <input type="text" id="myPhone" name ="phone1" value="${myPhoneTokens}"> -
      </div>
      </c:if>
      
      <c:if test="${status.index eq 1 }">
      <div id="myUpdateMemberPhone">
	  <input type="text" name= "phone2" value="${myPhoneTokens}"> -
	  </div>
	  </c:if>
	  
	  <c:if test="${status.index eq 2 }">
	   <div id="myUpdateMemberPhone"> 
	  <input type="text" name = "phone3" value="${myPhoneTokens}"><br>
	  </div>
	  </c:if>
      </c:forTokens>
    </div>
  
   
   <!-- 비밀번호 DIV 비밀번호 확인 DIV -->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>비밀번호</label>
      
      <div id="myUpdateMemberPwd"><input type="password" name="user_pwd" id="mypw1"></div>
     </div>
     
 	   <div class="myUpdateMemberDiv"> 
      <label>비밀번호 확인</label>
      <div id="myUpdateMemberPwdCheck" ><input type="password" name="user_pwd2"  id="mypw2"></div>
      </div>
      
    
   
   
   <!-- 별명 DIV 키 DIV-->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">    
      <label >별명</label><br>
      <div id="myUpdateMemberNick" ><input type="text" id="mynick" name="user_nick" value="${myMember.user_nick }"></div>
      </div>
   <div class="myUpdateMemberDiv" > 
      <label >키</label><br>
      <div id="myUpdateMemberHeight" ><input type="text" id="myheight" name="height" value="${myMember.height }">cm</div>
   </div>
   
   <!-- 성별 DIV 동성매칭 여부 DIV -->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>성별</label>
      <div id="myUpdateMemberGender">
      <c:if test="${myMember.gender eq 'M' }">
         남 :<input type="radio" name = "gender" class = "mygender" value = "M" checked>&nbsp; 
	여 :<input type = "radio" name = "gender" class = "mygender" value="F"><br>
	</c:if>
	   <c:if test="${myMember.gender eq 'F' }">
         남 :<input type="radio" name = "gender" class = "mygender" value = "M" >&nbsp; 
	여 :<input type = "radio" name = "gender" class = "mygender" value="F" checked><br>
	</c:if>
      </div>
    </div>
    <div class="myUpdateMemberDiv">   
      <label>동성매칭여부</label>
      <div id="myUpdateMemberGay" >
      <c:if test="${myMember.gay eq 'Y' }">
     	 예 :<input type="radio" name = "gay" class = "mygay" value = "Y" checked>&nbsp; 
		아니오 :<input type = "radio" name = "gay" class = "mygay" value="N"><br>
	</c:if>	
	<c:if test="${myMember.gay eq 'N' }">
     	 예 :<input type="radio" name = "gay" class = "mygay" value = "Y" >&nbsp; 
		아니오 :<input type = "radio" name = "gay" class = "mygay" value="N" checked><br>
	</c:if>	  
	 </div>
   </div>
   
   
   <!-- 나이 DIV  주소 DIV-->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>나이</label>
      <div id="myUpdateMemberAge" ><input type="number" min="20" max="100" name="age" id="myage" value="${myMember.age }"></div>
   </div>
   <div class="myUpdateMemberDiv"> 
    <label>사는 곳</label>
    <div id="myUpdateMemberAddress"><input type="text" name="address" id = "myaddress" value="${myMember.address }"></div>
   </div>
   
   

   
   <!-- 한줄 소개 DIV -->
   <div class="myUpdateMemberDiv">   
      <label>한줄 소개</label>
      <div id="myUpdateMemberInto" ><input type="text" name="user_into" value="${myMember.user_into }"></div>
   </div>


	 <div class="myUpdateMemberDiv">   
      <label>취미</label>
      <div id="myUpdateMemberHobby" ><input type="text" id="myHobbyinput" ></div>
   </div>
   
 <div class="myHobbycontainer">
  <!-- Button to Open the Modal -->
  <button type="button" onclick="abc()" id="myHobbyListBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modalabc
  </button>
</div>

  <!-- The Modal -->
  <div class="modal myWindow" id="myModal">
    <div class="modal-dialog modal-dialog-scrollable mydialog">
      <div class="modal-content myMain">
      
        <!-- Modal Header -->
        <div class="modal-header myHeader">
          <h1 class="modal-title myTitle">Modal Heading</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body mybody">
        	<div id="myModalBody">
    
        		<div class="myHobbyDiv" style="display:inline-block" ><label class="${myHobby.movie == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">영화</label>
        			<input type="checkbox" id="myMovie" name="movie" class="myHobbyCheck"  value="Y" ${myHobby.movie == "Y" ? "CHECKED" : ""}>
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.sing == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">노래</label>
        		<input type="checkbox" id="mySing" name="sing" class="myHobbyCheck"  value="Y" ${myHobby.sing == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.game == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">게임</label>
        		<input type="checkbox" id="myGame" name="game" class="myHobbyCheck"  value="Y" ${myHobby.game == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.jmt == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">jMT</label>
        		<input type="checkbox" id="myJmt" name="jmt" class="myHobbyCheck" value="Y" ${myHobby.jmt == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.pet == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">애완동물</label>
        		<input type="checkbox" id="myPet" name="pet" class="myHobbyCheck" value="Y" ${myHobby.pet == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.cafe == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">카페</label>
        		<input type="checkbox" id="myCafe" name="cafe" class="myHobbyCheck" value="Y" ${myHobby.cafe == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.working == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">산책</label>
        		<input type="checkbox" id="myWorking" name="working" class="myHobbyCheck" value="Y" ${myHobby.working == "Y" ? "CHECKED" : "" }> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.poto == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">사진</label>
        		<input type="checkbox" id="myPoto" name="poto" class="myHobbyCheck" value="Y" ${myHobby.poto == "Y" ? "CHECKED" : "" }> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.travel == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">여행</label>
        		<input type="checkbox" id="myTravel" name="travel" class="myHobbyCheck" value="Y" ${myHobby.travel == "Y" ? "CHECKED" : "" }> 
        		</div>
        	</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer myFooter">
        <!-- data-dismiss="modal" close -->
       
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           <button type="button" id="myModalMemberUpdate" class="btn btn-primary" data-dismiss="modal">확인</button>
        </div>
        
      </div>
    </div>
  </div>
        
         <div id="myUpdateBtn">
        <!-- <button type="submit" onclick="myUpdateBtn();">수정하기</button> -->
        <button type="submit">수정하기</button>
        </div>
 
   </div>
</form>          
</div>


<!--  <script>
  $("#myfileList").sortable({
	axis: "x, y",
	update: function (event, ui) {
		var order = $(this).sortable('toArray', {
			attribute: '.myUpdateMemberImg'
		});
		console.log(order);
		console.log(".myUpdateMemberImg");
	}
});  

</script> -->



<script>
 	/* 모달창 안의 버튼 클릭시 이벤트 */
 	
 	/* function 일어나고 자동으로 $()가 클릭이벤트를 실행함 */
 	$(function(){
 		alert('${mymImgList[0].renameFileName}');
 		$("#myModalMemberUpdate").click();
 	});

 	
 	$(document).on('click','.myHobbyDiv', function(){
 		if($(this).children('input').attr('checked') == 'checked'){
 			$(this).children('input').attr('checked', false);
 			 $(this).children('label').removeClass('myRemoveClassColor'); 
 			$(this).children('label').addClass('myAddClassColor');
 		}else{
 			$(this).children('input').attr('checked', true);
 	 		$(this).children('label').removeClass('myAddClassColor'); 
 			$(this).children('label').addClass('myRemoveClassColor');
 		}
 	});

 	// input 태그는 val   label document형식의  html
 	// 모달창안의 데이터 값 출력
 	$(document).on("click","#myModalMemberUpdate", function(){
 		var labelArray=[];
 		$('label[class="myRemoveClassColor"]').each(function(){
 			labelArray.push($(this).html());
 		});
 		 var labelArrayTmp = labelArray.join(",");
 		  $("#myHobbyinput").val(labelArrayTmp);
 	});
 	
/*   $(document).on("click", "#myModalMemberUpdate", function(){
 var items=[];
   $('input[class="myHobbyCheck"]:checkbox:checked').each(function(){ 
 	items.push($(this).val());
  });
  var tmp = items.join(",");
  $("#myHobbyinput").val(tmp);
 });  */

</script>

<script>
		/* 사진 순서 바꾸는 코드 */
       $(function() {
             $("#myfileList").sortable();
          /*   ({
            change : function(e) {
        	  var files = e.target.files;
        	  var filesArr = Array.prototype.slice.call(files);
        	  var form = document.getElementsByClassName("myUpdateMemberImg")
			  var formData = new FormData(form);
        	  for(var i in)
           
           } */
            $("#myfileList").disableSelection(); // 상자 선택만 하도록 함 텍스트를 선택 취소 할 수있게하려는 경우 유용합니다.
         
      /*   });  */
             });  
		// id가 "sortable" 인 태그의 내부에 포함된 태그를 사용해서 드래그 가능한 리스트를 만듦 
			/* $("#myfileList").suffer(); */
         
/*         $(document).ready(function () {
            window.startPos = window.endPos = {};

            makeDraggable(); 

            $('.sortable').droppable({
              hoverClass: 'hoverClass',
              drop: function(event, ui) {
                var $from = $(ui.draggable),
                    $fromParent = $from.parent(),
                    $to = $(this).children(),
                    $toParent = $(this);

                window.endPos = $to.offset();

                swap($from, $from.offset(), window.endPos, 0);
                swap($to, window.endPos, window.startPos, 500, function() {
                  $toParent.html($from.css({position: 'relative', left: '0', top: '0', 'z-index': '0'}));
                  $fromParent.html($to.css({position: 'relative', left: '0', top: '0', 'z-index': '0'}));
                  makeDraggable();
                });
              }
            });

            function makeDraggable() {
              $('.sortable').draggable({
                zIndex: 99999,
                revert: 'invalid',
                start: function(event, ui) {
                  window.startPos = $(this).offset();
                }
              });
            }

            function swap($el, fromPos, toPos, duration, callback) {
              $el.css('position', 'absolute')
                .css(fromPos)
                .animate(toPos, duration, function() {
                  if (callback) callback();
                });
            }
          }); */
</script>


   <script>
   // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 부분
   /*      $(function(){
   $(".mythumbnailImg").hide();   */ 
                   
   $("#mytitleImg").click(function(){
   $("#mythumbnailImg1").click();
   });
   
   
   $("#mytitleImg1").click(function(){
      $("#mythumbnailImg2").click();
      });
   $("#mytitleImg2").click(function(){
      $("#mythumbnailImg3").click();
      });
   
/*    }); */
   // 이미지 업로드 
   function LoadImg(value,num){
                  if(value.files[0]!=undefined){   
                     // value는 함수를 발동시킨 객체(file타입 input태그)이고
                     // value.files[0]은 input태그로 파일을 선택 했으면 undefined가 아니고 선택 안했으면 undefined다.
                     var reader = new FileReader();
                     reader.onload = function(e){
                        switch(num){
                        case 1:
                           $("#mytitleImg").attr("src",e.target.result);
                           break;
                        case 2:
                        $("#mytitleImg1").attr("src",e.target.result);
                        break;
                        case 3:
                           $("#mytitleImg2").attr("src",e.target.result);
                           break;
                        }
                        }
                        reader.readAsDataURL(value.files[0]);
                  }
   }
   </script>

	<!-- 이미지 삭제 -->
	<script type="text/javascript">
	$(document).on('click', "#myUpdateMemberImgDelete", function(){
		$("#mytitleImg").attr("src","resources/images/test.png");
		$("#mythumbnailImg1").val("");
	});
	$(document).on('click', "#myUpdateMemberImgDelete2", function(){
		$("#mytitleImg1").attr("src","resources/images/test.png");
		$("#mythumbnailImg2").val("");
	});
	$(document).on('click', "#myUpdateMemberImgDelete3", function(){
		$("#mytitleImg2").attr("src","resources/images/test.png");
		$("#mythumbnailImg3").val("");
	});

	
	</script>


            <!-- 주소 api -->
            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
            <script>
               // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
               $(function(){
                   $("#postcodify_search_button_myBtn").postcodifyPopUp(); 
               });
            </script>
		
		<!-- 정보 정규식  -->	
		<!-- <script>
		  function myUpdateBtn(){
	          var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
	          var checkHeight = /^\d*[.]\d{1}$/; 
	          // 특수문자 여부
	          var checkPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;  
	          var bool = confirm("수정 하시겠습니까?"); // confirm yes/no 팝업창
	        
	      /*     if($("#mythumbnailImg1").val() == ""){
		            alert("최소 사진 1장을 등록하셔야합니다.");
		        
		            return false;
		         } */
	          
	         if($("#mypw1").val() == ""){
	            alert("비밀번호를 입력해주세요");
	            $("#mypw1").focus();
	            return false;
	         }
	         if($("#myid").val() == ($("#mypw1").val())) {
	        	 alert("비밀번호가 ID와 똑같습니다!");
	        	 $("#mypw1").val("");
	        	 $("#mypw1").focus();
	        	 return false
	         } 
	         
	         if(!checkPwd.test($("#mypw1").val())){
	        	 alert("비밀번호는 8자 이상이며, 숫자/영어를 포함해야합니다."); 
	        	 $("#mypw1").val("");
	        	 $("#mypw1").focus();
	        	 return false;
	         }
	         
	     	if(checkPattern.test($("#mypw1").val())) { 
         		 alert("특수문자가 포함되었습니다. 비밀번호를 다시 입력해주세요.");		         
         		 $("#mypw1").val("");
         		 $("#mypw1").focus();
          	 return false;
  	     	} 
	        
	     	 if(!checkPwd.test($("#mypw2").val())){
	        	 alert("비밀번호는 8자 이상이며, 숫자/영어를 포함해야합니다."); 
	        	 $("#mypw2").val("");
	        	 $("#mypw2").focus();
	        	 return false;
	         }
	     	
	         if($("#mypw1").val() != $("#mypw2").val()) {
	        	alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
	        	$("#mypw2").val("");
	        	$("#mypw2").focus();
	        	return false;
	         }
	         
	         
	         
	         if($("#mynick").val() == "") {
	        	 alert("별명을 입력해주세요");
	        	 $("#mynick").focus();
	        	 return false;
	         }
	     	if(checkPattern.test($("#mynick").val())) { 
        		 alert("특수문자가 포함되었습니다. 별명을 다시 입력해주세요.");		         
        		 $("#mynick").val("");
        		 $("#mynick").focus();
         	 return false;
 	     	} 
	         
	     	  if($("#myheight").val() == "") {
		        	 alert("키를 입력해주세요");
		        	 $("#myheight").focus();
		        	 return false;
		         }
	     	
	         if(checkHeight.test($("#myheight").val())){
	        	 alert("소수점을 제외하고 키를 입력해주세요");
	        	 $("#myheight").val("");
	        	 $("#myheight").focus("");
	        	 return false;
	         }
	          
	         
	         if($("#myage").val() == ""){
	            alert("나이 입력해주세요");
	            $("#myage").focus();
	            return false;
	         }
	        
	         if($("#detailAddress").val() == ""){
	            alert("상세주소를 입력해주세요");
	            $("#detailAddress").focus();
	            return false;
	         }
	     
			 }
		</script> -->

</body>
</html>