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

	/* assigning the productID of selected product in drop downlist */
	function onProductChange() {
		var cat = document.getElementById("product");
		document.getElementById("selectedProductID").value = cat[cat.selectedIndex].value;
	}
	
	function insertitem(){
		var cat = document.getElementById("product");
		cat.selectedIndex = -1;
	}
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span6 offset1">

				<s:if test="existingItemList.size()!=0">
					<br />
					<br />
					<br />
					<div align="center">
						<font size="5" face="Georgia"><b>Items</b></font> <br /> <br />
					</div>
					<br />

					<!-- display existing items  -->
					<table class="table table-bordered" id="results">
						<tr>
							<th style="text-align: center">Item Name</th>
							<th style="text-align: center">Product Name</th>
							<th style="text-align: center">Available Quantity</th>
							<th style="text-align: center">Delete</th>
						</tr>

						<s:iterator value="existingItemList">

							<tr>
								<td style="text-align: center"><s:property value="itemName" /></td>
								<td style="text-align: center"><s:property
										value="productName" /></td>
								<td style="text-align: center"><s:property
										value="availableQuantity" /></td>
								<td style="text-align: center"><a
									href="admindeleteitem?itemID=<s:property value="itemID"/>">
										<i class="icon-trash"></i>
								</a></td>
							</tr>

						</s:iterator>
					</table>
					<div id="pageNavPosition" align="center"></div>
				</s:if>

				<s:if test="existingItemList.size()==0">
					<br />
					<br />
					<br />
					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="3" color="orange"><b>Currently there are no
								items in the database.</b></font>

					</div>
				</s:if>

				<br /> <font size="5" face="Georgia"><b>Add New Item</b></font> <br />
				<br />
				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>

				<s:form cssClass="form-horizontal" enctype="multipart/form-data"
					method="post">
					<s:hidden name="selectedProductID" id="selectedProductID" />
					<table class="table">
						<!-- drop down list for 'product' -->
						<tr>
							<td style="text-align: center">Product Name</td>
							<td>
								<div class="input-prepend">
									<span class="add-on"> <i class="icon-shopping-cart"
										style="color: black;"> </i>
									</span>
									<s:select list="productList" headerKey="-1"
										headerValue="Choose Product" id="product" name="productName"
										theme="simple" cssClass="chzn-select" title="Choose Product"
										style="width:257px" onchange="onProductChange()" />
								</div>
							</td>
						</tr>

						<tr>
							<td style="text-align: center">Item Name</td>
							<td><s:textfield name="itemName" theme="simple"
									placeholder="Please enter Item Name" cssClass="input-xlarge" /></td>
						</tr>

						<tr>
							<td style="text-align: center">Upload Thumbnail:</td>
							<td><s:file name="thumbnail"
									label="Select thumbnail image to upload" theme="simple"
									accept="image/gif, image/jpg, image/png, image/jpeg" /></td>
						</tr>

					</table>
					<s:submit value="Add Item" theme="simple"
						cssClass="btn btn-warning" onclick="insertitem()" action="admininsertitem" />
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