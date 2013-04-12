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
			disabled : [ 0, 2 ]
		});
	});
</script>
</head>
<body>

	<div id="options">

		<ul class="nav nav-tabs">
			<li><a href="#tabs-ProductDetails"><font
					style="font-size: 20px;">1</font>&nbsp;<font
					style="font-size: 12px">Product Details</font></a></li>
			<li class="active"><a href="#tabs-ItemDetails"><font
					style="font-size: 20px; color: #FFAD00;">2</font>&nbsp;<font
					style="font-size: 12px">Item Details</font></a></li>
			<li><a href="#tabs-ItemAttributeDetails"><font
					style="font-size: 20px;">3</font>&nbsp;<font
					style="font-size: 12px">Item Attribute Details</font></a></li>
		</ul>

		<div id="tabs-ItemDetails">
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
						
						<s:form cssClass="form-horizontal" enctype="multipart/form-data" method="post">
							<table class="table">
								<tr>
									<td style="text-align: center">Item Name</td>
									<td><s:textfield name="itemName" theme="simple"
											placeholder="Please enter Item Name" cssClass="input-xlarge" /></td>
								</tr>

								<tr>
									<td><b>Upload Thumbnail:</b></td>
									<td><s:file name="thumbnail"
											label="Select thumbnail image to upload" theme="simple" 
											accept="image/gif, image/jpg, image/png, image/jpeg"/></td>
								</tr>

							</table>
							<s:submit value="Continue" theme="simple"
								cssClass="btn btn-warning" action="admininsertitem" />
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>