<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript">
	function show() {
		document.getElementById('newdetail').style.display = "block";
	}
	function hide() {
		document.getElementById('newdetail').style.display = "none";
	}
</script>
</head>
<body onload="hide()">

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
				<font size="5"><b>Add New Product</b></font>
				<%-- <table class="table">
					<tr>
						<th style="text-align: center">Product Name</th>
						<th style="text-align: center">Category</th>
						<th style="text-align: center"></th>
						<th></th>
					</tr>
					<s:iterator value="educationalQualifications">
						<tr>
							<td style="text-align: center"><s:property
									value="degreeName" /></td>
							<td style="text-align: center"><s:property
									value="yearOfPassing" /></td>
							<td style="text-align: center"><s:property
									value="aggregateMarks" /></td>
							<td><a
								href="deleteeq?eqID=<s:property
									value="educationalQualificationID" />">
									<i class="icon-trash"></i>
							</a></td>
						</tr>
					</s:iterator>
				</table> --%>
				<hr>
				<div align="center">
				
				
				
					<form action="InsertEQDetails" class="form-inline" id="newdetail">
						<input type="text" class="input-medium" placeholder="Degree"
							name="degree"> <input type="text" class="input-medium"
							placeholder="Year of Passing" name="yearOfPassing"> <input
							type="text" class="input-medium" placeholder="Aggregate Marks"
							name="aggregateMarks">
						<button type="submit" class="btn btn-medium">Save</button>
					</form>
				</div>
				<button class="btn btn-small btn-primary pull-right" type="button"
					onclick="show()">Add Row</button>
			</div>
		</div>
	</div>
</body>
</html>