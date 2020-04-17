<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 로그인 페이지</title>
	<style>
		#wrap {
			position:absolute;
			border:2px solid #005282;
			width:800px;
			height:500px;
			border-radius: 10px;
			margin: 0 auto;
			top: 21%;
			left: 29%;
			box-shadow: 0px 2px #005282;
		}
		
		#header {
			height:42%;
			border-top:5px solid #005282;
			border-top-left-radius: 8px;
			border-top-right-radius: 8px;
			background-clip: border-box;
			background-image: url("/resources/css/images/login.jpg");
			background-repeat: no-repeat;
			background-size:cover;
			background-position: center;
			overflow:hidden;
		}
		
		#logo {
			position:absolute;
			top:4%;
			right:4%;
			float:right;
		}
		
		#contents {
			height: 50%;
			background-color: #5e7e9b;
		}
		
		#center{
			padding-top:25px;
			text-align:center;
			color:white;
		}
		
		#login {
			margin: 0 auto;
			border-collapse: separate;
			border-spacing: 10 10px;
		}
		
		#text {
			text-align:right;
			font-weight:bold;
		}
		
		#loginSubmit{
			width:100px;
			height:80px;
			color:#dc143c;
			background: linear-gradient(#f1f1f1 0%, #fff 2px, #eee 100%);
			outline:none;
		}
		
		#loginSubmit:hover{
			background: linear-gradient(#ccc 0%, #f1f1f1 2px, #e1e1e1 100%);
		}
		
		#loginSubmit:active{
			background: linear-gradient(#bbb 0%, #e1e1e1 2px, #d1d1d1 100%);
		}
		
		#saveChk{
			font-weight:bold;
			font-size:14px;
			color:white;
		}
		
		#footer {
			height:8%;
			background-color: #437299;
			border-bottom-left-radius: 8px;
			border-bottom-right-radius: 8px;
			color:white;
			font-size:11px;
			font-family:"Fixedsys";
			text-align:center;
			line-height:42px;
			vertical-align:middle;
		}
	</style>
	
	<script>
		$(document).ready(function(){
			
			var key = getCookie("key");
			$("input[id=adminId]").val(key);
			
			if($("input[id=adminId]").val() != ""){
				$("#idSave").attr("checked", true);
			}
			
			$("#idSave").change(function(){
				if($("#idSave").is(":checked")){
					setCookie("key", $("input[id=adminId]").val(), 7);
				}
				else{
					deleteCookie("key");
				}
			});
			
			$("input[id=adminId]").keyup(function(){
				var value = $(this).val();
				var length = 20;
				
				if($("#idSave").is(":checked")){
					setCookie("key", $("input[id=adminId]").val(), 7);
				}
				
				if(checkSpecial(value) && value != null && value != ""){
					alert("특수문자는 입력하실 수 없습니다.");
					$(this).val("");
					return false;
				}else if(checkSpace(value)){
					alert("공백을 입력하실 수 없습니다.");
					$(this).val("");
					return false;
				}else if(value.length > length){
					alert("아이디는 " + length + "글자 이내여야 합니다.");
					$(this).val(value.substring(0, parseInt(length)));
					return false;
				}
				else{
					return true;
				}
			});
			
			$("input[id=adminPwd]").keyup(function(){
				var value = $(this).val();
				
				if(checkSpace(value)){
					alert("공백은 입력할 수 없습니다.");
					$(this).val(value.replace(/(\s*)/g,""));
					return false;
				}else{
					return true;
				}
			});
			
			$("button[id=loginSubmit]").click(function(){
				var idVal = $("input[id=adminId]").val();
				var pwVal = $("input[id=adminPwd]").val();
				
				if(idVal == null || idVal == "" || pwVal == null || pwVal == ""){
					alert("아이디 또는 패스워드를 입력하여 주십시오.");
					return false;
				}else{
					$("#loginForm").prop("action","/LoginPage/LoginSend");
					$("#loginForm").submit();
				}
			});
		});
		
		function checkSpace(str) {
			if(str.search(/\s/) != -1) {
				return true;
			} else {
				return false;
			}
		}
		
		function checkSpecial(str) {
			var special_pattern = /[\uAC00-\uD7A3xfe0-9a-zA-Z\\s]/gi;
			
			if(special_pattern.test(str) == true){
				return false;
			} else {
				return true;
			}
		}
		
		function checkPasswordPattern(str) {
			var pattern1 = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
			
			if(!pattern1.test(str)){
				return false;
			} else {
				return true;
			}
		}
		
		function setCookie(cookieName, value, exdays){
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookie = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}
		
		function deleteCookie(cookieName){
			var expireDate = new Date();
			
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		
		function getCookie(cookieName) {
			cookieName = cookieName + "=";
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			
			if(start != -1){
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			
			return unescape(cookieValue);
		}
	</script>
</head>
<body>
	<div class="container">
		<div id="wrap" class="wrap">
			<div id="header">
				<span id="logo"><img src="/resources/css/images/logo.png"></span>
			</div>
			<div id="contents">
				<div id="center">
					<p>로그인이 필요한 서비스입니다. 아이디와 비밀번호를 입력하여 주십시오.</p>
					<form role="form" method="post" id="loginForm" autocomplete="off">
						<table id="login">
							<tbody>
								<tr>
									<td id="text">ID</td>
									<td><input type="text" name="ADMIN_ID" id="adminId" class="form-control"/></td>
									<td rowspan="2"><button type="submit" id="loginSubmit" class="btn btm-default">로그인</button></td>
								</tr>
								<tr>
									<td id="text">Password</td>
									<td><input type="password" name="ADMIN_PWD" id="adminPwd" class="form-control"/></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">
										<label id="saveChk" class="checkbox-inline"><input type="checkbox" name="ID_SAVE" id="idSave inlineCheckbox1"/>아이디 저장</label>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div id="footer">
				<p>copyright(c)GnSoft.INC, All Right Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>