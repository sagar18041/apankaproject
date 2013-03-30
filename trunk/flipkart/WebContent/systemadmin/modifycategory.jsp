<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script>
	$(function() {
		$("#option").tabs({
			selected : 2,
			select : function(event, ui) {
				if (ui.index == 0) {
					window.location = "adminviewcategory";
				} else if (ui.index == 1) {
					window.location = "adminaddcategory";
				}
			}
		});
	});
</script>

</head>
<body>
<div id="option">
		<ul class="nav nav-tabs">
			<li><a href="#tabs-viewCategory">View
					Categories</a></li>
			<li><a href="#tabs-addCategory">Add Product Category</a></li>
			<li class="active"><a href="#tabs-modifyCategory">Modify Categories</a></li>
		</ul>

		<div id="tabs-modifyCategory"></div>
</div>
</body>
</html>