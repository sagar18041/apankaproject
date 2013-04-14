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

	function cancel() {
		InsertEntry.accountNumber.value = "";
		document.getElementById('newdetail').style.display = "none";
		document.getElementById('addRow').style.display = "block";
	}

	function hide() {
		var accountSelected = '${accountSelected}';
		if (accountSelected == 1) {
			document.getElementById('newdetail').style.display = "block";
			document.getElementById('addRow').style.display = "none";
		}

		if (accountSelected == 0) {
			InsertEntry.accountNumber.value = "";
			document.getElementById('newdetail').style.display = "none";
			document.getElementById('addRow').style.display = "block";
		}
	}

	function Validator() {

		if (InsertEntry.accountNumber.value == "") {
			alert("Please select account number from the lookup.");
			InsertEntry.accountNumber.focus();
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

				<s:if test="recordList.size()!=0">

					<div align="center">
						<font size="5" face="Georgia"><b>Net Banking Customers</b></font>
						<br /> <br />
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

					<div id="pageNavPosition" align="center"></div>

				</s:if>

				<s:if test="recordList.size()==0">
					<br />
					<br />
					<br />
					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="5" face="Gerogia" color="orange"><b>Sorry!
								No records found.</b></font>

					</div>
				</s:if>

				<br />

				<div align="center">
					<form action="InsertEntry" class="form-inline" id="newdetail"
						name="InsertEntry" onsubmit="return Validator()">

						<input type="text" class="input-medium"
							placeholder="Account Number" name="accountNumber" readonly
							value="<s:property value="accountNumber"/>"> <a
							class="btn" href="NBSearchWindow"> <i
							class="icon-external-link"></i>
						</a> &nbsp;&nbsp;<input type="password" class="input-medium"
							placeholder="Password" name="password">
						<button type="submit" class="btn btn-medium">Save</button>
						<a href="#" class="btn btn-medium btn-danger" onclick="cancel()">
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