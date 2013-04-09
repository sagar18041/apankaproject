<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>

<script type="text/javascript">
	function toggle(id) {
		if (document.getElementById(id).style.display == "block") {
			document.getElementById(id).style.display = "none";
		} else {
			document.getElementById(id).style.display = "block";
		}
	}
	function show(id1, id2, id3) {
		document.getElementById(id1).style.display = "none";
		document.getElementById(id2).style.display = "none";
		document.getElementById(id3).style.display = "block";
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
	<div class="container-fluid">
		<div class="pull-left" style="padding-top: 10px;">
			<a href="home.action"><img
				src="ViewResources/img/flipkartlogo.png" /></a>
		</div>
		<div class="pull-right">
			<ul class="nav nav-pills">
				<s:if test="#session['login']==null">
					<li><a href="adminlogininit" style="color: white;">Login</a></li>
				</s:if>
				<s:if test="#session['login']==true">
					<li id="li_home"><a href="adminhome" style="color: white;">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: white;"><s:property
								value="#session['emailAddress']" /><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="logout">Logout</a></li>
						</ul></li>
				</s:if>
			</ul>
		</div>
	</div>
</body>
</html>

