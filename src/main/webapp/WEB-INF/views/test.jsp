<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/ui.jqgrid.css" />

<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/resources/js/jquery.jqGrid.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>jqGrid Example</title>
</head>
<body>
	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#jqGrid").jqGrid({
				url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
				mtype: "GET",
				datatype: "jsonp",
				colModel: [
					{label: 'OrderID', name: 'OrderID', key: true, width: 75},
					{label: 'Customer ID', name: 'CustomerID', width: 150},
					{label: 'Order Date', name: 'OrderDate', width: 150},
					{label: 'Freight', name: 'Freight', width: 150},
					{label: 'Ship Name', name: 'ShipName', width: 150}
				],
				viewrecords: true,
				height: 250,
				rowNum: 101,
				pager: "#jqGridPager"
			});
		});
	</script>
</body>
</html>