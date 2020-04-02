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
	<title>메뉴 관리</title>
	
	<style type="text/css">
			li {
				list-style: none;
				padding: 6px;
				font-size: 12px;
				border-bottom: 1px solid #D2D2D2;
			}
			
			a{
				color:black;
			}
			
			a:hover{
				text-decoration: none;
			}
		
			.header {
				height:55px;
				display:block;
				position:relative;
				border-bottom:3px solid black;
				clear:both;
			}
			.left {
				float:left;
				display:block;
				font-size:40px;
				margin-left:10px;
			}
			.right {
				float:right;
				display:block;
				font-size:18px;
				line-height:55px;
				margin-right:15px;
			}
			#menuWrap{
				float:left;
				width:100%;
			}
			
			.menuList{
				display:inline-block;
				float:left;
				width:48%;
			}
			
			#listBox{
				overflow:scroll;
				overflow-x:hidden;
				height: 600px;
				border-top: 2px solid black;
				border-bottom: 1px solid black;
				padding: 0px;
			}
			
			.menuInfo{
				display:inline-block;
				float:right;
				width:50%;
				height:650px;
			}
			
			#menuClick tr{
				border-bottom:1px solid #E2E2E2;
				height:50px;
			}
			
			#menuClick td:first-child{
				width:25%;
				background-color: #F2F2F2;
			}
			
			#menuClick td:last-child{
				width:300px;
				padding-left:10px;
			}
			
			#menuName{
				width:200px;
			}
			
			#menuExplain{
				width:250px;
			}
			
			#UMCode{
				width:150px;
			}
			
			#useYn{
				width:100px;
			}
			
			#infoFShow{
				height:30px;
				background-color:#F2F2F2;
			}
			
			#infoFText{
				display:block;
				text-align:center;
				vertical-align:middle;
				line-height:30px;
				font-size:12px;
				font-weight:bold;
			}
			
			#infoFShow, #menuClick{
				border-top:1px solid black;
			}
			
			#tdCenter{
				text-align:center;
				vertical-align:middle;
				font-size:13px;
				font-weight:bold;
			}
			
			.button{
				float:right;
			}
	</style>
		
	<script>
		$(document).ready(function(){
			$("#new").click(function(){
				$("#infoFShow").css("display","none");
				$("#menuClick").css("display","block");
				
				$("#UMCode").val("").prop("selected","selected");
				$("#menuName").val("");
				$("#menuCode").val("");
				$("#menuExplain").val("");
				$("#useYn").val("Y").prop("selected","selected");
			});
			
			$("#delete").click(function(){
				if($("#menuClick").css("display") == "none"){
					alert("삭제할 메뉴가 없습니다. 메뉴를 선택해주세요.");
					return false;
				}
				else{
					if(confirm("정말 삭제하시겠습니까?")){
						if($("#menuName").val() == "" || $("#menuCode").val() == "" || $("#menuExplain").val() == ""){
							alert("메뉴정보에 해당하는 게시판이 존재하지 않습니다. 다시 확인하여 주십시오.");
							return false;
						}
						else if($("#menuCode").val() != null || $("#menuCode").val() != ""){
							$("#listForm").prop("action","/MenuManage/delete");
							$("#listForm").submit();
						}
					}
					else
						return false;
				}
			});
			
			$("#save").click(function(){
				var menuCode = $("#menuCode").val();
				var temp = 0;
				
				if($("#menuClick").css("display") == "none"){
					return false;
				}
				
				if(menuCode != null && menuCode != ""){
					$("#listForm").prop("action","/MenuManage/update");
				}
				else{
					if($("#menuName").val() == null || $("#menuName").val() == ""){
						alert("메뉴명을 입력해 주십시오.");
						return false;
					}
					
					<c:forEach items="${list}" var="list">
						if($("#menuName").val() == "${list.MENU_NAME}"){
							alert("같은 이름의 메뉴가 존재합니다.");
							return false;
						}
					</c:forEach>
					
					if($("#menuExplain").val() == null || $("#menuExplain").val() == ""){
						alert("메뉴에 대한 설명을 입력하여 주십시오.");
						return false;
					}
					
					if($("#UMCode").val() != null && $("#UMCode").val() != ""){
						var upc = $("#UMCode").val();
						var temp2 = 0;
						var index = 0;
						
						<c:forEach items="${list}" var="list">
							index = parseInt("${list.MENU_CODE}"/1000);
							
							if(index == parseInt(upc / 1000)){
								temp2 = "${list.MENU_CODE}";
								
								if(parseInt("${list.MENU_CODE}" % 1000) == 0){
									temp = "${list.MENU_CODE}";
								}
								else{
									if(temp < temp2){
										temp = temp2;
									}
								}
							}	
						</c:forEach>
						temp = parseInt(temp);
						$("#menuCode").val(parseInt(temp + 1));
					}
					else{
						<c:forEach items="${upList}" var="upList">
							if(temp < "${upList.MENU_CODE}"){
								temp = "${upList.MENU_CODE}";
							}
						</c:forEach>
						
						temp = parseInt(temp);
						temp = temp + 1000; 
						
						$("#menuCode").val(temp);
					}
					$("#listForm").prop("action","/MenuManage/insert");
				}
				
				$("#listForm").submit();
			});
		});
	
		function MenuInfo(MenuCode){
			$("#infoFShow").css("display","none");
			$("#menuClick").css("display","block");
			
			<c:forEach items="${list}" var="list">
				if("${list.MENU_CODE}" == MenuCode){
					$("#menuName").val("${list.MENU_NAME}");
					$("#menuCode").val("${list.MENU_CODE}");
					$("#menuExplain").val("${list.MENU_EXPLAIN}");
					$("#useYn").val("${list.USE_YN}").prop("selected","selected");
					$("#UMCode").val("${list.UPPER_MENU_CODE}").prop("selected","selected");
					//alert(($("#menuCode").val()/1000).toFixed());
				}
			</c:forEach>
		}
	</script>
