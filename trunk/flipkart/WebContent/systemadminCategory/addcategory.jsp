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

	function hideParentCategory() {
		document.getElementById("newdetail").style.display = "none";
	}

	//called when level drop down list changes
	function onLevelSelect() {
		var element = document.getElementById("level");

		if (element.selectedIndex == -1) {
			element.value = -1;
		}
		var selectedLevel = element.options[element.selectedIndex].text;

		/* if parent is needed */
		if (selectedLevel != 0) {
			document.getElementById("newdetail").style.display = "block";
		} else {
			hideParentCategory();
		}
	}

	/* assigning the categoryID of selected category in drop downlist to hidden feild */
	function onCategoryChange() {
		var cat = document.getElementById("parentCategory");
		document.getElementById("selectedCategoryID").value = cat[cat.selectedIndex].value;
	}
</script>

</head>
<body onload="hideParentCategory()">
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

			<s:form action="admincategoryinsert" theme="simple" method="post">

				<s:hidden name="selectedCategoryID" id="selectedCategoryID" />
				<table class="table table-bordered table-hover">
					<tr>
						<td>Category Name</td>
						<td><s:textfield name="categoryName" theme="simple"
								placeholder="Please enter Category Name" cssClass="input-xlarge" /></td>
					</tr>
					<tr>
						<td>Category Level</td>
						<td>
							<div class="input-prepend">
								<span class="add-on"> <i class="icon-signal"
									style="color: black;"> </i>
								</span>
								<s:select name="level" list="levels" headerKey="-1" id="level"
									onChange="onLevelSelect()" headerValue="Choose Level"
									theme="simple" cssClass="chzn-select" title="Choose Level" />
							</div>
						</td>
					</tr>
					<tr id="newdetail" theme="simple">
						<td>Parent Category</td>
						<td>

							<div class="input-prepend">
								<span class="add-on"> <i class="icon-signal"
									style="color: black;"> </i>
								</span>
								<s:select list="parentCategories" headerKey="-1"
									headerValue="Choose Parent Category" id="parentCategory"
									theme="simple" cssClass="chzn-select" style="width:257px"
									onchange="onCategoryChange()" />
							</div>

						</td>
					</tr>
				</table>

				<s:submit value="ADD CATEGORY" cssClass="btn btn-primary"
					theme="simple" />

			</s:form>

		</div>
	</div>
</body>
</html>