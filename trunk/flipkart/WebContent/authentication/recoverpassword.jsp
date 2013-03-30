<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
	function Validator() {

		if (resetpassword.newPassword.value == "") {
			alert("Please enter new password !");
			resetpassword.newPassword.focus();
			return (false);
		}

		if (resetpassword.retypeNewPassword.value == "") {
			alert("Please retype new password !");
			resetpassword.retypeNewPassword.focus();
			return (false);
		}

		if (resetpassword.newPassword.value != resetpassword.retypeNewPassword.value) {
			alert("The given passwords do not match !");			
			return (false);
		}

		return (true);
	}
</script>
</head>
<body>
	<div class="span5 offset4">
		<s:form action="resetpassword" onsubmit="return Validator()">
			<s:hidden name="emailAddress" value="%{emailAddress}" />
			<table>
				<tr height="40">
					<td width="150">Email Address</td>
					<td><s:property value="emailAddress" /></td>
				</tr>
				<tr height="40">
					<td width="150">New Password</td>
					<td><input type="password" name="newPassword"
						class="input-large" /></td>
				</tr>
				<tr height="40">
					<td width="150">Retype New Password</td>
					<td><input type="password" name="retypeNewPassword"
						class="input-large" /></td>
				</tr>
				<tr height="20">
					<td width="150"></td>
					<td><button class="btn btn-small btn-primary pull-left"
							type="submit">Change Password</button></td>
				</tr>
			</table>
		</s:form>
	</div>

</body>
</html>