<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class=container-fluid>
		<div class="row-fluid">
			<div class="span4 offset4">

				<s:if test="hasActionErrors()">
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>

				<div class="well-aamir" align="center">
					<s:form action="adminlogin" class="form-signin">

						<h3 class="form-signin-heading" style="color: white;">
							<i class="icon-user"></i> Enter Details
						</h3>

						<br />

						<table>
							<tr>
								<td><input type="text" class="input-medium"
									placeholder="Account Number" name="accountNumber" readonly
									value="<s:property value="accountNumber"/>"> <a
									class="btn" href="accountNumberPopup"> <i
										class="icon-external-link"></i>
								</a></td>

								<td><input type="text" class="input-medium"
									placeholder="Card Number" name="cardNumber"></td>

								<td><input type="text" class="input-medium"
									placeholder="CVV" name="cvv"></td>

								<td><input type="text" class="input-medium"
									placeholder="Expiry Month" name="expiryMonth"></td>

								<td><input type="text" class="input-medium"
									placeholder="Expiry Year" name="expiryYear"></td>

								<td><input type="password" class="input-medium"
									placeholder="Password" name="password"></td>

							</tr>
						</table>
						<br />

					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>