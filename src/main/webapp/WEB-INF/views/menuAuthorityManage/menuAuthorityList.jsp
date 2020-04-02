<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<title>메뉴 권한 관리</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
 		<style type="text/css">
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
			.top {
				display:block;
				margin: 10px 0px 10px 0px;
				height: 55px;
				border-bottom: 3px dashed gray;
			}
			.select {
				width: 150px;
			}
 			#leftDiv {
 				width: 45%; 
 				float: left
 			}
 			#subLeftDiv {
 				border-style:solid;
 				border-color:#cecece;
 				overflow:auto;
 				height:500px;
 			}
 			#centerDiv {
 				width: 10%; 
 				float: left; 
 				height:500px;
 				text-align:center;
 				margin: 200px 0px 0px 0px;
 				
 			}
 			#rightDiv {
 				width: 45%; 
 				float: left
 			}
 			#subRightDiv {
 				border-style:solid;
 				border-color:#cecece;
 				overflow:auto;
 				height:500px;
 			}
 			thead{
 				background-color: #cecece;
 			}
 			
		</style>
	</head>
	<script>
		$(document).ready(function(){
			
			/* 사용자 그룹 선택  START*/
			$("#gList").on("change", function(){
				$("#RESULT_GROUP_NO").attr("value", $("#gList option:selected").val());
				var listForm = $("#listForm");
				listForm.attr("action", "/menuAuthorityManage/menuAuthorityList");
				listForm.attr("method", "GET");
				listForm.submit();
			})
			/* 사용자 그룹 선택  END */
			
			/* 권한없는 메뉴 전체선택START */
			$("#menuAll_N").on("click", function(){
				if($("#menuAll_N").prop("checked")==true){
					$("tr[id^='a'] input[type='checkbox']").prop("checked", true);
				}else if($("#menuAll_N").prop("checked")==false){
					$("tr[id^='a'] input[type='checkbox']").prop("checked", false);
				}
			})
			/* 권한없는 메뉴 전체선택END */
			
			/* 권한있는 메뉴 전체선택START */
			$("#menuAll_Y").on("change", function(){
				$("tr[id^='b'] input[type='checkbox']").prop("checked", $(this).prop("checked"));
				
			})
			/* 권한있는 메뉴 전체선택END */
			
			/* 권한추가  START*/
			$(document).on("click", "#addBtn", function(){
							
				$("input:checkbox[name=MENU_CODE]:checked").each(function(index){
					var addArrayParam = new Array();
					var chkLeftNo = $(this).attr("id").substr(9);
					var tdLeft;
					
					$("#authN_Chk"+chkLeftNo).attr("id", "authY_Chk"+chkLeftNo);
					$("label[for='authN_Chk"+chkLeftNo+"']").attr("for", "authY_Chk"+chkLeftNo);
					$("#authY_Chk"+chkLeftNo).attr("data-yn", "I");
					
					tdLeft = $(this).parent().parent().children().detach();
					$("#b"+chkLeftNo).html(tdLeft);
					$(this).prop("checked", false);
					$("#menuAll_N").prop("checked", false);
				});
			})
			/* 권한추가  END*/
			
			/* 권한삭제  START*/
			$(document).on("click", "#delBtn", function(){
				
				$("input:checkbox[name=MENU_CODE]:checked").each(function(){
					var delArrayParam = new Array();
					var chkRightNo = $(this).attr("id").substr(9);
					var tdRight;
					
					$("#authY_Chk"+chkRightNo).attr("id", "authN_Chk"+chkRightNo);
					$("#DELETE_MENU_NAME").attr("value", $("label[for='authY_Chk"+chkRightNo+"']").text());
					$("label[for='authY_Chk"+chkRightNo+"']").attr("for", "authN_Chk"+chkRightNo);
					$("#authN_Chk"+chkRightNo).attr("data-yn", "D");
					
					tdRight = $(this).parent().parent().children().detach();
					$("#a"+chkRightNo).html(tdRight);
					$(this).prop("checked", false);
					$("#menuAll_Y").prop("checked", false);
				});
			})
			/* 권한삭제  END*/
			
			/* 적용 버튼 */
			$("#saveBtn").on("click", function(){
				var insertArrayParam = new Array();
				$("input[data-yn='I']").each(function(index){
					insertArrayParam.push($(this).attr("value"));
					$("#INSERT_MENU_CODE").attr("value", insertArrayParam);
				})
				
				var deleteArrayParam = new Array();
				$("input[data-yn='D']").each(function(index){
					deleteArrayParam.push($(this).attr("value"));
					$("#DELETE_MENU_CODE").attr("value", deleteArrayParam);
				})
				
				var groupNo = "${param.GROUP_NO}";
				$("#GROUP_NO").attr("value", groupNo);
				$("#saveForm").attr("method", "POST");
				$("#saveForm").attr("action", "/menuAuthorityManage/menuAuthoritySave");
				$("#saveForm").submit();
			})
		});
	</script>
	<body>
		<div class="container">
			<div class="header">
				<span class="left">메뉴 권한 관리</span>
				<span class="right"><span class="glyphicon glyphicon-home"></span>&nbsp;시스템 관리 > 메뉴 권한 관리</span>
			</div>
			<section id="container">
				<form id="listForm">
					<input type="hidden" id="RESULT_GROUP_NO" name="GROUP_NO" value="">
					<div class="top">
						<label for="GROUP_NAME"></label>
						<select id="gList" class="form-control select">
							<option value="">선택</option>
							<c:forEach items="${groupList}" var="groupList">
								<option value="${groupList.GROUP_NO}"
								<c:if test="${groupList.GROUP_NO == param.GROUP_NO}">selected</c:if>>${groupList.GROUP_NAME}</option>
							</c:forEach>
						</select>
					</div>
				</form>
				<div id="leftDiv">
					<h2>권한이 없는 메뉴</h2>
					<div id="subLeftDiv">
						<table class="table table-hover">
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" style="text-align:center;"><input type="checkbox" id="menuAll_N" /></th>
									<th scope="col">메뉴명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${authorityList}" var="authorityList" varStatus="status">
									<tr id="a${status.index}">
										<c:if test="${empty authorityList.GROUP_NO || empty authorityList.UPPER_MENU_CODE}">
											<td style="text-align:center;">
												<c:if test="${not empty authorityList.UPPER_MENU_CODE}">
													<input type="checkbox" class="chk" id="authN_Chk${status.index}" name="MENU_CODE" value="${authorityList.MENU_CODE}"  data-yn="" />
												</c:if>
											</td>
											<td>
												<c:if test="${empty authorityList.UPPER_MENU_CODE}">
													<label for="authN_Chk${status.index}">${authorityList.MENU_NAME}</label>
												</c:if>
												<c:if test="${not empty authorityList.UPPER_MENU_CODE}">
													<label for="authN_Chk${status.index}" style="font-weight: 500; cursor:pointer">ㄴ${authorityList.MENU_NAME}</label>
												</c:if>
											</td>
										</c:if>											
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="centerDiv">
					<input type="button" id="addBtn" class="btn btn-primary btn-block" value="추가 &gt;&gt;"><br/>
					<input type="button" id="delBtn" class="btn btn-danger btn-block" value="&lt;&lt;삭제"><br/>
					<input type="button" id="saveBtn" class="btn btn-success btn-block" value="적용">
				</div>
				<form id="saveForm">
					<input type="hidden" id="GROUP_NO" name="GROUP_NO" value="">
					<input type="hidden" id="INSERT_MENU_CODE" name="INSERT_MENU_CODE[]" value="">	
					<input type="hidden" id="DELETE_MENU_CODE" name="DELETE_MENU_CODE[]" value="">	
					<input type="hidden" id="DELETE_MENU_NAME" name="DELETE_MENU_NAME" value="">	
				</form>
				<div id="rightDiv">
					<h2>권한이 있는 메뉴</h2>
					<div id="subRightDiv">
						<table class="table table-hover">
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" style="text-align:center;"><input type="checkbox" id="menuAll_Y"/></th>
									<th scope="col">메뉴명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${authorityList}" var="authorityList" varStatus="status">
									<tr id="b${status.index}">
										<c:if test="${not empty authorityList.GROUP_NO || empty authorityList.UPPER_MENU_CODE}">
											<td style="text-align:center;">
												<c:if test="${not empty authorityList.UPPER_MENU_CODE}">
													<input type="checkbox" id="authY_Chk${status.index}" name="MENU_CODE" value="${authorityList.MENU_CODE}" data-yn=""/>
												</c:if>
											</td>
											<td>
												<c:if test="${empty authorityList.UPPER_MENU_CODE}">
													<label for="authY_Chk${status.index}">${authorityList.MENU_NAME}</label>
												</c:if>
												<c:if test="${not empty authorityList.UPPER_MENU_CODE}">
													<label for="authY_Chk${status.index}" style="font-weight: 500; cursor:pointer">ㄴ	${authorityList.MENU_NAME}</label>
												</c:if>
											</td>										
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>