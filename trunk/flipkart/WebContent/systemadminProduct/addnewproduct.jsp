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
			disabled : [ 1, 2 ]
		});
	});

	/* assigning the categoryID of selected category in drop downlist to hidden feild */
	function onCategoryChange() {
		var cat = document.getElementById("category");
		document.getElementById("selectedCategoryID").value = cat[cat.selectedIndex].value;
	}
</script>
</head>
<body>

	<div id="options">

		<ul class="nav nav-tabs">
			<li class="active"><a href="#tabs-ProductDetails"><font
					style="font-size: 20px; color: #FFAD00;">1</font>&nbsp;<font
					style="font-size: 12px">Product Details</font></a></li>
			<li><a href="#tabs-ItemDetails"><font
					style="font-size: 20px;">2</font>&nbsp;<font
					style="font-size: 12px">Item Details</font></a></li>
			<li><a href="#tabs-ItemAttributeDetails"><font
					style="font-size: 20px;">3</font>&nbsp;<font
					style="font-size: 12px">Item Attribute Details</font></a></li>
		</ul>

		<div id="tabs-ProductDetails">

			<div class="container-fluid">

				<div class="row-fluid">

					<div class="span6 offset1">

						<s:if test="hasActionErrors()">
							<br />
							<s:iterator value="actionErrors">
								<div class="alert alert-error">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<s:property />
								</div>
							</s:iterator>
						</s:if>
						<br />
						<s:form action="admininsertproduct" method="post">
							<s:hidden name="selectedCategoryID" id="selectedCategoryID" />
							<table class="table">
								<tr>
									<td>Product Name</td>
									<td>
										<s:textfield name="productName" theme="simple"
											placeholder="Please enter Product Name"
											cssClass="input-xlarge" />
									</td>
								</tr>

								<!-- drop down list for 'category' -->
								<tr>
									<td>Category</td>
									<td>
										<div class="input-prepend">
											<span class="add-on"> <i class="icon-shopping-cart"
												style="color: black;"> </i>
											</span>
											<s:select list="categoryList" headerKey="-1"
												headerValue="Choose Category" id="category"
												name="categoryName" theme="simple" cssClass="chzn-select"
												title="Choose Semester" style="width:257px"
												onchange="onCategoryChange()" />
										</div>
									</td>
								</tr>
							</table>
							<s:submit value="Continue" theme="simple"
								cssClass="btn btn-warning" />
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>