<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/matchingMenu.jsp"/>
	
	<h1 align="center">게시글 목록</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${pi.listCount }
		
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="700" height="100">
	<thead>
		<tr>
			<th width="100">채팅방 이름</th>
			<th width='100'>상대방 아이디</th>
			<th width='100'>상대방 이름</th>
			<th width='100'>신고하기</th>
		</tr>
	</thead>
	<tbody id="mytd">	
	 	<c:forEach var="my" items="${list }">
			<tr>
			
				<td>${my.chatroom }</td>
				<td id='myuser_id2'>${my.user_id2}</td>
				<td >${my.username2 }</td>
				<td><button type='button' class='btn btn-info btn-lg myReportModalBtn' 
				data-toggle='modal' data-target='#myModal1-target'>
  신고하기</button></td>
			</tr>
		 </c:forEach>
	</tbody>
		

		
		
		
		
		
		<!-- 페이징 부분 -->
		<tfoot id="mytft">	
 			<tr align="center" height="20">
 				<td colspan="6">
	 				<!-- [이전] -->
	 				<c:if test="${pi.currentPage == 1 }">
	 					[이전]
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage > 1 }">
	 					<a href="#" onclick="paginAjax(${pi.currentPage-1});">[이전]</a>
	 				</c:if>
	 				
	 				<!-- [번호들] -->
	 				<c:forEach var="myp" begin="${pi.startPage }" end="${pi.endPage }">
	 					<c:if test="${myp eq pi.currentPage }">
	 					<a href="#" onclick="paginAjax(${pi.currentPage});"><font size="4">[${myp}]</font></a>
	 						
	 					</c:if>
	 					
	 					<c:if test="${myp ne pi.currentPage }">
	 						<a href="#" onclick="paginAjax(${myp});"><font size="4">[${myp}]</font></a></a>
	 					</c:if>
	 				</c:forEach>
	 				
	 				<!-- [다음] -->
	 				<c:if test="${pi.currentPage == pi.maxPage }">
	 				<a href="#" onclick="paginAjax(${pi.currentPage});">&nbsp;[다음]</a>
	 				
	
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage < pi.maxPage }">
	 					<a href="#" onclick="paginAjax(${pi.currentPage+1});">&nbsp;[다음]</a>
	 				</c:if>
 				</td>
 			</tr>
 		</tfoot>
	</table>
	
	
	

	
	
	<div class="container">

  <!-- Trigger the modal with a button -->
  

 
  <!-- Modal -->
  <div class="modal fade myReportModalMain" id="myModal1-target"  role="dialog">
    <div class="modal-dialog">
        <form action="myReportInsert.do" method="post" id="myReportInsert">
    
      <!-- Modal content-->
      <div class="modal-content myReportModalcontent">
        <div class="modal-header myReportModaheader">
          <h3 class="modal-title" align="center">회원신고</h3>
          <h4 align="center"></h4>
        </div>
        <div class="modal-body myReportBody">
   			
          <input type="text" id="myReportId" name="myReportId" >
          <input type="radio" class="myReportRadioList" name="Report" value="1">부적절한 사진<br><br><br><br>
          <input type="radio" class="myReportRadioList" name="Report" value="2">스팸으로 의심됨 <br><br><br><br>
          <input type="radio" class="myReportRadioList" name="Report" value="3">부적절한 메세지<br><br><br><br>
          <input type="radio" class="myReportRadioList" name="Report" value="4">기타 등등<br><br>
          <textArea cols="50" rows="7" id="myReportTextContentId" name="myReportTextContent"></textArea>
        </div>
        <div class="modal-footer ReportModalFooter" >
          <button type="button" id="myReportBtnId" id="myModal1-target" class="btn btn-default">신고하기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </form>
    </div>
  </div>
  
</div>
<script>


$(function() {
	
	$("#myReportId").val($("#myuser_id2").text());
	
});
</script>


<script>



$(document).ready(function() {     
    $('#myModal1-target').on('click', function(event) {          
    	var USERID = $(event.relatedTarget).data('data-userid');
        var USERNAME = $(event.relatedTarget).data('data-username');
        alert(USERID.h());
        alert(USERNAME.val());
    });
});


var myreportContent = $("#myReportTextContentId");
var myreport_Id = $("#myReportId");
var myreport_UId = $("#myReportUId");
$("#myReportBtnId").click(function(){
alert($("input:radio[name='Report']:checked").val());
alert(myreportContent.val());
alert(myreport_Id.val());
alert(myreport_UId.val());
});   

  $("#myReportBtnId").click(function(){
	$.ajax({
		url:"myReportInsert.do",
		type:"POST",
		data:{
			myreport_Id:myreport_Id.val(),
			ReportradioCheck:$("input:radio[name='Report']:checked").val(),
			myreportContent: myreportContent.val(),
			myreport_UId:myreport_UId.val()
			},
		success:function(data) {
			if(data=="success!!!!!") {
  
				alert("성공");
			}
		},
		
		error:function(request, status, errorData){
			alert("error code: " + request.status + "\n"
					+"message: " + request.responseText
					+"error: " + errorData);
		}
		
		
	})
});  
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
			/*  $.each(data, function(i, data.list) { */
				for(var i in data.list){
				 var Bodyappend=
					"<tr><td>" + ((decodeURIComponent)(data.list[i].chatroom)) + "</td><td>"
					 + data.list[i].user_id2 + "</td><td>"  + ((decodeURIComponent)(data.list[i].username2))
					 + "</td><td><button type='button' class='btn btn-info btn-lg myReportModalBtn'data-toggle='modal' data-target='#myModal1-target'>신고하기</button></td></tr>"
					 $tableBody.append(Bodyappend);
				}
			
			 
			 /* 
				  var $tr;
				 var $chatroom;
				 var $user_id;
				 var $user_id2;
				 var $username;
				 var $username2;
				 var $myReportModalBtn = $(".myReportModalBtn"); 
				 
			  if(data != "fail"){
				 for(var i in data) {
					 $tr=$("<tr>");
					 $chatroom=$("<td>").text(data[i].chatroom);
					 $user_id= $("<td>").text(data[i].user_id);
					 $user_id2= $("<td>").text(data[i].user_id2);
					 $username=$("<td>").text(data[i].username);
					  $username2=$("<td>").text(data[i].username2);
					 $myReportModalBtn=$("<td>").text(data[i].myReportModalBtn); 

					 
					 $tr.append($chatroom);
					 $tr.append($user_id);
					 $tr.append($user_id2);
					 $tr.append($username);
				 	 $tr.append($username2);
					 $tr.append($myReportModalBtn); 
					 $tableBody.append($tr);
				 console.log(data);
				 } */
					
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
</script>
	
	
	
	
</body>
</html>