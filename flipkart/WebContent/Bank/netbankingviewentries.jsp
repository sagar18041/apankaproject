<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function show() {
		document.getElementById('newdetail').style.display = "block";
		document.getElementById('addRow').style.display = "none";
	}
	function hide() {
		var searchValue = '${searchValue}';
		if (searchValue != 1) {
			InsertEntry.accountNumber.value = "";
			document.getElementById('newdetail').style.display = "none";
		}
	}

	function Blank_TextField_Validator() {

		if (InsertEntry.accountNumber.value == "") {
			alert("Please select account number from the lookup.");
			return (false);
		}

		if (InsertEntry.password.value == "") {
			alert("Please enter password.");
			InsertEntry.password.focus();
			return (false);
		}

		return (true);
	}
</script>

</head>
<body onload="hide()">
	<br />

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span10 offset1">

				<div align="center">
					<font size="5"><b>Net Banking Customers</b></font> <br /> <br />
				</div>

				<br />

				<table
					class="table table-bordered table-condensed table-hover table-striped">
					<tr>
						<th style="text-align: center"><font size="3">Customer
								Name</font></th>
						<th style="text-align: center"><font size="3">Account
								Number</font></th>
						<th style="text-align: center"><font size="3">Balance (INR)</font></th>
						<th style="text-align: center"><font size="3">Delete</font></th>
					</tr>
					<s:iterator value="recordList">
						<tr>
							<td style="text-align: center"><s:property
									value="customerName" /></td>
							<td style="text-align: center"><s:property
									value="accountNumber" /></td>
							<td style="text-align: center"><s:property value="balance" /></td>
							<td style="text-align: center"><a
								href="deleteEntry?accountNumber=<s:property
									value="accountNumber" />">
									<i class="icon-trash"></i>
							</a></td>
						</tr>
					</s:iterator>
				</table>

				<div align="center">
					<form action="InsertEntry" class="form-inline" id="newdetail"
						name="InsertEntry" onsubmit="return Blank_TextField_Validator()">

						<input type="text" class="input-medium"
							placeholder="Account Number" name="accountNumber" readonly
							value="<s:property value="accountNumber"/>"> <a
							class="btn" href="accountNumberPopup"> <i
							class="icon-external-link"></i>
						</a> &nbsp;&nbsp;<input type="password" class="input-medium"
							placeholder="Password" name="password">
						<button type="submit" class="btn btn-medium">Save</button>
						<a href="netbankingviewentries" class="btn btn-medium btn-danger">
							Cancel</a>
					</form>
				</div>
				<button class="btn btn-small btn-primary pull-right" type="button"
					onclick="show()" id="addRow">Add Row</button>
			</div>
		</div>
	</div>
</body>
</html>