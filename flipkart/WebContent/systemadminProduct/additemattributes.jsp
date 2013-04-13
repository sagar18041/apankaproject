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
		document.getElementById('newdetail').style.display = "block";
		document.getElementById('addRow').style.display = "none";
	}

	function hide() {

		document.getElementById('newdetail').style.display = "none";
		document.getElementById('addRow').style.display = "block";
	}

	function showSuccessMsg(){
		window.location = "adminsuccessproduct";
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


						<table class="table table-bordered">
							<tr>
								<th style="text-align: center">Attribute Name</th>
								<th style="text-align: center">Attribute Value</th>
								<th style="text-align: center">Priority Level</th>
								<th style="text-align: center">Delete</th>
			
							</tr>
							<s:iterator value="attributesList">

								<tr>
									<td style="text-align: center"><s:property
											value="attribute" /></td>
									<td style="text-align: center"><s:property value="value" /></td>
									<td style="text-align: center"><s:property
											value="priorityLevel" /></td>
									<td style="text-align: center"><a
										href="admindeleteitemattributes?attribute=<s:property value="attribute"/>">
											<i class="icon-trash"></i>
									</a>
									</td>
								</tr>

							</s:iterator>
						</table>

						<div align="left">
							<form action="admininsertitemattributes" class="form-inline"
								id="newdetail" name="myform">

								<input type="text" placeholder="Attribute Name" name="attribute" style="width:140px">
								<input type="text" placeholder="Attribute Value" name="value" style="width:140px">
								<input type="number" placeholder="Priority Level"
									name="priorityLevel" min="0" max="2" style="width:70px">

								<button type="submit" class="btn btn-small">Save</button>
								<a href="#" class="btn btn-small btn-danger" onclick="hide()"> Cancel</a>
							</form>
						</div>
						<button class="btn btn-small btn-primary pull-right" type="button"
							onclick="show()" id="addRow">Add Attribute</button>

						<br /> <br /> <br />
						<button class="btn btn-success pull-right" type="button" onclick="showSuccessMsg()">Finish</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>