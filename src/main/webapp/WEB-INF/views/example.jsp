<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Example</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url : "http://dev-node-rest-api.herokuapp.com/ingredient?limit=100",
				type : "get",
				dataType : "json",
				success : function(data){
					$.each(data, function(index, item){
						console.log(data[index]);
						var a = data[index];
						$("#a").append("<tr>"+'<td>'+a._id+'</td>'+
										      '<td>'+a.expiryDate+'</td>'+
										      '<td>'+a.id+'</td>'+
										      '<td>'+a.imageUrl+'</td>'+
										      '<td>'+a.mount+'</td>'+
										      '<td>'+a.name+'</td>'+
										      '<td>'+a.purchaseDate+'</td>'+
										      '<td>'+a.type+'</td>'+
										      '<td>'+a.unit+'</td>'+
										      '<td>'+a.username+'</td>'+
										      '<td>'+a.deleted+'</td>'+"</tr>");
						
						
					})
					
				}
			})
		});
	</script>
<body>
	<table>
		<thead>
			<tr></tr>
		</thead>
		<tbody id="a">
		</tbody>
	</table>
	
	<p></p>
</body>
</html>