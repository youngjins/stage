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
		<title>공지사항 관리</title>
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
		</style>
	</head>
	<script>
		$(document).ready(function(){
			$('#searchBtn').click(function() {
				 self.location = "noticeList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			 });
			/* 등록관련  START*/
		    $("#writeBtn").click(function(){
				$("#writeModal").modal();
		    });
			var addArrayParam = new Array();
		    $(document).on("change","#insertMenu" , function(){
		    	var menuSelectVal = $("#insertMenu option:selected").val();
		    	for(var i=0; i<addArrayParam.length; i++){
		    		$("#"+addArrayParam[i]).remove();
		    		
		    	}
		    	<c:forEach items="${MENU_LIST}" var="MENU_LIST" varStatus="status">
					if(menuSelectVal == '${MENU_LIST.UPPER_MENU_CODE}' && menuSelectVal != ''){
						$("#insertSubMenu").append('<option id="insertMenuName${status.index}" value="${MENU_LIST.MENU_CODE}"><c:out value="${MENU_LIST.MENU_NAME}" /></option>');
						addArrayParam.push($("#insertMenuName${status.index}").attr("id"));
					}
				</c:forEach>
		    })
    		$(document).on("click", "#insertBtn", function(){
	    		for(var i=0; i<$(".wChk").length; i++){
	    			if($(".wChk").eq(i).prop("value")==""){
	    				alert($(".wChk").eq(i).attr("title")+" 입력해주세요.");
	    				return false;
	    			}
	    		}
	    		if($("#insertSubMenu option:selected").attr("value")==""){
	    			alert("메뉴를 선택해주세요.");
	    			return false;
	    		}
	    		
	    		var writeForm = $("#writeForm");
				$("#writeMenuCode").attr("value", $("#insertSubMenu option:checked").val());
				writeForm.attr("action", "/noticeManage/noticeWrite");
				writeForm.attr("method", "POST");
				writeForm.submit();
		    })
	    	$(document).on("click", ".writeClose", function(){
				for(var i=0; i<updateArrayParam.length; i++){
			  	  $("#"+updateArrayParam[i]).remove();
			    }
				$("#writeForm").each(function() {  
				    this.reset();  
		        });
			})
		    /* 등록관련  END*/
		    
		    /* 수정 관련  START*/
		    var updateArrayParam = new Array();
		    $(document).on("click", "#updateBtn", function(){
		    	$("#updateModal").modal();
		    	$("#updateNoticeNo").attr("value", $(this).attr("data-no"));
		    	$("#updateNoticeTitle").attr("value", $(this).attr("data-title"));
		    	$("#updateNoticeContent").attr("value", $(this).attr("data-content"));
		    	$("#updateMenu option[value="+$(this).attr("data-upperCode")+"]").attr("selected", "selected");
					<c:forEach items="${MENU_LIST}" var="MENU_LIST" varStatus="status">
						if($("#updateMenu option:selected").val() == '${MENU_LIST.UPPER_MENU_CODE}' && $("#updateMenu option:selected").val() != ''){
							$("#updateSubMenu").append('<option id="updateMenuName${status.index}" value="${MENU_LIST.MENU_CODE}"><c:out value="${MENU_LIST.MENU_NAME}" /></option>');
							updateArrayParam.push($("#updateMenuName${status.index}").attr("id"));
						}
					</c:forEach>
	    			$("#updateSubMenu option[value="+$(this).attr("data-menuCode")+"]").attr("selected", "selected");
		    })
			$(document).on("click", ".updateClose", function(){
				  for(var i=0; i<updateArrayParam.length; i++){
			    		$("#"+updateArrayParam[i]).remove();
			      }
				  $("#updateForm").each(function() {  
			            this.reset();  
		         });
			})		  
		    $(document).on("change","#updateMenu" , function(){
		    	  for(var i=0; i<updateArrayParam.length; i++){
			    		$("#"+updateArrayParam[i]).remove();
			      }
		    	<c:forEach items="${MENU_LIST}" var="MENU_LIST" varStatus="status">
				if($("#updateMenu option:selected").val() == '${MENU_LIST.UPPER_MENU_CODE}' && $("#updateMenu option:selected").val() != ''){
					$("#updateSubMenu").append('<option id="updateMenuName${status.index}" value="${MENU_LIST.MENU_CODE}"><c:out value="${MENU_LIST.MENU_NAME}" /></option>');
					updateArrayParam.push($("#updateMenuName${status.index}").attr("id"));
				}
				</c:forEach>
		    })
		    $("#saveBtn").on("click", function(){
		    	for(var i=0; i<$(".uChk").length; i++){
	    			if($(".uChk").eq(i).prop("value")==""){
	    				alert($(".uChk").eq(i).attr("title")+" 입력해주세요.");
	    				return false;
	    			}
	    		}
	    		if($("#updateSubMenu option:selected").attr("value")==""){
	    			alert("메뉴를 선택해주세요.");
	    			return false;
	    		}
		    	
	    		var updateForm = $("#updateForm");
	    		$("#updateMenuCode").attr("value", $("#updateSubMenu option:checked").val());
	    		updateForm.attr("action", "/noticeManage/noticeUpdate");
	    		updateForm.attr("method", "POST");
	    		updateForm.submit();
	    	})
		    /* 수정 관련 END*/
		    
		    /* 삭제 관련 START*/
		    $(document).on("click", "#deleteBtn", function(){		    	
		    	var confirmMsg = "삭제하시겠습니까?";
		    	var deleteForm = $("#listForm");
		    	if(confirm(confirmMsg) == true){
		    		$("#deleteNoticeNo").attr("value", $(this).attr("value"));
			    	deleteForm.attr("action", "/noticeManage/noticeDelete");
			    	deleteForm.attr("method", "post");
			    	deleteForm.submit();	
		    	}
		    })
		    /* 삭제 관련 END*/
		});
	</script>
	<body>
		<div class="container">
			<div class="header">
				<span class="left">공지사항 관리</span>
				<span class="right"><span class="glyphicon glyphicon-home"></span>&nbsp;시스템 관리 > 공지사항 관리</span>
			</div>
			<section id="container">
				<form id="listForm">
					<input id="deleteNoticeNo" name="NOTICE_NO" type="hidden" value="">
					<div class="search row top">
						<div class="col-xs-2" style="width: 150px; padding-left: 0px;">
							<select name="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>등록자</option>
								<option value="u"<c:out value="${scri.searchType eq 'u' ? 'selected' : ''}"/>>수정자</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>메뉴코드</option>
								<option value="m"<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>메뉴명</option>
							</select>
						</div>
						<div class="col-xs-10" style="width: 250px;">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						<button type="button" class="btn btn-info" id="writeBtn">공지사항 등록</button>
					</div>
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>등록자</th><th>등록일</th><th>수정자</th><th>수정일</th><th>메뉴코드</th><th>메뉴명</th></tr>
						</thead>
						<c:forEach items="${LIST}" var="LIST">
							<tr>
								<td><c:out value="${LIST.NOTICE_NO}" /></td>
								<td><a><c:out value="${LIST.NOTICE_TITLE}" /></a></td>
								<td><c:out value="${LIST.NOTICE_WRITER}" /></td>
								<td><fmt:formatDate value="${LIST.NOTICE_REGDATE}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${LIST.NOTICE_MDWRITER}" /></td>
								<td><fmt:formatDate value="${LIST.NOTICE_MODIFYDATE}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${LIST.MENU_CODE}" /></td>
								<td><c:out value="${LIST.MENU_NAME}" /></td>
								<td><button id="updateBtn" type="button" class="btn btn-info" data-no="${LIST.NOTICE_NO}"
																							  data-title="${LIST.NOTICE_TITLE}"
																							  data-content="${LIST.NOTICE_CONTENT}"
																							  data-upperCode="${LIST.UPPER_MENU_CODE}"
																							  data-menuCode="${LIST.MENU_CODE}"
																							  data-menuName="${LIST.MENU_NAME}">수정</button></td>
								<td><button id="deleteBtn" type="button" class="btn btn-danger" value="${LIST.NOTICE_NO}">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="noticeList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="noticeList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="noticeList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
		<!-- modal line start write -->
		<form role="form" id="writeForm">
			<input id="writeMenuCode" name="MENU_CODE" type="hidden" value="">
			<div class="modal fade" id="writeModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="writeClose" data-dismiss="modal">×</button>
							<h4 class="modal-title">공지사항 등록</h4>
						</div>
						<div class="modal-body">
							<label for="NOTICE_TITLE">제목 : </label>
							<input name="NOTICE_TITLE" id="NOTICE_TITLE" class="wChk" type="text" title="제목을"><br>
							<label for="NOTICE_CONTENT">내용 : </label>
							<input name="NOTICE_CONTENT" id="NOTICE_CONTENT" class="wChk" type="text" title="내용을"><br>
							<label for="NOTICE_WRITER">등록자 : </label>
							<input name="NOTICE_WRITER" id="NOTICE_WRITER" class="wChk" type="text" title="등록자를"><br>
							<label>메뉴명 : </label>
							<select id="insertMenu">
								<option value="">메뉴 선택</option>
								<c:forEach items="${MENU_LIST}" var="MENU_LIST">
									<c:if test="${empty MENU_LIST.UPPER_MENU_CODE}">
										<option value="${MENU_LIST.MENU_CODE}"><c:out value="${MENU_LIST.MENU_NAME}" />
									</c:if>
								</c:forEach>
							</select>
							<select id="insertSubMenu">
								<option value="">서브메뉴 선택</option>
							</select>
						</div>
						<div class="modal-footer">
							<button id="insertBtn" type="button" class="btn btn-default">등록</button>
							<button type="button" class="btn btn-default writeClose" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
			<!-- modal line end write-->
		<!-- modal line start update -->
		<form role="form" id="updateForm">
			<input id="updateMenuCode" name="MENU_CODE" type="hidden" value="">
			<input id="updateNoticeNo" name="NOTICE_NO" type="hidden" value="">
			<div class="modal fade" id="updateModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="updateClose" data-dismiss="modal">×</button>
							<h4 class="modal-title">공지사항 수정</h4>
						</div>
						<div class="modal-body">
							<label for="updateNoticeTitle">제목 : </label>	
							<input name="NOTICE_TITLE" id="updateNoticeTitle" class="uChk" type="text" value="" title="제목을"><br>
							<label for="updateNoticeContent">내용 : </label>
							<input name="NOTICE_CONTENT" id="updateNoticeContent" class="uChk" type="text" title="내용을"><br>
							<label for="NOTICE_MDWRITER">수정자 : </label>
							<input name="NOTICE_MDWRITER" id="NOTICE_MDWRITER" class="uChk" type="text" value="${UPDATE.NOTICE_CONTENT}" title="수정자를"><br>
							<label>메뉴명 : </label>
							<select id="updateMenu">
								<option value="">메뉴 선택</option>
								<c:forEach items="${MENU_LIST}" var="MENU_LIST">
									<c:if test="${empty MENU_LIST.UPPER_MENU_CODE}">
										<option value="${MENU_LIST.MENU_CODE}"><c:out value="${MENU_LIST.MENU_NAME}" /></option>
									</c:if>
								</c:forEach>
							</select>
							<select id="updateSubMenu">
								<option value="">서브메뉴 선택</option>
							</select>
						</div>
						<div class="modal-footer">
							<button id="saveBtn" type="button" class="btn btn-default">저장</button>
							<button type="button" class="btn btn-default updateClose" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- modal line end update-->
	</body>
</html>