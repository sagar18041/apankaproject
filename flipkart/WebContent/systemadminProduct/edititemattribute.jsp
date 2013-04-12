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
				<div align="center">
					<form action="#" class="form-inline" id="newdetail"
						name="myform" onsubmit="return Blank_TextField_Validator()">

						<input type="text" class="input-medium" name="customerName"
							value="<s:property value="customer.getCustomerName()"/>" readonly>
						<input type="text" class="input-medium" name=accountNumber
							value="<s:property value="customer.getAccountNumber()"/>"
							readonly> <input type="text" class="input-medium"
							name="balance"
							value="<s:property value="customer.getBalance()"/>" readonly>
						<input type="text" class="input-medium" name="credit"
							placeholder="Credit Amount"> <input type="text"
							class="input-medium" name="debit" placeholder="Debit Amount">
						<button type="submit" class="btn btn-medium">Save</button>
						<a href="getAllCustomers" class="btn btn-medium btn-danger">
							Cancel</a>
					</form>
				</div>
			
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>