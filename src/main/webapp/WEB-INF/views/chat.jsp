<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script> 
</head>
<!-- http://blog.daum.net/wonju114/69  채팅 참고-->
<script type="text/javascript">
    $(document).ready(function() {
        $("#sendBtn").click(function() {
            sendMessage();
        });
    });
    var sock;
    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo"/>");
    
    //자바스크립트 안에 function을 집어넣을 수 있음.
    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
    sock.onmessage = onMessage;
    
    //데이터를 끊고싶을때 실행하는 메소드
    sock.onclose = onClose;
   /* 	sock.onopen = function(evt){
		sock.send();
    };    */
    
    function sendMessage() {
        /*소켓으로 보내겠다.  */
        sock.send($("#message").val());
    }
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    //Echohandler에 sess.sendMessage() 파라미터값 가져옴
    function onMessage(evt) {
        var data = evt.data;
        $("#data").append(data + "<br/>");
        //sock.close();
    }
    function onClose(evt) {
        $("#data").append("연결 끊김");
    }
</script>
</head>
<body>
    <input type="text" id="message" />
    <input type="button" id="sendBtn" value="전송" />
    <div id="data"></div>
</body>
</html>