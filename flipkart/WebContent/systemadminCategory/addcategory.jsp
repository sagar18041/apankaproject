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
			selected : 1,
			select : function(event, ui) {
				if (ui.index == 0) {
					window.location = "adminviewcategory";
				} else if (ui.index == 2) {
					window.location = "adminverifycategory";
				}
			}
		});
	});

	/* 
	function showSuccessMsg() {
		var check = document.getElementById("checkContent").value;

		
		if (check == 1) {
			document.getElementById("successMsg").style.display = 'none';
		} else {
			document.getElementById("successMsg").style.display = 'block';
		}
	}*/
 
 </script>

</head>
<body><!--  onload="showSuccessMsg()" -->
	<div id="option">
		<ul class="nav nav-tabs">
			<li><a href="#tabs-viewCategory">View Categories</a></li>
			<li class="active"><a href="#tabs-addCategory">Add Product
					Category</a></li>
			<li><a href="#tabs-verifyCategory">Verify Categories</a></li>
		</ul>

		<div id="tabs-addCategory">

			<s:if test="hasActionErrors()">
				<br />
				<s:iterator value="actionErrors">
					<div class="alert alert-warning">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<s:property />
					</div>
				</s:iterator>
			</s:if>
			
			<s:if test="%{check == 1}">
				<div class="alert alert-success" id="successMsg">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Success!</strong> The new category was added successfully.
					A notification mail has been sent to the Admin.
				</div>
			</s:if>

			<%-- <s:set name="checkContent" value="%{check}" /> --%>

			<s:form action="adminaddcategory" theme="simple">

				<table class="table table-bordered table-hover">
					<tr>
						<td>Category Name</td>
						<td><s:textfield name="categoryName" theme="simple"
								placeholder="Please enter Category Name" cssClass="input-xlarge" /></td>
					</tr>
				</table>

				<s:submit value="ADD CATEGORY" cssClass="btn btn-primary"
					theme="simple" />

			</s:form>

		</div>
	</div>
</body>
</html>