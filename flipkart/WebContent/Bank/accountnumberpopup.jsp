<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Account Number</title>
<script type="text/javascript">
	function show() {
		document.getElementById('result').style.display = "block";
	}
	function hide() {
		var searchValue = '${searchValue}';
		if (searchValue != 1) {
			document.getElementById('result').style.display = "none";
		}
	}
</script>
</head>
<body onload="hide()">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span10 offset1">

				<s:form class="form-inline" action="searchaccountnumber">
					<table>
						<tr>
							<td><input type="text" class="input-large"
								placeholder="Account Number" name=accountNumber></td>
							<td valign="top"><button type="submit"
									class="btn btn-primary" onclick="show()">Search</button></td>
						</tr>
					</table>
				</s:form>
				<div id="result">
					<table
						class="table table-bordered table-condensed table-hover table-striped">
						<tr>
							<th style="text-align: center"><font size="2">Customer
									Name</font></th>
							<th style="text-align: center"><font size="2">Account
									Number</font></th>
							<th style="text-align: center"><font size="2">Select</font></th>
						</tr>
						<s:iterator value="searchList">
							<tr>
								<td style="text-align: center"><s:property
										value="customerName" /></td>
								<td style="text-align: center"><s:property
										value="accountNumber" /></td>
								<td style="text-align: center"><a
									href="selectedAccountNumber?accountNumber=<s:property
									value="accountNumber" />">
										<i><img src="ViewResources/img/Select.png" height="20"
											width="20" /></i>
								</a></td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>