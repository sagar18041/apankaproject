<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function Blank_TextField_Validator() {

		if (myform.credit.value == "" && myform.debit.value == "") {
			alert("Please enter atleast one value or press cancel.");
			myform.customerName.focus();
			return (false);
		}

		return (true);
	}
</script>

</head>
<body>
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
			<div class="span12">

				<div align="center">
					<font size="5"><b>Edit Balance</b></font> <br /> <br />
				</div>
				<br />

				<div align="center">
					<form action="editBalance" class="form-inline" id="newdetail"
						name="myform" onsubmit="return Blank_TextField_Validator()">

						<input type="text" class="input-medium" name="customerName"
							value="<s:property value="customerName"/>" readonly>
						<input type="text" class="input-medium" name=accountNumber
							value="<s:property value="accountNumber"/>"
							readonly> <input type="text" class="input-medium"
							name="balance"
							value="<s:property value="balance"/>" readonly>
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
</body>
</html>