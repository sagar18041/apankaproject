<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script type="text/javascript" src="jScript/common.js"></script>
<title>Payment Page</title>

</head>
<body>
<div>
	<div class="span12" id="gnheader">
		
		<!-- header starts here -->
		<div>
			<div align="center">
				<span>
					<a rel="nofollow" href="index.jsp">
						<img border="0" src="ViewResources/img/images.jpg" />
					</a>
				</span>
			</div>
		</div>
		<br/><br/><br/><br/><br/><br/>
		<div class="span3"></div>
		
		<div align="center">
				<s:form theme="simple" method="post" action="bankEntry">
					<table>
						<tr>
							<td>Customer Id</td>
							<td><s:textfield required="true" label="CustomerId" name="customerid"/></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><s:password required="true" label="password" name="password" /></td>
						</tr>
					</table>
					<s:submit value="Pay" cssClass="btn btn-primary"
									 />
				</s:form>
			</div>
		
</div>

</body>
</html>