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
			selected : 0,
			select : function(event, ui) {
				if (ui.index == 1) {
					window.location = "adminaddcategory";
				} else if (ui.index == 2) {
					window.location = "adminmodifycategory";
				}
			}
		});
	});
</script>
</head>
<body>

	<div id="option">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tabs-viewCategory">View
					Categories</a></li>
			<li><a href="#tabs-addCategory">Add Product Category</a></li>
			<li><a href="#tabs-modifyCategory">Modify Categories</a></li>
		</ul>

		<div id="tabs-viewCategory">
			<s:form action="adminviewcategory" theme="simple">
				<table cellpadding="5" class="table table-bordered">
					<tr>
						<th>Category Name</th>
						<th>Activation Status</th>
					</tr>
					<s:iterator value="categoryList">
						<tr>
							<td><s:property value="categoryName" /></td>
							<td><s:if test="%{status == 'ACTIVE'}">
									<span style="color: green"><s:property value="status" /></span>
								</s:if> <s:elseif test="%{status == 'INACTIVE'}">
									<span style="color: grey"><s:property value="status" /></span>
								</s:elseif> <s:elseif test="%{status == 'PENDING'}">
									<span style="color: red"><s:property value="status" /></span>
								</s:elseif> <s:else>
									<s:property value="status" />
								</s:else></td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</div>
</body>
</html>