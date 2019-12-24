<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 130px;
            top: -100px;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
}
    
        /* Modal Content/Box */
        .modal-content{
            background-color: #fefefe;
		    margin: 15% auto;
		    margin-top: 10%;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 20%;                      

        }
        
        
.myChatTable{
       border: 1px solid #E0F2FE;
	border-radius: 5px;
	
	
	
}        

.myChatTable tr{
border-bottom :1px solid #E0F2FE;
}

#myChatThead th{
text-align: center;
}
#mytd{
line-height:25px;
}

#myChatAll{
	width: 860px; 
	height: 500px; 
	margin-left:37%; 
	border: 1px solid #e8e8e8; 
	border-radius: 10px; 
	overflow: auto;
	margin-top: 5%;
}

#myBtn {
position:relative;
width:90px;
height:35px;
font-size:15px;
border-radius: 10px;
	color:#fff;
	background-color:#3e87ec;
}


		.bigPictureWrapper {
			position: absolute;
			display: none;
			justify-content: center;
			align-items: center;
			top:0%;
			width:100%;
			height:100%;
			background-color: gray; 
			z-index: 100;
			background:rgba(255,255,255,0.5);
		}
		.bigPicture {
			position: relative;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		
		.bigPicture img {
			width:600px;
		}

/* 신고하기 이모티콘 */
.myRadioImg {
   width: 200px;
    height: 200px;
    padding: 3px;
    border-radius: 25% 25% 25% 25%;
}
.myRadioImg.chatPhoto{
   background-color: cornflowerblue;
}
.myRadioImg.chatRobot{
   background-color: limegreen;
}
.myRadioImg.chatbadM{
   background-color: orangered;
}
.myRadioImg.chatOther{
   background-color: darkgray;
}

.myAddClassColor{color:black;}
.myRemoveClassColor{border-color: rgb(255, 0, 125);
    color: rgb(255, 0, 125);}
.reModal_footer{
	text-align: center;
    margin-top: 1em;
	
}
.reModal_footer button{
	font-size: 18px;
    border-radius: 15% 15% 15% 15%;
    border: 0.5px solid lightgray;
    background-color: #fbfb2d;
    margin-left: 0.5em;
    margin-right: 0.5em;
    width: 4.5em;
    height: auto;
}

.reModal_footer button:hover,
.reModal_footer button:focus {
            text-decoration: none;
		    cursor: pointer;
		    opacity: 0.6;
        }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/matchingMenu.jsp"/>
	<br>
	
<div id="myChatAll">
<h1 align="center">채팅 내역</h1>
	<div id="myChatDiv">
	<table align="center" class="myChatTable" cellspacing="0" width="800" >
	<thead id="myChatThead">
		<tr>
			<th width="100" >채팅방 이름</th>
			<th width='100' >상대 아이디</th>
			<th width='100'>상대 별명</th>
			<th width='70' >신고하기</th>
			
		</tr>
	</thead>
	<tbody id="mytd" align="center">
	 	<c:forEach var="my" items="${list }" varStatus="status">
			<tr id="reIndex${status.count }">
				<td>${my.chatroom }</td>
				<td class='myuser_id2'>${my.user_id2}</td>
					<td >${my.username2 }</td>
					<td><button id="myBtn" onclick="reportModal('${my.user_id2}', '${my.chatid }', '${status.count }')">신고</button></td>
			</tr>
		 </c:forEach>
	
		
	<%--  	<c:forEach var="my" items="${list }" varStatus="status">
			<tr>
				<td>${my.chatroom }</td>
				<c:if test="${loginUser.user_nick eq my.username }">
					<td class='myuser_id2'>${my.user_id2}</td>
					<td >${my.username2 }</td>
					<td><button id="myBtn" onclick="reportModal('${my.user_id2}', '${my.chatid }', '${status.index }')">신고</button></td>
				</c:if>
				<c:if test="${loginUser.user_nick eq my.username2 }">
					<td class='myuser_id2'>${my.user_id}</td>
					<td >${my.username }</td>
					<td><button id="myBtn" onclick="reportModal('${my.user_id}', '${my.chatid }', '${status.index }')">신고</button></td>
				</c:if>
			</tr>
		 </c:forEach> --%>
	</tbody>
	</table>
</div>
	</div>
	
		<!-- 페이징 부분 -->
<%-- 		<tfoot id="mytft">	
 			<tr align="center" height="20">
 				<td colspan="6">
	 				<!-- [이전] -->
	 				
	 					<a href="#" onclick="paginAjax('${pi.startPage}');">[이전]</a>
	 				
	 				<!-- [번호들] -->
	 				<c:forEach var="myp" begin="${pi.startPage }" end="${pi.endPage }">
	 					<c:if test="${myp eq pi.currentPage }">
	 					<a href="#" onclick="paginAjax('${pi.currentPage}');"><font size="4">[${myp}]</font></a>
	 						
	 					</c:if>
	 					
	 					<c:if test="${myp ne pi.currentPage }">
	 						<a href="#" onclick="paginAjax('${myp}');"><font size="4">[${myp}]</font></a>
	 					</c:if>
	 				</c:forEach>
	 				
	 				<!-- [다음] -->
	 				<c:if test="${pi.currentPage == pi.maxPage }">
	 				<a href="#" onclick="paginAjax('${pi.currentPage}');">&nbsp;[다음]</a>
	 				
	
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage < pi.maxPage }">
	 					<a href="#" onclick="paginAjax('${pi.endPage}');">&nbsp;[다음]</a>
	 				</c:if>
 				</td>
 			</tr>
 		</tfoot>  --%>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <p align="center" style="font-size:25px" >신고하기</p><br>
      <div class="modal-content">
      <br>
                                                                    
          <input type="hidden" id="myReportId" name="myReportId">
          <input type="hidden" id="myChatId" name="myChatId">
          <input type="hidden" id="myReportTr">
          <div class="myRadioClass">
          <img src="resources/images/chatPhoto.png" id="myRadioClick1" class="myRadioImg chatPhoto" style="width:50px; height:50px;">
          <input type="radio" id="myReportradio1" class="myReportRadioList"  name="Report" value="1"><label>부적절한 사진</label><br><br><br>
          </div>
          <div class="myRadioClass">
          <img src="resources/images/chatRobot.png" id="myRadioClick2" class="myRadioImg chatRobot" style="width:50px; height:50px;">
          <input type="radio" id="myReportradio2" class="myReportRadioList" name="Report" value="2"><label>스팸으로 의심됨</label> <br><br><br>
          </div>
          <div class="myRadioClass">
          <img src="resources/images/chatbadM.png" id="myRadioClick3" class="myRadioImg chatbadM" style="width:50px; height:50px;">
          <input type="radio" id="myReportradio3" class="myReportRadioList" name="Report" value="3"><label>부적절한 메세지</label><br><br><br>
          </div>
          <div class="myRadioClass">
          <img src="resources/images/chatOther.png" id="myRadioClick4" class="myRadioImg chatOther" style="width:50px; height:50px;">
          <input type="radio" id="myReportradio4" class="myReportRadioList" name="Report" value="4"><label>기타 등등</label><br><br><br>
          </div>
          <textArea cols="50" rows="7" id="myReportTextContentId" name="myReportTextContent" style="resize:none; width:350px;"></textArea>  
         <div class="reModal_footer">
 			<button style="float:middle;" id="myReportBtn" onclick="return myReportBtnClick();">확인</button>
 			<button class="close">취소</button>
 		 </div>
      </div>
    </div>
	
	
	<script>
	$(function(){
	$("#myReportradio1").hide();
	$("#myReportradio2").hide();
	$("#myReportradio3").hide();
	$("#myReportradio4").hide();
	});
	
	 $("#myRadioClick1").click(function(){
		   $("#myReportradio1").click();
		   alert("부적절한 사진을 선택하셨습니다.")
		   });
	
	 $("#myRadioClick2").click(function(){
		   $("#myReportradio2").click();
		   alert("스팸으로 의심됨을 선택하셨습니다.")
		   });
	 $("#myRadioClick3").click(function(){
		   $("#myReportradio3").click();
		   alert("부적절한 메세지를 선택하셨습니다.")
		   });
	 $("#myRadioClick4").click(function(){
		   $("#myReportradio4").click();
		   alert("기타등등을 선택하셨습니다.")
		   });
	
		   // Get the modal
	    var modal = document.getElementById('myModal');
	    // Get the button that opens the modal
	    var btn = document.getElementById("myBtn");
	    // Get the <span> element that closes the modal
	    var modalClose = document.getElementsByClassName("close")[0];                                          
	    // When the user clicks on <span> (x), close the modal
	    modalClose.onclick = function() {
	        modal.style.display = "none";
	        $("#myReportTextContentId").val("");
	        $("#myReportId").val("");
	        $("#myChatId").val("");
	        $("#myReportTr").val("");
	    }

	</script>
	

 <script>
