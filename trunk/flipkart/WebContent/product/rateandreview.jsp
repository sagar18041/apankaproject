<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rate & Review Product</title>
</head>
<body>
<div class="row-fluid">
<div class="span3">
<s:iterator value="prod">
<b>You have chosen to review</b><br/><br />
<a href="#"> <img
					src='<s:property value="thumbnail"/>' style="width: 100px; height: 100px;"
					alt="">
				</a><br /> <br />
<strong><s:property value="itemName" /></strong>
</s:iterator>
</div>
<div class="span9">
<h4>Help others! Write a Flipkart review</h4><hr />
<p><font size="1" color="#A4A4A4">
<a href="#">Guidelines for writing a product review</a>
<br />
All fields are mandatory</font><p>
<s:form action="saverateandreview.action" method="post">
<div class="well">
<b>Review Title:</b> <s:textfield name="reviewTitle" cssClass="input-xxlarge" />
<br /><font size="1" color="#A4A4A4">(Maximum 20 words)</font>
</div>
<div class="well">
<font size="1" color="#A4A4A4">Please do not include: HTML, references to other retailers, 
pricing, personal information, any profane, inflammatory or copyrighted comments, or any copied 
content.</font><br />
<b>Your Review:</b> <s:textarea name="reviewText" cssClass="input-xxlarge" rows="5"/>
<br /><font size="1" color="#A4A4A4">(Please make sure your review contains at least 200 characters.)</font>
</div>
<div class="well">
<b>Your Rating:</b>
<select name="ratingStar" > 
    <option value="-1">Give Rating</option> 
    <option value="1">1</option> 
    <option value="2">2</option> 
    <option value="3">3</option> 
    <option value="4">4</option> 
    <option value="5">5</option> 
</select> <br />
<font size="1" color="#A4A4A4">(Click to rate on scale of 1-5)</font>
</div>
<div class="well">
<s:iterator value="prod">
<s:hidden name="itemID" value="%{itemID}" />
</s:iterator>
<s:submit name="commandButton" value="submit" align="center"
							cssClass="fk-button-blue" />
							</div>
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
</div>
</div>
</body>
</html>