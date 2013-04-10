<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
	<div class="container-fluid">
		<s:if test="#session['userID']==null">
			<div class="pull-left" style="padding-top: 10px;">
				<a href="home.action"><img
					src="ViewResources/img/flipkartlogo.png" /></a>
			</div>
		</s:if>

		<s:else>
			<div class="pull-left" style="padding-top: 10px;">
				<a href="adminhome"><img
					src="ViewResources/img/flipkartlogo.png" /></a>
			</div>
		</s:else>

		<div class="pull-right">
			<ul class="nav nav-pills">

				<s:if test="#session['login']==true">
					<li><a href="adminhome" style="color: white;">Home</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: white;">Category<b
							class="caret"></b></a>
						<ul class="dropdown-menu pull-right">
							<li><a href="adminviewcategory">View Category</a></li>
							<li><a href="adminaddcategory">Add Category</a></li>
							<li><a href="adminverifycategory">Verify Category</a></li>
						</ul>
					</li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: white;">Product<b
							class="caret"></b></a>
						<ul class="dropdown-menu pull-right">
							<li><a href="adminproductinit">Add New Product</a></li>
							<li><a href="#">Add link</a></li>
							<li><a href="#">Add link</a></li>
						</ul>
					</li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: white;">Bank<b
							class="caret"></b></a>
						<ul class="dropdown-menu pull-right">
							<li><a href="getAllCustomers">Customers</a></li>
							<li><a href="netbankingviewentries">Net Banking</a></li>
							<li><a href="#">Add link</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: white;"><s:property
								value="#session['userID']" /><b class="caret"></b></a>

						<ul class="dropdown-menu pull-right">
							<li><a href="logout">Logout</a></li>
						</ul></li>

				</s:if>

			</ul>
		</div>
	</div>
</body>
</html>

