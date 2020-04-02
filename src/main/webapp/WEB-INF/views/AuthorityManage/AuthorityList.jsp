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
	<title>권한관리</title>
	
	<style type="text/css">
		li {
			list-style: none;
			float: left;
			padding: 6px;
			font-size: 15px;
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
		.top {
			display:block;
			margin: 10px 0px 10px 0px;
			height: 55px;
			border-bottom: 3px dashed gray;
		}
		.top-left{
			float:left;
		}
		.top-left div{
			display:inline-block;
		}
		.top-right{
			float:right;
		}
		.select {
			width: 150px;
		}
		#div1 {
			position:relative;
			margin-right:7px;
			width:104px;
			height:25px;
			border-style:none;
		}
		.selectLabel {
			width:104px;
			position:absolute;
			top:0px;
			z-index:1;
			clip:rect(3,200,18,3);
		}
		.result {
			font-size:13px;
			width:100px;
			font-weight:bold;
			border-style:none;
		}
		.bright {
			position:absolute;
			right:0;
		}
		.rightp {
			float:left;
			margin-left:-15px;
			font-size:13px;
			font-weight:bold;
		}
		.rightp span{
			color:red;
		}
		.btm-left{
			float:left;
		}
		.btm-right{
			float:right;
			display:block;
			position:relative;
			width: 200px;
		}
		
		#popup{
			position: fixed;
			width: 100%;
			height: 100%;
			display: none;
			background:rgba(0,0,0,0.8);
		}
		
		#popLayer{
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%,-50%);
			background: #fff;
			width: 410px;
			height: 280px;
			text-align: center;
			border-radius: 5px;
		}
		
		#close{
			cursor: pointer;
		}
		
		#popup2{
			position: fixed;
			width: 100%;
			height: 100%;
			display: none;
			background:rgba(0,0,0,0.8);
		}
		
		#popLayer2{
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%,-50%);
			background: #fff;
			width: 410px;
			height: 280px;
			text-align: center;
			border-radius: 5px;
		}
		
		#close2{
			cursor: pointer;
		}
		
		#pop_top{
			width:100%;
			height:40px;
			background: #00004A;
			text-align: left;
			padding: 10px 0px 0px 10px;
		}
		
		.left_text{
			color: white;
			font-size:15px;
		}
		
		.right-span{
			position:relative;
			font-size:15px;
			right:0px;
		}
		
		#pop_bottom {
			border-collapse: separate;
			border-spacing: 1px;
			text-align: left;
			line-height: 1.5;
			border-top: 1px solid #ccc;
			margin: 5px 0px 10px 5px;
		}
		
		#pop_bottom th{
			width:100px;
			padding:10px;
			font-size:13px;
			font-weight:bold;
			vertical-align:middle;
			border-bottom: 1px solid #ccc;
			background: #efefef;
		}
		
		#pop_bottom td{
			width:300px;
			padding: 10px;
			vertical-align: top;
			border-bottom: 1px solid #ccc;
		}
	</style>
	
	<script>
		$(document).ready(function(){
			$("#upLoad").click(function(){
				$("#popup").fadeIn();
				$("#rightView").css("display","none");
				$(".rightp").css("display","none");
			});
			
			$("#close").click(function(){
				$("#popup").fadeOut();
				setTimeout(function(){
					$("#rightView").css("display","inline-block");
					$(".rightp").css("display","inline-block");
				}, 300);
				
			});
			
			$("button[id=close]").click(function(){
				$("#popup").fadeOut();
				$("#pop_bottom #group_pop").prop("value","");
				$("#FirstScreenMenu").find('option:first').attr('selected', 'selected');
				setTimeout(function(){
					$("#rightView").css("display","inline-block");
					$(".rightp").css("display","inline-block");
				}, 300);
			});
			
			$("#FirstScreenMenu").change(function(){
				var val = $("#FirstScreenCode");
				var element = $(this).find('option:selected').val();
				<c:forEach items="${menuList}" var="menuList">
					if("${menuList.MENU_NAME}" == element){
						val.val("${menuList.MENU_CODE}");
					}
				</c:forEach>
			});
			
			
			$("button[id=update]").click(function(){
				$("#popup2").fadeIn();
				$("#rightView").css("display","none");
				$(".rightp").css("display","none");
				var groupNo = $(this).val();
				var groupName = $("input[name=GROUP_NAME]");
				var groupEx = $("input[name=GROUP_EXPLAIN]");
				
				<c:forEach items="${list}" var="list">
					if("${list.GROUP_NO}" == groupNo)
					{
						groupName.val("${list.GROUP_NAME}");
						groupEx.val("${list.GROUP_EXPLAIN}");
						$("#group_no").val(groupNo);
						$("#FirstScreenCode2").val("${list.FIRST_SCREEN_CODE}");
						$("#FirstScreenMenu2").val("${list.FIRST_SCREEN}").prop("selected","selected");
					}
				</c:forEach>
			});
			
			$("span[id=close2]").click(function(){
				$("#popup2").fadeOut();
				setTimeout(function(){
					$("#rightView").css("display","inline-block");
					$(".rightp").css("display","inline-block");
				}, 300);
				
			});
			
			$("button[id=close2]").click(function(){
				$("#popup2").fadeOut();
				$("#pop_bottom #group_pop").prop("value","");
				$("#FirstScreenMenu2").find('option:first').attr('selected', 'selected');
				setTimeout(function(){
					$("#rightView").css("display","inline-block");
					$(".rightp").css("display","inline-block");
				}, 300);
			});
			
			$("button[id=search]").click(function(){
				/* self.location = "AuthorityList" + "${pageMaker.makeSearch(1)}" + "&searchType=" + $("select[name=SearchName] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()); */
				var Amount = $("select[id=rightView]").find("option:selected").val();
				
				if(Amount == 20){
					self.location = "AuthorityList" + "${pageMaker.makeQuery(1)}" + "&perPageNum="+Amount+ "&searchType=" + $("select[name=SearchName] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());	
				}
				else if(Amount == 30){
					self.location = "AuthorityList" + "${pageMaker.makeQuery(1)}" + "&perPageNum="+Amount+ "&searchType=" + $("select[name=SearchName] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());	
				}
				else{
					self.location = "AuthorityList" + "${pageMaker.makeQuery(1)}" + "&perPageNum="+Amount+ "&searchType=" + $("select[name=SearchName] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());	
				}
			});
			
			$("select[id=rightView]").change(function(){
				var Amount = $(this).find("option:selected").val();
				self.location = "AuthorityList" + "${pageMaker.makeQuery(1)}" + "&perPageNum="+Amount+ "&searchType=" + $("select[name=SearchName] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());	
			});
		});
	</script>
</head>
<body>
	<div id="popup">
		<div id="popLayer">
			<form role="form" method="post" id="group_insert" action="/AuthorityManage/write">
				<div id="pop_top">
					<label class="left_text">그룹 등록</label>
					<span id="close" class="right_span glyphicon glyphicon-remove-sign"></span>
				</div>
				<table id="pop_bottom">
					<tr>
						<th scope="row">그룹명</th>
						<td><input type="text" name="GROUP_NAME" id="group_pop" class="group_name form-control" /></td>
					</tr>
					<tr>
						<th scope="row">그룹설명</th>
						<td><input type="text" name="GROUP_EXPLAIN" id="group_pop" class="group_explain form-control" /></td>
					</tr>
					<tr>
						<th scope="row">첫화면메뉴</th>
						<td>
							<select name="FIRST_SCREEN" id="FirstScreenMenu" class="FirstScreenMenu form-control">
								<option value="">선택</option>
								<c:forEach items="${menuList}" var="menuList">
									<option value="${menuList.MENU_NAME}"><c:out value="${menuList.MENU_NAME}"/></option>
								</c:forEach>
							</select>
							<input type="hidden" name="FIRST_SCREEN_CODE" id="FirstScreenCode"/>
						</td>
					</tr>
				</table>
				<div class="button_class">
					<button type="submit" name="저장" id="save" class="btn btn-default">저장</button>
					<button type="button" name="닫기" id="close" class="btn btn-default">닫기</button>
				</div>
			</form>
		</div>
	</div>
	
	
	
	
	<div id="popup2">
		<div id="popLayer2">
			<form role="form" method="post" id="group_update" action="/AuthorityManage/update">
				<div id="pop_top">
					<label class="left_text">그룹 수정</label>
					<span id="close2" class="right_span glyphicon glyphicon-remove-sign"></span>
				</div>
				<table id="pop_bottom">
					<tr>
						<th scope="row">그룹명</th>
						<td><input type="text" name="GROUP_NAME" id="group_pop" class="group_name form-control" /></td>
					</tr>
					<tr>
						<th scope="row">그룹설명</th>
						<td><input type="text" name="GROUP_EXPLAIN" id="group_pop" class="group_explain form-control" /></td>
					</tr>
					<tr>
						<th scope="row">첫화면메뉴</th>
						<td>
							<select name="FIRST_SCREEN" id="FirstScreenMenu2" class="FirstScreenMenu form-control">
								<option value="">선택</option>
								<c:forEach items="${menuList}" var="menuList">
									<option value="${menuList.MENU_NAME}"><c:out value="${menuList.MENU_NAME}"/></option>
								</c:forEach>
							</select>
							<input type="hidden" name="FIRST_SCREEN_CODE" id="FirstScreenCode2"/>
							<input type="hidden" name="GROUP_NO" id="group_no"/>
						</td>
					</tr>
				</table>
				<div class="button_class">
					<button type="submit" name="저장" id="save2" class="btn btn-default">저장</button>
					<button type="button" name="닫기" id="close2" class="btn btn-default">닫기</button>
				</div>
			</form>
		</div>
	</div>
	<div class=container>
		<div class="header">
			<span class="left">권한 관리</span>
			<span class="right"><span class="glyphicon glyphicon-home"></span>&nbsp;시스템 관리 > 권한 관리</span>
		</div>
		<div class="top">
			<div class="top-left">
				<div>
					<select name="SearchName" class="form-control select">
						<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="gName"<c:out value="${scri.searchType eq 'gName' ? 'selected' : ''}"/>>그룹명</option>
						<option value="fScreen"<c:out value="${scri.searchType eq 'fScreen' ? 'selected' : ''}"/>>첫화면메뉴</option>
						<option value="writer"<c:out value="${scri.searchType eq 'writer' ? 'selected' : ''}"/>>등록자</option>
						<option value="mfWriter"<c:out value="${scri.searchType eq 'mfWriter' ? 'selected' : ''}"/>>수정자</option>
					</select>
				</div>
				<div>
					<input type="text" name="keyword" id="keywordInput" class="form-control keywordInput" value=""/> 
				</div>
			</div>
			<div class="top-right">
				<button type="button" name="검색" id="search" class="btn btn-default">조회</button>
			</div>
		</div>
		<div class="bottom">
			<div class="bottom-top">
				<div class="btm-left">
					<button type="button" name="등록" id="upLoad" class="btn btn-default">등록</button>
				</div>
				<div class="btm-right">
					<p class="rightp">검색결과 <span><c:out value="${pageMaker.totalCount}" />&nbsp;개</span> | </p>
					<div class="bright">
						<form role="form" method="post" id="Amount" action="AuthorityList">
							<div id="div1">
								<label class="selectLabel">
									<select name="SearchResult" id="rightView" class="result">
										<option value="10"<c:out value="${pageMaker.cri.perPageNum eq 10 ? 'selected' : ''}"/>>10개씩 보기</option>
										<option value="20"<c:out value="${pageMaker.cri.perPageNum eq 20 ? 'selected' : ''}"/>>20개씩 보기</option>
										<option value="30"<c:out value="${pageMaker.cri.perPageNum eq 30 ? 'selected' : ''}"/>>30개씩 보기</option>
									</select>
								</label>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="bottom-btm">
				<form role="form" method="get">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">그룹명</th>
								<th scope="col">첫화면메뉴</th>
								<th scope="col">등록자</th>
								<th scope="col">등록일</th>
								<th scope="col">수정자</th>
								<th scope="col">수정일</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td><c:out value="${list.GROUP_NAME}" /></td>
									<td><c:out value="${list.FIRST_SCREEN}" /></td>
									<td><c:out value="${list.AUTH_WRITER}" /></td>
									<td><fmt:formatDate value="${list.AUTH_REGDATE}" pattern="yyyy-MM-dd"/></td>
									<td><c:out value="${list.AUTH_MFWRITER}" /></td>
									<td><fmt:formatDate value="${list.AUTH_MODIFYDATE}" pattern="yyyy-MM-dd"/></td>
									<td><button type="button" name="수정" id="update" class="btn btn-default" value="${list.GROUP_NO}">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="text-align:center">
						<ul style="display:inline-block">
							<c:if test="${pageMaker.prev}">
								<li><a href="AuthorityList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li><a href="AuthorityList${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="AuthorityList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>