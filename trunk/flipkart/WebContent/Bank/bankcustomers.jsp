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

	function Validator() {

		var balance = /^[0-9]+\.[0-9]+|^[0-9]+$/;
		var accountNumber = /^\d{14}$/;

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

		if (!(myform.accountNumber.value.match(accountNumber))) {

			alert("Account number should be a 14 digit number.");
			myform.accountNumber.focus();
			return (false);

		}

		if (myform.balance.value == "") {
			alert("Please enter balance.");
			myform.balance.focus();
			return (false);
		}

		if (!(myform.balance.value.match(balance))) {

			alert("Please correct balance.");
			myform.balance.focus();
			return (false);

		}

		return (true);
	}
</script>

</head>
<body onload="hide()">

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
					<font size="5" face="Georgia"><b>Bank Customers</b></font> <br />
					<br />
				</div>
				<br />
				<table
					class="table-bank table-bank-bordered table-bank-condensed table-bank-hover table-bank-striped"
					id="results">
					<tr>
						<th style="text-align: center"><font size="3" face="Georgia">Customer
								Name</font></th>
						<th style="text-align: center"><font size="3" face="Georgia">Account
								Number</font></th>
						<th style="text-align: center"><font size="3" face="Georgia">Balance
								(INR)</font></th>
						<th style="text-align: center"><font size="3" face="Georgia">Delete</font></th>
						<th style="text-align: center"><font size="3" face="Georgia">Edit
								Balance</font></th>
					</tr>
					<s:iterator value="customerList">

						<tr>
							<td style="text-align: center"><font face="Arial"><s:property
										value="customerName" /></font></td>
							<td style="text-align: center"><font face="Arial"><s:property
										value="accountNumber" /></font></td>
							<td style="text-align: center"><font face="Arial"><s:property
										value="balance" /></font></td>
							<td style="text-align: center"><a
								href="deleteCustomer?accountNumber=<s:property value="accountNumber"/>">
									<i class="icon-trash"></i>
							</a></td>
							<td style="text-align: center"><a
								href="init?accountNumber=<s:property value="accountNumber"/>&customerName=<s:property value="customerName"/>&balance=<s:property value="balance"/>">
									<i class="icon-edit"></i>
							</a></td>
						</tr>

					</s:iterator>
				</table>


				<div id="pageNavPosition" align="center"></div>

				<br />
				<div align="center">
					<form action="insertCustomer" class="form-inline" id="newdetail"
						name="myform" onsubmit="return Validator()">

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