var reIndex = 0;
function reportModal(userName, chatId, trIndex){
		$("#myReportId").val(userName);
		$("#myChatId").val(chatId);
		
		$("#myModal").css("display", "block");
		var tr = trIndex;
		$("#myReportTr").val(tr);
}


	var mybtn = document.getElementById('myBtn');
	function myReportBtnClick(){
		if($('input:radio[name=Report]:checked').val() == null) {
			alert("신고분야를 선택해주세요");
			return false;
		}
		if($("#myReportTextContentId").val() == "") {
			 alert("내용을 적어주세요");
	    return false;
	 }  
		
		$.ajax({
			url:"myReportInsert.do",
			type:"POST",
			data:{
				myReportId : $("#myReportId").val(),
				myChatId : $("#myChatId").val(),
				myReportRadioList : $('input:radio[name=Report]:checked').val(),
				myReportTextContentId : $("#myReportTextContentId").val(),
				myUserNum : '${loginUser.u_mid}' },
			success:function(data) {
			 
			alert("신고되었습니다.");
			$("#myModal").css("display", "none");
			var reItem = $("#myReportTr").val();
			
			$("#reIndex"+reItem).remove();
			$("#myReportTextContentId").val("");
			
		},
	
	error:function(request, status, errorData){
		alert("error code: " + request.status + "\n"
				+"message: " + request.responseText
				+"error: " + errorData);
	}
});

}

