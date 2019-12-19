<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {
	width: 100%;
	height: 100%;
	min-width: 350;
	max-width: 350;
	min-height: 530;
	max-height: 530;
	margin: 0;
	overflow-y: hidden;
	overflow-x: hidden;
}
/* join chat message */
.status-msg {
	opacity: 0.5;
	text-align: center;
	font-weight: bold;
	font-size: smaller;
	padding-top: 2px;
	padding-bottom: 2px;
	background-color: ghostwhite;
}
/* chatting most parent div */
#chatView {
	width: 100%;
	height: 100%;
	margin: 0;
	position: absolute;
	background-color: rgb(189, 209, 220);
}
/* show chat content show div */
#chat_box {
	width: 100%;
	min-width: 350px;
	height: 70%;
	min-height: 450px;
	border: 1px solid black;
	margin: 0;
	overflow-x: hidden;
	overflow-y: auto;
}
/* show chat content scroll unvisible */
#chat_box::-webkit-scrollbar {
	display: none;
}
/* Chatting message and button 's parent div */
#chat_msg {
	display: inline-block;
	width: 100%;
	height: 30%;
	margin: 0;
	padding: 0;
	background-color: white;
}
/* msg send and img send button div */
#button-div {
	display: inline-block;
	width: 23%;
	float: right;
}
/* message write textarea */
#msg {
	width: 100%;
	border: 0px;
	margin: 2;
	word-spacing: normal;
	overflow: hidden;
	resize: none;
	vertical-align: top;
}
/* wirte message div */
#msg-div {
	width: 75%;
	display: inline-block;
	float: left;
}
/* send message button */
#msg_process {
	display: inline-block;
	width: 60;
	height: 30;
	background-color: #ffec42;
	border: 0.5px solid lightgray;
	margin: 0;
	margin-top: 10;
}
/* send img button */
#img_button {
	display: inline-block;
	margin-top: 8px;
}
/* chat content td */
.bubble {
	margin: 4px 0;
	display: inline-block;
	word-spacing: normal;
	font-size: 14px;
	min-width: 2.5em;
	position: relative;
}
.my-bubble {
	background-color: #fff46d;
	border-radius: 14px 0px 14px 14px;
	padding: 7px 5px 7px 10px;
	word-break: break-all;
	float: right;
	clear: both;
}
.my-bubble2 {
	background-color: #fff46d;
	border-radius: 14px 14px 14px 14px;
	padding: 7px 5px 7px 10px;
	word-break: break-all;
	float: right;
	clear: both;
}
.opponent-bubble {
	background-color: white;
	border-radius: 0px 14px 14px 14px;
	padding: 7px 5px 7px 10px;
	word-break: break-all;
	float: left;
	clear: both;
}
.opponent-bubble2 {
	background-color: white;
	border-radius: 14px 14px 14px 14px;
	padding: 7px 5px 7px 10px;
	word-break: break-all;
	float: left;
	clear: both;
}
/* opponent img css */
.chatImg-box {
	border-radius: 22px 22px 22px 22px;
	width: 44px;
	height: 44px;
}
/* chat message table */
.myChat_table {
	float: right;
    max-width: 55%;
    border-spacing: 0px;
    margin-right: 1em;
}
.opponentChat_table {
	float: left;
	max-width: 70%;
	border-spacing: 0px;
    margin-right: 1em;
}
/* chat message line */
.chatLine {
	display: inline-block;
	width: 100%;
	height: auto;
	z-index: 900;
}
/* show chat opponent ChatUser name  */
.name-box {
	position: relative;
	font-size: smaller;
}
/* show chat opponent ChatUser Img */
.img-align {
	vertical-align: top;
}
/* chat send time css */
.send_time {
	font-size: 10px;
    width: 5em;
    vertical-align: bottom;
}
.send_time.my{
    text-align: right;
    padding-right: 0.5em;
    padding-bottom: 0.5em;
}
.send_time.opponent{
    text-align: left;
    padding-left: 0.5em;
    padding-bottom: 0.5em;
}
/* The Modal (background) */
.chatModal {
	display: none; 
	position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    text-align: center;
}
.chatModal-header{
	height: 15%;
    width: 100%;
    border-bottom: 1px solid lightgray;
    text-align: center;
    margin-bottom: 5%;
    font-weight: bold;
}
/* Modal Content/Box */
.chatModal-content {
	display: inline-block;
    background-color: #fefefe;
    margin: 35% auto;
    padding: 1.5em;
    padding-top: 0px;
    padding-bottom: 0px;
    border: 1px solid lightgray;
    width: 70%;
    height: 50%;
    border-radius: 15px;
    color: #777676;
}
/* modal Button */
.sendModalBtn{
	font-size: 15px;
    border-radius: 5px;
    background-color: yellow;
    border: 1px solid lightgray;
    margin: 0.5em;
    width: 4em;
}
.chatModalClose {
	color: black;
    font-size: 15px;
    margin: 0.5em;
	width: 4em;
    border-radius: 5px;
    background-color: white;
    border: 1px solid lightgray;
}
.chatModalClose:hover, .close:focus {
	cursor: pointer;
	opacity: 0.6;
}
.sendModalBtn:hover, .close:focus {
	cursor: pointer;
	opacity: 0.6;
}
/* Modal Ul Div*/
#ulDivBox{
	border: 1px solid lightgray;
    width: 95%;
    height: 50%;
    padding-left: 5%;
	overflow-x: hidden;
	overflow-y: auto;
}
#ulDivBox::-webkit-scrollbar {
	display: none;
}
#ulDivBox p{
	margin : 0;
	text-align: left;
    font-size: small;
}
.chatModalUl{
	font-size: small;
    float: left;
    vertical-align: middle;
    padding-left: 1.5em;
    margin-top: 0.5px;
}
/* Declaration Modal */
.declarModal {
	display: none; 
	position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    text-align: center;
}
.declarModal-header{
	height: 15%;
    width: 100%;
    border-bottom: 1px solid lightgray;
    text-align: center;
    margin-bottom: 5%;
    font-weight: bold;
}
/* Modal Content/Box */
.declarModal-content {
    display: inline-block;
    background-color: #fefefe;
    margin: 35% auto;
    padding: 20px;
    padding-top: 0px;
    border: 1px solid lightgray;
    width: 70%;
    height: 40%;
    border-radius: 15px;
    color: #777676;
}
/* modal Button */
.declarModalBtn{
	font-size: 15px;
    border-radius: 5px;
    background-color: yellow;
    border: 1px solid lightgray;
    margin: 0.5em;
    width: 4em;
}
.declarModalClose {
	color: black;
    font-size: 15px;
    margin: 0.5em;
	width: 4em;
    border-radius: 5px;
    background-color: white;
    border: 1px solid lightgray;
}
.declarModalClose:hover, .close:focus {
	cursor: pointer;
	opacity: 0.6;
}
.declarModalBtn:hover, .close:focus {
	cursor: pointer;
	opacity: 0.6;
}
/* chatImg Send and Get */
.my_chatImg{
	max-width: 100%;
	float: right;
}
.opponent_chatImg{
	max-width: 100%;
	float: left;
}
.chatIDModal-header{
	height: 10%;
    width: 100%;
    border-bottom: 1px solid lightgray;
    text-align: center;
    margin-bottom: 4%;
    font-weight: bold;
}
.chatIDModal-content{
	display: inline-block;
    position: relative;
    background-color: #fefefe;
    margin: 10% 5% auto 5%;
    padding: 1.5em;
    padding-top: 0px;
    padding-bottom: 0px;
    border: 1px solid lightgray;
    width: 70%;
    height: 75%;
    border-radius: 15px;
    color: #777676;
}
.declar{
	display: none;
}
.slideUl{
	position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 15;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    padding-left: 0;
    margin-right: 15%;
    margin-left: 15%;
    list-style: none;
    color:lightgray;
}
#backModalImg{
	position: absolute;
	top:50%;
	left:3em;
	cursor:pointer;
	z-index:1003;
	border: 0px;
	opacity :0.5;
	background-image: url('resources/img/leftArrow.png');
	background-size: 100% 100%;
}
#nextModalImg{
	position: absolute;
	top:50%;
	right:3em;
	cursor:pointer;
	z-index:1003;
	border: 0px;
	opacity :0.5;
	background-image: url('resources/img/rightArrow.png');
	background-size: 100% 100%;
}
.activeImg{
	color:black;
}
.innerChatImg{
	position: relative;
    width: 100%;
    overflow: hidden;
}
.innerImgDiv{
	position: relative;
    display: none;
    float: left;
    width: 100%;
    margin-right: -100%;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    transition: -webkit-transform .6s ease-in-out;
    transition: transform .6s ease-in-out;
    transition: transform .6s
}
.innerImgDiv.active{
	display:block;
}
#chatImgDivBox{
	width: 100%;
    height: 70%;
}
.innerImgDiv>img{
	width: 90%;
    height: 100%;
}
.innerUserImg{
	
}
.chatIDModal-footer{
	height: 10%;
    width: 100%;
    border-top: 1px solid lightgray;
    text-align: center;
    margin-top: 4%;
    padding-top: 0.5em;
    vertical-align: bottom;
}
.userImgBtn{
	    width: 5em;
    border-radius: 1em 1em 1em 1em;
    background-color: yellow;
    border: 1px solid lightgray;
    outline-style: none;
    cursor: pointer;
}
.declarBtn{
	width: 45%;
    height: 3em;
    border-radius: 2em 2em 2em 2em;
    border: 1px solid lightgray;
    background-color: yellow;
    font-size: 14px;
    font-weight: bold;
    /* color: white; */
    outline-style: none;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    cursor: pointer;
}
.declarBtn.close{
	background-color: lightgray;
}
.diclarModalDiv{
	background-color: red;
    width: 100%;
    height: 65%;
    margin-bottom: 3%;
    text-align: center;
}
.declarCategory{
	width: 100%;
    text-align: left;
    font-size: 1em;
    margin-top: 5%;
    margin-bottom: 5%;
    margin-left: auto;
    margin-right: auto;
    background-color: white;
}
#declarMsg{
	width: 90%;
    border: 0px;
    margin: 2;
    word-spacing: normal;
    overflow: hidden;
    resize: none;
    vertical-align: top;
}
.declarImg{

}
</style>
</head>
<!-- 남은 기능
	1. 이미지 출력
	2. 신고
	3. 읽었는지 확인하는 숫자 표시
	4. input hidden을 통한 찾기 (보류)
 -->
