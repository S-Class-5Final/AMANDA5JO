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

	
	<h1 align="center">게시글 목록</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${pi.listCount }
		
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="700" id="td">
		<tr>
			<th>번호</th>
			<th width="300">채팅방 이름</th>
			<th>내 아이디 테스트</th>
			<th>상대방 아이디</th>
			<th>신고하기</th>
		</tr>
		<c:forEach var="my" items="${list }">
			<c:if test="${!empty loginUser }">
			<tr>
				<td align="center">${my.chatid }</td>
				<td align="left">
				${my.chatroom }
				</td>
				
				<td align="center">${my.username }</td>
				<td align="center">${my.username2 }</td>
				<td align="center"><button type="button" class="btn btn-info btn-lg myReportModalBtn" data-toggle="modal" data-target="#myModal1-target">
  신고하기</button></td>
			</tr>
			</c:if>
		</c:forEach>
		
		<!-- 페이징 부분 -->
 			<tr align="center" height="20">
 				<td colspan="6">
	 				<!-- [이전] -->
	 				<c:if test="${pi.currentPage == 1 }">
	 					[이전]&nbsp;
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage > 1 }">
	 					<c:url var="blistBack" value="/blist.do">
	 						<c:param name="page" value="${pi.currentPage - 1 }"/>
	 					</c:url>
	 					<a href="${blistBack }">[이전]</a>
	 				</c:if>
	 				
	 				<!-- [번호들] -->
	 				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	 					<c:if test="${p eq pi.currentPage }">
	 						<font color="red" size="4"><b>[${p}]</b></font>
	 					</c:if>
	 					
	 					<c:if test="${p ne pi.currentPage }">
	 						<c:url var="blistCheck" value="blist.do">
	 							<c:param name="page" value="${p }"/>
	 						</c:url>
	 						<a href="${blistCheck }">${p }</a>
	 					</c:if>
	 				</c:forEach>
	 				
	 				
	 				<!-- [다음] -->
	 				<c:if test="${pi.currentPage == pi.maxPage }">
	 					&nbsp;[다음]
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage < pi.maxPage }">
	 					<c:url var="blistEnd" value="blist.do">
	 						<c:param name="page" value="${pi.currentPage + 1 }"/>
	 					</c:url>
	 					<a href="${blistEnd }">&nbsp;[다음]</a>
	 				</c:if>
 				</td>
 			</tr>
	</table>
	
	<div class="container">

  <!-- Trigger the modal with a button -->
  

 
  <!-- Modal -->
  <div class="modal fade myReportModalMain" id="myModal1-target" role="dialog">
    <div class="modal-dialog">
        <form action="myReportInsert.do" method="post" id="myReportInsert">
    
      <!-- Modal content-->
      <div class="modal-content myReportModalcontent">
        <div class="modal-header myReportModaheader">
          <h3 class="modal-title" align="center">회원신고</h3>
          <h4 align="center"></h4>
        </div>
        <div class="modal-body myReportBody">
          <input type="hidden" id="myReportId" name="user_id" value="12@naver.com">
          <input type="hidden" id="myReportUId" name="myReportUId" value="1">
          <input type="radio" class="myReportRadioList" name="Report" value="1">부적절한 사진<br><br><br><br>
          <input type="radio" class="myReportRadioList" name="Report" value="2">스팸으로 의심됨 <br><br><br><br>
          <input type="radio" class="myReportRadioList" name="Report" value="3">부적절한 메세지<br><br><br><br>
          <input type="radio" class="myReportRadioList" name="Report" value="4">기타 등등<br><br>
          <textArea cols="50" rows="7" id="myReportTextContentId" name="myReportTextContent"></textArea>
        </div>
        <div class="modal-footer ReportModalFooter" >
          <button type="button" id="myReportBtnId" class="btn btn-default">신고하기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </form>
    </div>
  </div>
  
</div>

<script>
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
</script>
	
	
	
	
	
	
</body>
</html>