</script>


 <!-- <script>


  var current = "${pi.currentPage}"; 
  
  
  /* 페이징 AJAX */
   function paginAjax(currentPage){
	  $.ajax({
		 url: "currentList.do" ,
		 type:"post",
		 data:{user_id:"${loginUser.user_id}", currentPage : currentPage},
		 dataType:"json",
		 success:function(data){
			
			 var $myReportModalBtn = $(".myReportModalBtn");
			 $tableBody = $("#mytd");
			 $tableBody.html("");
			 
			
			 
			 if(data != "fail"){ 
			 	for(var i in data){
				 var Bodyappend= 
					"<tr><td>" + ((decodeURIComponent)(data.list[i].chatroom)) + "</td><td>"
					 + data.list[i].user_id2 + "</td><td>"  + ((decodeURIComponent)(data.list[i].username2))
					 + "<td><button id='myBtn' onclick='reportModal('"${my.user_id}', '${my.chatid })">Open Modal</button></td>" 
					 if('${loginUser.user_nick}' == data[i].userName)
						 "<tr><td>" + ((decodeURIComponent)(data.list[i].chatroom)) + "</td><td class='myuser_id2'>" + data.list[i].user_id2 + 
						 "</td><td>" + ((decodeURIComponent)(data.list[i].username2)) + "</td><td><button id='myBtn' onclick='reportModal('"+'${my.user_id2}'+','+"' ${my.chatid}')">Open Modal</button></td>"
					 $tableBody.append(Bodyappend);
				}
					
 				 }else{
			 $tr=$("<tr>");
			 $chatroom=$("<td colspan='6'>").text("등록된 내역이 없습니다");
			 
			 $tr.append($chatroom);
			 $tableBody.append($tr);
				 } 
	  },
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
		 }
	  });
	  
  } 
</script> -->
	
	
</body>
</html>