</head>
<body>
	<div class=container>
		<div class="header">
			<span class="left">메뉴 관리</span>
			<span class="right"><span class="glyphicon glyphicon-home"></span>&nbsp;시스템 관리 > 메뉴 관리</span>
		</div>
		<div id="menuWrap">
			<div class="menuList">
				<form role="form" method="get">
					<h4>ㆍ전체 메뉴 목록</h4>
					<ul id="listBox">
						<c:forEach items="${list}" var="list">
							<a href="#" onclick="MenuInfo('${list.MENU_CODE}'); return false;">
								<c:choose>
									<c:when test="${empty list.UPPER_MENU_CODE}">
										<li style="background-color:#E2E2E2">
											<p style="font-weight:bold; margin:0px;">ㆍ<c:out value="${list.MENU_NAME}"/></p>
										</li>
									</c:when>
									<c:otherwise>
										<li>&nbsp;↳ <c:out value="${list.MENU_NAME}"/></li>
									</c:otherwise>
								</c:choose>
							</a>
						</c:forEach>
					</ul>
				</form>
			</div>
			<form role="form" method="post" id="listForm">
				<div class="menuInfo">
					<h4>ㆍ메뉴 정보</h4>
					<div id="infoWrap">
						<div id="infoFShow">
							<span id="infoFText">메뉴를 선택해 주세요.</span>
						</div>
						<table id="menuClick" style="display:none">
							<tr>
								<td class="active" id="tdCenter">상위메뉴</td>
								<td>
									<select name="UPPER_MENU_CODE" id="UMCode" class="form-control">
										<option value="">없음</option>
										<c:forEach items="${upList}" var="list">
											<option value="${list.MENU_CODE}"><c:out value="${list.MENU_NAME}"/></option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td class="active" id="tdCenter">메뉴명</td>
								<td>
									<input type="text" name="MENU_NAME" id="menuName" class="form-control" value="${MENU_NAME}"/>
									<input type="hidden" name="MENU_CODE" id="menuCode" class="form-control"/>
								</td>
							</tr>
							<tr>
								<td class="active" id="tdCenter">메뉴설명</td>
								<td><input type="text" name="MENU_EXPLAIN" id="menuExplain" class="form-control"/></td>
							</tr>
							<tr>
								<td class="active" id="tdCenter">사용여부</td>
								<td>
									<select name="USE_YN" id="useYn" class="form-control">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="button">
					<button type="button" name="신규" id="new" class="btn btn-default">신규</button>
					<button type="button" name="삭제" id="delete" class="btn btn-default">삭제</button>
					<button type="button" name="저장" id="save" class="btn btn-default">저장</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>