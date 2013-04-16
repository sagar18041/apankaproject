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
	
	setTimeout(function() {
	    $('#successMsg').fadeOut('slow');
	}, 5000);
	
	setTimeout(function() {
	    $('#errorMsg').fadeOut('slow');
	}, 5000);
	
</script>

</head>
<body>
	<div id="option">
		<ul class="nav nav-tabs">
			<li><a href="#tabs-viewCategory">View Categories</a></li>
			<li><a href="#tabs-addCategory">Add Product Category</a></li>
			<li class="active"><a href="#tabs-verifyCategory">Verify
					Categories</a></li>
		</ul>

		<div id="tabs-verifyCategory">

			<s:form theme="simple">
				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-warning" id="errorMsg">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>
				<s:if test="%{checkVerification == 1}">
					<div class="alert alert-success" id="successMsg">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>Success!</strong> The selected categories were activated.
					</div>
				</s:if>

				<s:if test="verificationcategoryList.size()!=0">
					<br />
					<br />
					<br />

					<table class="table table-bordered" id="results">
						<tr>
							<th>Select</th>
							<th>Category Name</th>
							<th>Activation Status</th>

						</tr>
						<s:iterator value="verificationcategoryList">
							<tr>

								<td><s:checkbox name="checkCategory"
										fieldValue="%{categoryID}"
										value="%{categoryID in checkCategory}" /></td>

								<td><s:property value="categoryName" /></td>

								<!-- /* 0=pending, 1=active, 2=inactive*/ -->
								<td><s:if test="%{status == 0}">
										<span style="color: red">PENDING</span>
									</s:if>
							</tr>
						</s:iterator>

					</table>
					<div id="pageNavPosition" align="center"></div>

				</s:if>

				<s:elseif test="verificationcategoryList.size()==0">
					<br />

					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="3" color="orange"><b>Currently there are no
								pending requests for verification.</b></font>

					</div>
				</s:elseif>

				<s:if test="verificationcategoryList.size()!=0">
					<!-- 'Submit' button -->
					<s:submit cssClass="btn btn-primary" value="ACTIVATE" align="left"
						action="adminchangestatuscategory" />
				</s:if>
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