<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript">
	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});

	$(function() {
		$("#options").tabs({
			disabled : [ 0, 1 ]
		});
	});

	function show() {
		document.getElementById('newattribute').style.display = "block";
	}

	function hide() {
		document.getElementById('newattribute').style.display = "none";
	}
</script>
</head>
<body onload="hide()">

	<div id="options">

		<ul class="nav nav-tabs">
			<li><a href="#tabs-ProductDetails"><font
					style="font-size: 20px;">1</font>&nbsp;<font
					style="font-size: 12px">Product Details</font></a></li>
			<li><a href="#tabs-ItemDetails"><font
					style="font-size: 20px;">2</font>&nbsp;<font
					style="font-size: 12px">Item Details</font></a></li>
			<li class="active"><a href="#tabs-ItemAttributeDetails"><font
					style="font-size: 20px; color: #FFAD00;">3</font>&nbsp;<font
					style="font-size: 12px">Item Attribute Details</font></a></li>
		</ul>

		<div id="tabs-ItemAttributeDetails">


			<div class="container-fluid">
				<div class="row-fluid">

					<div class="span6 offset1"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>