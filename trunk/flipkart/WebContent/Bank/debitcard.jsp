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
					<font size="5"><b>Debit Cards</b></font> <br /> <br />
				</div>

				<br />

				<table
					class="table table-bordered table-condensed table-hover table-striped">
					<tr>
						<th style="text-align: center"><font size="3">Customer
								Name</font></th>
						<th style="text-align: center"><font size="3">Account
								Number</font></th>
						<th style="text-align: center"><font size="3">Card
								Number</font></th>
						<th style="text-align: center"><font size="3">CVV</font></th>
						<th style="text-align: center"><font size="3">Expiry
								(MM/YYYY)</font></th>
						<th style="text-align: center"><font size="3">Delete</font></th>
					</tr>
					<s:iterator value="recordList">
						<tr>
							<td style="text-align: center"><s:property
									value="customerName" /></td>
							<td style="text-align: center"><s:property
									value="accountNumber" /></td>
							<td style="text-align: center"><s:property
									value="cardNumber" /></td>
							<td style="text-align: center"><s:property value="cvv" /></td>
							<td style="text-align: center"><s:property value="expiry" /></td>
							<td style="text-align: center"><a
								href="deleteDCEntry?accountNumber=<s:property
									value="accountNumber" />">
									<i class="icon-trash"></i>
							</a></td>
						</tr>
					</s:iterator>
				</table>
				<br />
				<div id="newdetail" class="well">
					
					<font size="4"><b>Add New Detail</b></font> <br /> <br />
					<s:form action="insertDCEntry" class="form-horizontal"
						name="InsertEntry" onsubmit="return Blank_TextField_Validator()">
						<table>
							<tr>
								<td><input type="text" class="input-medium"
									placeholder="Account Number" name="accountNumber" readonly
									value="<s:property value="accountNumber"/>"></td>

								<td valign="top"><a class="btn" href="DCSearchWindow">
										<i class="icon-external-link"></i>
								</a></td>
							</tr>
							<tr>
								<td><input type="text" class="input-medium"
									placeholder="Card Number" name="cardNumber"></td>
							</tr>
							<tr>

								<td><input type="text" class="input-medium"
									placeholder="CVV" name="cvv"></td>
							</tr>
							<tr>

								<td><input type="text" class="input-medium"
									placeholder="Expiry Month" name="expiryMonth"></td>
							</tr>
							<tr>

								<td><input type="text" class="input-medium"
									placeholder="Expiry Year" name="expiryYear"></td>
							</tr>
							<tr>

								<td><input type="password" class="input-medium"
									placeholder="Pin" name="password"></td>

							</tr>
						</table>
						&nbsp;&nbsp;
						<button type="submit" class="btn btn-medium pull-left btn-primary">Save</button>
						<a href="#" class="btn btn-medium btn-danger" onclick="cancel()">
							Cancel</a>
					</s:form>
				</div>
				<button class="btn btn-small btn-primary pull-right" type="button"
					onclick="show()" id="addRow">Add Row</button>
			</div>
		</div>
	</div>
</body>
</html>