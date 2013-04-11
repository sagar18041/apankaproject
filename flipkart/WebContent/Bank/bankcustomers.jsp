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

		document.getElementById('newdetail').style.display = "none";
		document.getElementById('addRow').style.display = "block";
	}

	function Blank_TextField_Validator() {

		if (myform.customerName.value == "") {
			alert("Please enter customer name.");
			myform.customerName.focus();
			return (false);
		}

		if (myform.accountNumber.value == "") {
			alert("Please enter account number.");
			myform.accountNumber.focus();
			return (false);
		}

		if (myform.balance.value == "") {
			alert("Please enter balance.");
			myform.balance.focus();
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
			<div class="span4 offset4">
				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>
			</div>
			<div class="span10 offset1">



				<div align="center">
					<font size="5"><b>Bank Customers</b></font> <br /> <br />
				</div>
				<br />
				<table
					class="table table-bordered table-condensed table-hover table-striped">
					<tr>
						<th style="text-align: center"><font size="3">Customer
								Name</font></th>
						<th style="text-align: center"><font size="3">Account
								Number</font></th>
						<th style="text-align: center"><font size="3">Balance
								(INR)</font></th>
						<th style="text-align: center"><font size="3">Delete</font></th>
						<th style="text-align: center"><font size="3">Edit
								Balance</font></th>
					</tr>
					<s:iterator value="customerList">

						<tr>
							<td style="text-align: center"><s:property
									value="customerName" /></td>
							<td style="text-align: center"><s:property
									value="accountNumber" /></td>
							<td style="text-align: center"><s:property value="balance" /></td>
							<td style="text-align: center"><a
								href="deleteCustomer?accountNumber=<s:property value="accountNumber"/>">
									<i class="icon-trash"></i>
							</a></td>
							<td style="text-align: center"><a
								href="editBalanceInit?accountNumber=<s:property value="accountNumber"/>">
									<i class="icon-edit"></i>
							</a></td>
						</tr>

					</s:iterator>
				</table>

				<div align="center">
					<form action="insertCustomer" class="form-inline" id="newdetail"
						name="myform" onsubmit="return Blank_TextField_Validator()">

						<input type="text" class="input-medium"
							placeholder="Customer Name" name="customerName"> <input
							type="text" class="input-medium" placeholder="Account Number"
							name=accountNumber> <input type="text"
							class="input-medium" placeholder="Balance(INR)" name="balance">
						<button type="submit" class="btn btn-medium">Save</button>
						<a href="#" class="btn btn-medium btn-danger" onclick="hide()">
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