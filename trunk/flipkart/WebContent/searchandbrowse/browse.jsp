<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.acct {
	background-color: white;
	border: 1px solid #E0E0EB;
	-moz-box-shadow: 3px 3px 5px #888888; /* Old Firefox */
	box-shadow: 3px 3px 5px #888888;
}

.nav-heading {
	width: auto;
	padding: 5px;
	font-size: 12px;
	font-weight: bold;
	line-height: 20px;
	color: black;
	background-color: #E0E0EB;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
	font-size: 16px;
	padding: 5px;
	font-size: 16px;
	height: 25px;
}

.nav-head {
	width: auto;
	padding: 8px;
	font-size: 16px;
	font-weight: normal;
	line-height: 20px;
	color: white;
	background-color: #014A72;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
}

.nav-list .dividertop {
	*width: 100%;
	height: 1px;
	margin: 0px 0px;
	*margin: 0px 0 0px;
	overflow: hidden;
	background-color: #e5e5e5;
	border-bottom: 1px solid #ffffff;
	border-bottom-width: 10px;
}

.nav-list .dividerbottom {
	*width: 100%;
	height: 1px;
	margin: 0px 1px;
	*margin: 0px 0 0px;
	overflow: hidden;
	background-color: #e5e5e5;
	border-top: 1px solid #ffffff;
	border-top-width: 10px;
}
</style>
</head>
<body>
<div>
<!-- ************ Code for Item Display **************** -->
<div style="width:1170px;height:500px;">


 <div style="background-color:#E9E9E9; padding:2px 5px 5px 5px;
  height:30px; border-bottom-style:solid; border-bottom-width:5px; border-bottom-color:#C78407; ">
<div><h5><a href=""><s:property value="key"/></a></h5></div>
</div>
<div  style="width:1170px; overflow:auto;">
<table>
	<tr>
	<s:iterator value="searchAttr">
	<td>
<div class="span3" style="margin-top:10px; margin-bottom:10px">
<div class="span2">
		<a href="displayitem?itemID=<s:property value="itemID"/>">
      	<img src="<s:property value="itemImg"/>" alt="" width="80px" height="60px"><br />
     	<s:property value="itemName"/><br /><font color="#B40404"><b>Price: Rs. <s:property value="price"/></b></font><br />
     	<ul>
     	<s:iterator value="attr">
     	<li><s:property value="value"/></li>
     	</s:iterator>
     	</ul></a>
</div>
</div>
</td>
</s:iterator>
	</tr>
</table>

</div>
<br /><br />

</div>

<!-- ************ End Of Code for Item Display **************** -->
</div>
</body>
</html>