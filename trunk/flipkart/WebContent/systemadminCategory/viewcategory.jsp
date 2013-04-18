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
					window.location = "adminverifycategory";
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
			<li><a href="#tabs-verifyCategory">Verify Categories</a></li>
		</ul>

		<div id="tabs-viewCategory">

			<s:form action="adminviewcategory" theme="simple">

				<s:if test="categoryList.size()!=0">

					<table class="table table-bordered" id="results">
						<tr>
							<th style="text-align: center">Category Name</th>
							<th style="text-align: center">Parent Category</th>
							<th style="text-align: center">Level</th>
							<th style="text-align: center">Activation Status</th>
							<th style="text-align: center">Delete</th>
						</tr>
						<s:iterator value="categoryList">
							<tr>
								<td style="text-align: left"><s:property
										value="categoryName" /></td>

								<td style="text-align: center"><s:if
										test="%{parentCategory == categoryName}">
									-
								</s:if> <s:else>
										<s:property value="parentCategory" />
									</s:else></td>

								<td style="text-align: center"><s:property value="level" /></td>

								<!-- /* 0=pending, 1=active, 2=inactive*/ -->
								<td style="text-align: center"><s:if test="%{status == 1}">
										<span style="color: green">ACTIVE</span>
									</s:if> <s:elseif test="%{status == 2}">
										<span style="color: grey">INACTIVE</span>
									</s:elseif> <s:elseif test="%{status == 0}">
										<span style="color: red">PENDING</span>
									</s:elseif> <s:else>
										<s:property value="status" />
									</s:else></td>

								<td style="text-align: center"><a
									href="admindeletecategory?categoryID=<s:property value="categoryID"/>">
										<i class="icon-trash"></i>
								</a></td>
							</tr>
						</s:iterator>
					</table>
					<div id="pageNavPosition" align="center"></div>
				</s:if>

				<s:elseif test="categoryList.size()==0">
					<br />

					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="3" color="orange"><b>Currently there are no
								categories in the database.</b></font>

					</div>
				</s:elseif>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
		var pager = new Pager('results', 10);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		pager.showPage(1);
	</script>
	<br />
	<br />
	<br />
</body>
</html>