<body>
	<div id="chatView">
		<!-- 채팅 내용 div -->
		<div id="chat_box"></div>
		<div id="chat_msg">
			<div id="msg-div">
				<textarea rows=5 id="msg"></textarea>
			</div>
			<div id="button-div">
				<button id="msg_process">전송</button>
				<input type="button" id="img_button" value="이미지">
			</div>
			<div style="display:none;">
				<form id="chatImgBtnForm" name="chatImgBtnForm" enctype="multipart/form-data" method="post">
					<input type="file" id="sendFile" name="fileImg[]" accept=".png, .gif, .jpg, .jpeg" multiple="multiple">
					<!-- 채팅방 인덱스번호를 가진 jstl 태그 이용 -->
					<input type="hidden" name="chatId" value="${chat.chatId}">
					<!-- 현재 사용자의 이름을 가진 jstl 태그 이용 -->
					<input type="hidden" name="chatUser" value="${loginUser.user_nick }">
					<input type="hidden" name="img_status" value="Y">
				</form>
			</div>
		</div>
		<!-- The Modal -->
		<!-- 유저 이미지 및 신고하기 모달 -->
		<div id="chatIdModal" class="chatModal">
			<div id="userImgModal" class="chatIDModal-content">
				<div class="chatIDModal-header">
					<p>사진목록</p>
				</div>
				<div id="chatImgDivBox">
					<div class="innerUserImg">
						<c:forEach var="cImg" items="${userImg}" varStatus="status">
						<div class="innerImgDiv active">
							<img alt="first" src="resources/userface/${cImg.renameFileName}">
						</div>
						</c:forEach>
						<ul class="slideUl">
							<li id="slideImg1" class="activeImg"></li>
							<li id="slideImg2"></li>
							<li id="slideImg3"></li>
						</ul>
						<input type="button" id="backModalImg" onclick="backImg();">
						<input type="button" id="nextModalImg" onclick="nextImg();">
					</div>
				</div>
				<div class="chatIdModal-footer">
					<input class="userImgBtn" onclick="declarUser();" type="button" value="신고">
					<input id="nowDeclar" class="userImgBtn" type="button" value="차단">
					<input onclick="closeModal();" class="userImgBtn" type="button" value="닫기">
				</div>
			</div>
			<div id="userDeclarModal" class="chatIDModal-content declar">
					<div class="chatIDModal-header">
						<p>신고</p>
					</div>
					<form id="declarForm" name="declearForm" method="post">
						<div class="diclarModalDiv">
							<div class="declarCategory" onclick="declarCategory('1')">
								<img class="declarImg" src="#">
								<span>부적절한 사진</span>
							</div>
							<div class="declarCategory" onclick="declarCategory('2')">
								<img class="declarImg" src="#">
								<span>스팸으로 의심됨</span>
							</div>
							<div class="declarCategory" onclick="declarCategory('3')">
								<img class="declarImg" src="#">
								<span>부적절한 메시지</span>
							</div>
							<div class="declarCategory" onclick="declarCategory('4')">
								<img class="declarImg" src="#">
								<span>기타</span>
							</div>
							<textarea id="declarMsg" rows="5"></textarea>
							<input type="hidden" name="#" id="r_Type">
						</div>
						<div style="vertical-align: bottom; text-align:center">
						<!-- class="declarDivOpen"  -->
							<input id="declarBtn" class="declarBtn" onclick="declarSendUser();" type="button" value="신고">
							<input onclick="closeModal();" class="declarBtn close" type="button" value="닫기">
						</div>
					</form>
			</div>
		</div>
		<!-- 드래그 Modal -->
		<div id="myModal" class="chatModal">
			<div class="chatModal-content">
				<div class="chatModal-header">
					<p>파일전송목록</p>
				</div>
				<form id="chatImgForm" name="chatImgForm" enctype="multipart/form-data" method="post">
					<div id="ulDivBox">
						<p>전송할 파일목록</p>
						<ul id="imgInputUl" class="chatModalUl">
							
						</ul>
						<!-- 채팅방 인덱스번호를 가진 jstl 태그 이용 -->
						<input type="hidden" name="chatId" value="${chat.chatId}">
						<!-- 현재 사용자의 이름을 가진 jstl 태그 이용 --> 
						<input type="hidden" name="chatUser" value="${loginUser.user_nick }"> 
						<input type="hidden" name="img_status" value="Y">
					</div>
					<div style="vertical-align: bottom; text-align:center">
					<input id="sendImgBtn" class="sendModalBtn" type="button" value="확인">
					<input class="chatModalClose" onclick="deleteFile();" type="button" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="http://192.168.130.136:80/socket.io/socket.io.js"></script>
	<script type="text/javascript">
	/* const socket = io("http://172.30.1.36:80"); */
	const socket = io("http://192.168.130.136:80");
	var room = "${chat.chatRoom}";
	var name = '${loginUser.user_nick }';
	var chTime = 0;
		$(function() {
			// 엔터키 이벤트
			$("#chat_msg").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#msg_process").click();
					// 전송 후 줄바꿈을 막음
					key.preventDefault();
				}
			});

			// 채팅창에 들어왔을 시 socket에 join
			socket.emit('joinRoom', room, '임시');
			
			
			// 채팅창이 닫히면 발동
			window.onbeforeunload = function() {
				socket.emit('leaveRoom', room, '임시');
			}
			
			//msg_process를 클릭할 때
			$("#msg_process").click(function() {
				//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
				var msg = $("#msg").val();
				
				if (msg != "") {
					$.ajax({
						url:"chInsertChat.do",
						type:"post",
								/* name 부분은 세션값으로 변경 */
						data:{chatId:'${chat.chatId}', chatUser:name, c_Content:msg},
						success:function(data){
							if(data != "fail"){
								for(var i in data){
									socket.emit("send_msg", '${chat.chatRoom}', data[i]);									
								}
							}else{
								console.log("fail");
							}
						}
					});
				}
				//#msg에 벨류값을 비워준다.
				$("#msg").val('');
			});

			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('chat_msg', function(data) {
				var timeP = data.chatTime.split(':');
				if(timeP[0] > 11){
					timeP = '오후 '+timeP[0]+":"+timeP[1];
				}else{
					timeP = '오전 '+timeP[0]+":"+timeP[1];
				}
				var cp = data.chatTime+data.chatUser;
				if(cp != chTime){
					chTime = data.chatTime+data.chatUser;
					if(name == '${loginUser.user_nick }'){
						my_chat(data.crId, data.c_Content, timeP);
					}else{
						opponent_chat(data.crId, data.chatUser, data.c_Content, timeP);
					}
				}else{
					if(name == '${loginUser.user_nick }'){
						my_chat2(data.crId, data.c_Content);
					}else{									
						opponent_chat2(data.crId, data.c_Content);
					}
				}
				$('#chat_box').animate({
					scrollTop : $('#chat_box').get(0).scrollHeight
				}, 100);
			});
			
			//소켓 서버로 부터 sendImg_msg를 통해 이벤트를 받을 경우 
			socket.on('chatImg_msg', function(data) {
				var timeP = data.chatTime.split(':');
				if(timeP[0] > 11){
					timeP = '오후 '+timeP[0]+":"+timeP[1];
				}else{
					timeP = '오전 '+timeP[0]+":"+timeP[1];
				}

				if(name == '${loginUser.user_nick }'){
					my_chat(data.crId, data.c_Content, timeP, data.img_status);
				}else{
					opponent_chat(data.crId, data.chatUser, data.c_Content, timeP, data.img_status);
				}
				
				$('#chat_box').animate({
					scrollTop : $('#chat_box').get(0).scrollHeight
				}, 100);
			});
		});
		// 내 채팅
		function my_chat(index, msg, time, status) {
			var contentDiv = $("<div></div>").addClass("chatLine").appendTo("#chat_box");
			
			var tableChat = $("<table></table>").addClass("myChat_table")
			.appendTo(contentDiv);
			var firstTr = $("<tr></tr>").appendTo(tableChat);
			var timeTd = $('<td></td>').text(time).addClass("send_time my")
			.appendTo(firstTr);
			var addTd = $('<td></td>').text(msg).addClass("my-bubble bubble").appendTo(firstTr);			
			
			$("<input>").attr({"type" : "hidden", "name":"crId", "id": index}).appendTo(addTd);
		}

		// 내가 연속으로 채팅 시
		function my_chat2(index, msg, status) {
			console.log(msg);
			var tableChat = $(".chatLine").last().children(".myChat_table");
			var addTr = $('<tr></tr>').appendTo(tableChat)
			// tr의 갯수를 파악하여 rowspan을 한다.
			tableChat.children("tr").find(".send_time").attr("rowspan",tableChat.children("tr").length);
			var addTd = $('<td></td>').text(msg).addClass("my-bubble2 bubble").appendTo(addTr);
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}
		
		// 상대방 채팅
		function opponent_chat(index, name, msg, time, status) {
			var contentDiv = $("<div></div>").addClass("chatLine").appendTo(
					"#chat_box");
			var tableChat = $("<table></table>").addClass("opponentChat_table")
					.appendTo(contentDiv);
			var firstTr = $("<tr></tr>").appendTo(tableChat);
			var secondTr = $("<tr></tr>").appendTo(tableChat);
			var imgTd = $("<td></td>").attr("rowspan", "2").appendTo(firstTr)
					.addClass("img-align");
			var img = $('<img>').attr("src", "resources/img/ex22.jpg")
					.addClass("chatImg-box").appendTo(imgTd);
			var nameTd = $("<td></td>").text(name).attr("colspan", "2")
					.addClass("name-box").appendTo(firstTr);
			var addTd = $("<td></td>").text(msg).addClass(
						"opponent-bubble bubble").appendTo(secondTr);
			var timeTd = $('<td></td>').text(time).addClass("send_time opponent")
					.appendTo(secondTr);
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}
		
		// 상대방이 연속으로 채팅 시
		function opponent_chat2(index, msg, status) {
			var tableChat = $(".chatLine").last().children(".opponentChat_table");
			var addTr = $('<tr></tr>').appendTo(tableChat);
			// tr의 갯수를 파악하여 rowspan을 한다.
			tableChat.children("tr").find(".img-align").attr("rowspan",tableChat.children("tr").length);
			tableChat.children("tr").find(".send_time").attr("rowspan",tableChat.children("tr").length);
			var addTd = $('<td></td>').text(msg).addClass("opponent-bubble2 bubble").appendTo(addTr);
			
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}
		
		function my_imgChat(){
			var contentDiv = $("<div></div>").addClass("chatLine").appendTo("#chat_box");
			var addTd;
			var tableChat = $("<table></table>").addClass("myChat_table").appendTo(contentDiv);
			var firstTr = $("<tr></tr>").appendTo(tableChat);
			var timeTd = $('<td></td>').text(time).addClass("send_time my").appendTo(firstTr);
			addTd = $('<td></td>').appendTo(firstTr);
			$('<img>').attr("src", "resources/chatImg/"+msg).addClass("my_chatImg").appendTo(addTd);
			
			$("<input>").attr({"type" : "hidden", "name":"crId", "id": index}).appendTo(addTd);
		}
		
		function opponent_imgChat(){
			var contentDiv = $("<div></div>").addClass("chatLine").appendTo(
			"#chat_box");
			var tableChat = $("<table></table>").addClass("opponentChat_table")
					.appendTo(contentDiv);
			var firstTr = $("<tr></tr>").appendTo(tableChat);
			var secondTr = $("<tr></tr>").appendTo(tableChat);
			var imgTd = $("<td></td>").attr("rowspan", "2").appendTo(firstTr)
					.addClass("img-align");
			var img = $('<img>').attr("src", "resources/img/ex22.jpg")
					.addClass("chatImg-box").appendTo(imgTd);
			var nameTd = $("<td></td>").text(name).attr("colspan", "2")
					.addClass("name-box").appendTo(firstTr);
			var addTd = $('<td></td>').appendTo(secondTr);
				$('<img>').attr("src", "resources/chatImg/"+msg).addClass("opponent_chatImg").appendTo(addTd);
			
			var timeTd = $('<td></td>').text(time).addClass("send_time opponent")
					.appendTo(secondTr);
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}
		
		
	</script>
	<!-- 이미지 드래그 모달 -->
	<script type="text/javascript">
		
		// 파일 리스트 번호
	    var fileIndex = 0;
	    // 파일 리스트
	    var fileList = new Array();
	 
	    $(function (){
	        // 파일 드롭 다운
	        fileDropDown();
	    });
	 
	    // 파일 드롭 다운
	    function fileDropDown(){
	        var dropZone = $("#chatView");
	        //Drag기능 
	        dropZone.on('dragenter dragleave dragover',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	        });
	        dropZone.on('drop',function(e){
	            e.preventDefault();
	            // 모달창 열림
	            /* $("#myModal").css("display", "block"); */
	            $("#chatIdModal").css("display", "block");
	            var files = e.originalEvent.dataTransfer.files;
	            if(files != null){
	                if(files.length < 1){
	                	/* alert */
	                    return;
	                }
					
	                selectFile(files);
	            }else{
	                alert("ERROR");
	            }
	        });
	    }
	 
	    // 파일 선택시
	    function selectFile(files){
	        // 다중파일 등록
	        if(files != null){
	            for(var i = 0; i < files.length; i++){
	                // 파일 이름
	                var fileName = files[i].name;
	                var fileNameArr = fileName.split("\.");
	                // 확장자
	                var ext = fileNameArr[fileNameArr.length - 1];
	                // 파일 사이즈(단위 :MB)
	                
	                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
	                    // 확장자 체크
	                    alert("등록 불가 확장자");
	                    break;
	                }else{
	                    // 파일 배열에 넣기
	                    fileList[fileIndex] = files[i];
	                    // 업로드 파일 목록 생성
	                    addModalImgName(fileIndex, fileName);
	                    // 파일 번호 증가
	                    fileIndex++;
	                }
	            }
	        }else{
	            /* alert("ERROR"); */
	        }
	    }
		
	    function deleteFile(){
	        // 파일 배열에서 삭제
	        fileList = new Array();
	        // 업로드 파일 목록에서 삭제
	        $("#imgInputUl").html("");
	        $("#myModal").css("display", "none");
	    }
		
	    // 모달에 li를 통한 이미지 이름 삽입
		function addModalImgName(fileIndex, fileName){
			var modalUl = $("#imgInputUl");
			var modalLi = $("<li></li>").text(fileName).appendTo(modalUl);
			modalLi.attr("id", "fileIndex"+fileIndex);
		}
		// 모달버튼 클릭시
		$(document).on('click', '#sendImgBtn', function(){
			var uploadFileList = Object.keys(fileList);
			
			var form = document.getElementById("chatImgForm");
			var formData = new FormData(form);
			for(var i = 0; i < uploadFileList.length; i++){
                formData.append('files', fileList[uploadFileList[i]]);
            }
			insertImg(formData);
			fileList = new Array();
		});
		/* 버튼을 통한 이미지 저장 및 전송 */
		$(document).on("click", "#img_button", function(){
			$("#sendFile").click();
		});
		
		$("#sendFile").on('change', function(e){
			
			var files = e.target.files;
		    var filesArr = Array.prototype.slice.call(files);	
		    var uploadFileList = Object.keys(filesArr);
			var form = document.getElementById("chatImgBtnForm");
			var formData = new FormData(form);
			for(var i in filesArr){
				formData.append("files", filesArr[uploadFileList[i]]);
				console.log(filesArr[uploadFileList[i]]);
			}
			/* insertImg(formData); */
		});
		
		function insertImg(formData){
			$.ajax({
				url:"chImgInsert.do",
				data:formData,
				type:"POST",
				enctype:"multipart/form-data",
				dataType:"json",
				contentType:false,
				processData:false,
				success:function(data){
					if(data != "fail"){
						$("#myModal").css("display", "none");
						$("#imgInputUl").html('');
						
						for(var i in data){
							console.log(data[data.length-i-1]);
							socket.emit("sendImg_msg", '${chat.chatRoom}', data[data.length-i-1]);
						}
					}
					// 채팅창 scroll 맨뒤로
					$('#chat_box').animate({
						scrollTop : $('#chat_box').get(0).scrollHeight
					}, 100);
				}
			});
		}
	</script>
	<!-- 채팅창 기존 내용 출력 -->
	<script type="text/javascript">
		$(function(){
			var cpTime = 0;
			$.ajax({
				url:"chAllContent.do",
				type:"post",
				data:{chatId:"${chat.chatId}"},
				dataType:"json",
				success:function(data){
					if(data != 'fail'){
						for(var i in data){
							var cp = data[i].chatTime+data[i].chatUser;
							var timeP = data[i].chatTime.split(':');
							if(timeP[0] > 11){
								timeP = '오후 '+timeP[0]+":"+timeP[1];
							}else{
								timeP = '오전 '+timeP[0]+":"+timeP[1];
							}
							if(cp != cpTime){
								cpTime = data[i].chatTime+data[i].chatUser;
								if(data[i].chatUser == '${loginUser.user_nick }'){
									my_reloadChat(data[i].crId, data[i].c_Content, timeP, data[i].img_status);
								}else{
									opponent_reloadChat(data[i].crId, data[i].chatUser, data[i].c_Content, timeP, data[i].img_status);
								}
							}else{
								if(data[i].chatUser == '${loginUser.user_nick }'){
									my_reloadChat2(data[i].crId, data[i].c_Content, data[i].img_status);
								}else{									
									opponent_reloadChat(data[i].crId, data[i].c_Content, data[i].img_status);
								}
							}
						}
					}
					/* 나중에 지우기 수정 */
					/* var offset = $(".chatLine").last().offset();
			        $('#chat_box').animate({scrollTop : offset.top}, 0);
			        console.log(offset.top); */
			        
			        /* var chat_box = $("#chat_box");
			        chat_box.scrollTop = chat_box.scrollHeight;
			        console.log(chat_box.scrollTop); */
			        /* 질문하기 */
					$("#chat_box").scrollTop($("#chat_box")[0].scrollHeight);
				}
			});
			
		});

		// 내 채팅
		function my_reloadChat(index, msg, time, status) {
			var firstDiv = $(".chatLine").first();
			var contentDiv;
			if(firstDiv.length == 0){
				contentDiv = $("<div></div>").addClass("chatLine").appendTo("#chat_box");
			}else{
				contentDiv = $("<div></div>").addClass("chatLine").insertBefore(firstDiv);
			}
			var tableChat = $("<table></table>").addClass("myChat_table")
					.appendTo(contentDiv);
			var firstTr = $("<tr></tr>").appendTo(tableChat);
			var timeTd = $('<td></td>').text(time).addClass("send_time my").appendTo(firstTr);
			var addTd;
			if(status == 'Y'){
				addTd = $('<td></td>').appendTo(firstTr);
				$('<img>').attr("src", "resources/chatImg/"+msg).addClass("my_chatImg").appendTo(addTd);
			}else{
				addTd = $('<td></td>').text(msg).addClass("my-bubble bubble").appendTo(firstTr);			
			}
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}

		// 내가 연속으로 채팅 시
		function my_reloadChat2(index, msg, status) {
			var tableChat = $(".chatLine").first().children(".myChat_table");
			var addTr = $('<tr></tr>').appendTo(tableChat)
			// tr의 갯수를 파악하여 rowspan을 한다.
			tableChat.children("tr").find(".send_time").attr("rowspan",
					tableChat.children("tr").length);
			var addTd;
			if(status == 'Y'){
				addTd = $('<td></td>').appendTo(addTr);
				$('<img>').attr("src", "resources/chatImg/"+msg).addClass("my_chatImg").appendTo(addTd);
			}else{
				addTd = $('<td></td>').text(msg).addClass("my-bubble2 bubble").appendTo(addTr);			
			}
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);			
		}
		
		// 상대방 채팅
		function opponent_reloadChat(index, name, msg, time, status) {
			var firstDiv = $(".chatLine").first();
			var contentDiv;
			if(firstDiv.length == 0){
				contentDiv = $("<div></div>").addClass("chatLine").appendTo("#chat_box");
			}else{
				contentDiv = $("<div></div>").addClass("chatLine").insertBefore(firstDiv);
			}
			
			var tableChat = $("<table></table>").addClass("opponentChat_table")
					.appendTo(contentDiv);
			var firstTr = $("<tr></tr>").appendTo(tableChat);
			var secondTr = $("<tr></tr>").appendTo(tableChat);
			var imgTd = $("<td></td>").attr("rowspan", "2").appendTo(firstTr)
					.addClass("img-align");
			var img = $('<img>').attr("src", "resources/img/ex22.jpg")
					.addClass("chatImg-box").appendTo(imgTd);
			var nameTd = $("<td></td>").text(name).attr("colspan", "2")
					.addClass("name-box").appendTo(firstTr);
			var addTd;
			if(status == 'Y'){
				addTd = $("<td></td>").appendTo(secondTr);
				$('<img>').attr("src", "resources/chatImg/"+msg).addClass("opponent_chatImg").appendTo(addTd);
			}else{
				addTd = $("<td></td>").text(msg).addClass("opponent-bubble bubble").appendTo(secondTr);	
			}
			var timeTd = $('<td></td>').text(time).addClass("send_time opponent").appendTo(secondTr);
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}
		
		// 상대방이 연속으로 채팅 시
		function opponent_reloadChat2(index, msg, status) {
			var tableChat = $(".chatLine").first().children(
					".opponentChat_table");
			var addTr = $('<tr></tr>').appendTo(tableChat)
			// tr의 갯수를 파악하여 rowspan을 한다.
			tableChat.children("tr").find(".img-align").attr("rowspan",
					tableChat.children("tr").length);
			tableChat.children("tr").find(".send_time").attr("rowspan",
					tableChat.children("tr").length);
			var addTd;
			if(status == 'Y'){
				addTd = $('<td></td>').appendTo(addTr);
				$('<img>').attr("src", "resources/chatImg/"+msg).addClass("opponent_chatImg").appendTo(addTd);
			}else{
				addTd = $('<td></td>').text(msg).addClass("opponent-bubble2 bubble").appendTo(addTr);
			}
			$("<input>").attr({"type" : "hidden", "name":"crId", "id":index}).appendTo(addTd);
		}
	</script>
	<!-- 이미지 및 신고 모달 -->
	<script type="text/javascript">
		$(document).on("click", "chatImg-box img", function(){
			$("#chatIdModal").css("display","block");
		});
		/* 모달 content의 안쪽을 제외한 다른부분 클릭시 닫히게 */
		$(document).on("click", "chatModal div", function(){
			if($(".chatModal").child){
				
			}
		});
		
		var position = 1;	/* 현재 이미지 번호 */
		var imgLength = $(".innerImgDiv").length;
		/* 이전 사진 slideImg1 slideChatImgDiv*/
		function backImg(){
			$("#slideImg"+position).removeClass("activeImg");
			$(".innerImgDiv:nth-child("+position+")").removeClass("active");
			if(position == 1){
				position = imgLength;
			}else{
				position = position -1;
			}
			$("#slideImg"+position).addClass("activeImg");
			$(".innerImgDiv:nth-child("+position+")").addClass("active");
		}
		/* 다음 사진 */
		function nextImg(){
			$("#slideImg"+position).removeClass("activeImg");
			$(".innerImgDiv:nth-child("+position+")").removeClass("active");
			if(position == imgLength){
				position = 1;
			}else{
				position = position +1;
			}
			$("#slideImg"+position).addClass("activeImg");
			$(".innerImgDiv:nth-child("+position+")").addClass("active");
		}
		/* 모달 닫기 */
		function closeModal(){
			$("#chatIdModal").css("display", "none");
			$("#userImgModal").removeClass("declar");
			$("#userDeclarModal").addClass("declar");
			$("#r_Type").val("");
		}
		/* 신고 div로 전환 */
		function declarUser(){
			$("#userImgModal").addClass("declar");
			$("#userDeclarModal").removeClass("declar");
		}
		var deCate = 0;
		function declarCategory(cate){
			if(deCate != cate){
				$(".declarCategory:nth-child("+deCate+")").css("background-color", "white");
			}
			$(".declarCategory:nth-child("+cate+")").css("background-color", "#f2f2f2");
			$("#r_Type").val(cate);
			deCate = cate;
		}
		/* 신고 */
		function declarSendUser(){
			if($("#r_Type").val() != ""){
				$.ajax({
					url:"declarUser.do",
					type:"post",
					/* u_Mid와 r_user_Id 넣기 */
					data:{r_Type:$("#r_Type").val(), r_Contents:$("#declarMsg").val()},
					success:function(data){
						if(success){
							window.close();
						}
					}
				});				
			}
		}
	</script>
</body>
</html>
