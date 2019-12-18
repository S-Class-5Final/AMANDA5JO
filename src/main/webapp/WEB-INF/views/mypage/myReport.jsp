<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<div class="container">

  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg myReportModalBtn" data-toggle="modal" data-target="#myModal1-target">
  신고하기</button>

 
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
          <input type="hidden" id="myReportId2" name="user_id2" value="12345@naver.com">          
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
var myreport_Id2 = $("#myReportId2");
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
			myreport_Id2:myreport_Id2.val(),
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