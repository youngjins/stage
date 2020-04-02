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
					<form role="form" method="post" autocomplete="off">
						<table id="login">
							<tbody>
								<tr>
									<td id="text">ID</td>
									<td><input type="text" name="ADMIN_ID" id="adminId" class="form-control"/></td>
									<td rowspan="2"><button type="submit" id="loginSubmit" class="btn btm-default">로그인</button></td>
								</tr>
								<tr>
									<td id="text">Password</td>
									<td><input type="password" name="ADMIN_PWD" id="ADMIN_PWD" class="form-control"/></td>
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