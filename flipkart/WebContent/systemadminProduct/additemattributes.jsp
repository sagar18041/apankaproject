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
		</div>
	</div>
</body>
</html>