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

	/* assigning the categoryID of selected category in drop downlist to hidden feild */
	function onCategoryChange() {
		var cat = document.getElementById("category");
		document.getElementById("selectedCategoryID").value = cat[cat.selectedIndex].value;
	}
</script>
</head>
<body>

	<div class="container-fluid">

		<div class="row-fluid">

			<div class="span6 offset1">


				<s:if test="existingProductList.size()!=0">
					<br />
					<br />
					<br />
					<div align="center">
						<font size="5" face="Georgia"><b>Products</b></font> <br />
						<br />
					</div>
					<br />
					
					<!-- display existing products  -->
					<table class="table table-bordered" id="results">
						<tr>
							<th style="text-align: center">Product Name</th>
							<th style="text-align: center">Product Category</th>
							<th style="text-align: center">Delete</th>
						</tr>

						<s:iterator value="existingProductList">

							<tr>
								<td style="text-align: center"><s:property
										value="productName" /></td>
								<td style="text-align: center"><s:property
										value="categoryName" /></td>
								<td style="text-align: center"><a
									href="admindeleteproduct?productID=<s:property value="productID"/>">
										<i class="icon-trash"></i>
								</a></td>
							</tr>

						</s:iterator>
					</table>

					<div id="pageNavPosition" align="center"></div>

				</s:if>

				<s:if test="existingProductList.size()==0">
					<br />
					<br />
					<br />
					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="3" color="orange"><b>Currently there are no products in the database.</b></font>

					</div>
				</s:if>

				<br /> <br /> <font size="5" face="Georgia"><b>Add New Product</b></font> <br /> <br />
				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>
				<s:form action="admininsertproduct" method="post">
					<s:hidden name="selectedCategoryID" id="selectedCategoryID" />
					<table class="table">
						<tr>
							<td>Product Name</td>
							<td><s:textfield name="productName" theme="simple"
									placeholder="Please enter Product Name" cssClass="input-xlarge" /></td>
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
										title="Choose Category" style="width:257px"
										onchange="onCategoryChange()" />
								</div>
							</td>
						</tr>
					</table>
					<s:submit value="Add Product" theme="simple" align="right"
						cssClass="btn btn-warning" />
				</s:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
		var pager = new Pager('results', 5);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		pager.showPage(1);
	</script>
	<br />
	<br />
	<br />
</body>
</html>