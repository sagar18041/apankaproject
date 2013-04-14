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

		var cardNumber = /^\d{16}$/;
		var cvvNumber = /^\d{3}$/;
		var month = /^(0[1-9]|1[0-2])$/;
		var year = /^\d{4}$/;
		var pin = /^\d{4}$/;

		if (InsertEntry.accountNumber.value == "") {
			alert("Please select account number from the lookup.");
			InsertEntry.accountNumber.focus();
			return (false);
		}

		if (InsertEntry.cardNumber.value == "") {
			alert("Please enter card number.");
			InsertEntry.cardNumber.focus();
			return (false);
		}

		if (!(InsertEntry.cardNumber.value.match(cardNumber))) {

			alert("Card number should be a 16 digit number.");
			InsertEntry.cardNumber.focus();
			return (false);

		}

		if (InsertEntry.cvv.value == "") {
			alert("Please enter cvv number.");
			InsertEntry.cvv.focus();
			return (false);
		}

		if (!(InsertEntry.cvv.value.match(cvvNumber))) {

			alert("CVV number should be a 3 digit number.");
			InsertEntry.cvv.focus();
			return (false);

		}

		if (InsertEntry.expiryMonth.value == "") {
			alert("Please enter expiry month.");
			InsertEntry.expiryMonth.focus();
			return (false);
		}

		if (!(InsertEntry.expiryMonth.value.match(month))) {

			alert("Please correct expiry month.");
			InsertEntry.expiryMonth.focus();
			return (false);

		}

		if (InsertEntry.expiryYear.value == "") {
			alert("Please enter expiry year.");
			InsertEntry.expiryYear.focus();
			return (false);
		}

		if (!(InsertEntry.expiryYear.value.match(year))) {

			alert("Please correct expiry year.");
			InsertEntry.expiryYear.focus();
			return (false);

		}

		if (InsertEntry.password.value == "") {
			alert("Please enter pin.");
			InsertEntry.password.focus();
			return (false);
		}

		if (!(InsertEntry.password.value.match(pin))) {

			alert("Pin should be a 4 digit number.");
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

				<s:if test="recordList.size()!=0">

					<div align="center">
						<font size="5" face="Georgia"><b>Debit Cards</b></font> <br /> <br />
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
							<th style="text-align: center"><font size="3" face="Georgia">Card
									Number</font></th>
							<th style="text-align: center"><font size="3" face="Georgia">CVV</font></th>
							<th style="text-align: center"><font size="3" face="Georgia">Expiry
									(MM/YYYY)</font></th>
							<th style="text-align: center"><font size="3" face="Georgia">Delete</font></th>
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
				<div id="newdetail" class="well">

					<font size="4" face="Georgia"><b>Add New Detail</b></font> <br />
					<br />
					<s:form action="insertDCEntry" class="form-horizontal"
						name="InsertEntry" onsubmit="return Validator()">
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
									placeholder="Expiry Month(MM)" name="expiryMonth"></td>
							</tr>
							<tr>

								<td><input type="text" class="input-medium"
									placeholder="Expiry Year(YYYY)" name="expiryYear"></td>
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