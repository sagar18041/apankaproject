<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="width:1170px; overflow:auto;">
<h3>Compare</h3>

<table class="table table-bordered">
<tr>
<s:iterator value="prod" var="prod1">

<td>
<div class="span4"><s:property value="itemName"/><br /><br /><img src='<s:property value="thumbnail"/>' height="150px" width="120px"/>
<br /></div>
<div class="span4">
<s:iterator value="attrib" var="attr1">
<s:if test="%{#attr1.itemID==#prod1.itemID}">
<hr />
<s:property value="#attr1.value"/>
<br />

</s:if>

</s:iterator>
</div>
</td>

</s:iterator>
</tr>
</table>
</div>
</body>
</html>