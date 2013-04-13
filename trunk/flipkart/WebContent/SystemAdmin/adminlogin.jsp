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
	<br />
	<br />
	<br />
	<br />
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
					<br />
					<s:form action="adminlogin" class="form-signin">

						<h3 class="form-signin-heading" style="color: white;">
							<i><img src="ViewResources/img/login.png" height="50"
								width="50" /></i> Login
						</h3>

						<br />

						<table>
							<tr>
								<td height="40">
									<div class="input-prepend">
										<span class="add-on"><i class="icon-envelope"
											style="color: black;"></i></span> <input type="text" name="userID"
											class="input-large" placeholder="User Name">
									</div>
								</td>
							</tr>

							<tr>
								<td height="40">
									<div class="input-prepend">
										<span class="add-on"><i class="icon-key"
											style="color: black;"></i></span> <input type="password"
											name="password" class="input-large" placeholder="Password">
									</div>
								</td>
							</tr>
							
							<tr>
								<td height="40" valign="bottom"><button type="submit"
										class="fk-button-blue pull-left">Sign In</button></td>
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