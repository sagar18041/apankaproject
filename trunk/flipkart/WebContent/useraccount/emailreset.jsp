<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="span9">
		<h3>
			Update Email
		</h3><br/>


		<div align="center">
			<s:form action="emailreset" method="post">
				<input type="hidden" name="newEmailAddress" value="<s:property
									value="newEmailAddress" />" />
				<table class="table">
					<tbody>

						<tr>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'>New Email
								Address</td>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'><s:property
									value="newEmailAddress" /></td>
						</tr>

						<tr>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'>Old Account Password</td>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'><s:password
									name="oldPassword" cssClass="input-large" /></td>
						</tr>

						<tr>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'>New
								Password</td>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'><s:password
									name="newPassword" cssClass="input-large" /></td>
						</tr>

						<tr>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'>Retype
								New Password</td>
							<td
								style='text-align: left; vertical-align: middle; font-size: 14px'><s:password
									name="retypedPassword" cssClass="input-large" /></td>
						</tr>

					</tbody>
				</table>
				<br />

				<s:submit name="commandButton" value="Update Email" align="center"
					cssClass="fk-button-blue" />

			</s:form>
			<s:if test="hasActionMessages()">
				<div align="center">
					<s:iterator value="actionMessages">
						<div class="alert alert-success">
							<br /> <i class="icon-ok icon-2x"></i>&nbsp;&nbsp;
							<s:property />
							<br /> <br />
						</div>
					</s:iterator>

				</div>
			</s:if>

			<s:if test="hasActionErrors()">
				<div align="center">
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<br /> <i class="icon-remove icon-2x"></i>&nbsp;&nbsp;
							<s:property />
							<br /> <br />
						</div>
					</s:iterator>

				</div>
			</s:if>
		</div>
	</div>
</body>
</html>