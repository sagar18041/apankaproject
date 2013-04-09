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
				<div class="well-aamir" align="center">
					<s:form action="login" class="form-signin">

						<h3 class="form-signin-heading" style="color: white;">
							<i class="icon-user"></i> Login
						</h3>

						<br />

						<table>
							<tr>
								<td height="40">
									<div class="input-prepend">
										<span class="add-on"><i class="icon-envelope"
											style="color: black;"></i></span> <input type="text" name="emailID"
											class="input-large" placeholder="Email Address">
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
								<td height="40"><button type="submit"
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