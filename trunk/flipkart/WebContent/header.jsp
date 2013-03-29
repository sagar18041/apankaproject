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
				<li><a href="#" style="color: white;">Contact Us</a></li>
				<li id="li_home"><a href="home" style="color: white;">Home</a></li>
				<li id="li_account"><a href="accountpage" style="color: white;">Account</a></li>
				<li><a href="#" style="color: white;">Wishlist</a></li>
				<li><a data-toggle="modal" href="#loginmodal"
					style="color: white;"
					onclick="show('forgotpassword','signup','login')">Login</a></li>
				<li><a data-toggle="modal" href="#loginmodal"
					style="color: white;"
					onclick="show('forgotpassword','login','signup')">Signup</a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" style="color: white;">Dropdown<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Menu 1</a></li>
						<li><a href="#">Menu 2</a></li>
					</ul></li>
			</ul>
		</div>

		<!-- Aamir Start -->
		<div id="loginmodal" class="modal-aamir" style="display: none;">
			<div class="modal-body">

				<s:form action="#" id="login">
					<a class="close" data-dismiss="modal"><b>x</b></a>
					<font size="3"><b>Login</b></font>
					<br />
					<br />
					<table>
						<tr>
							<td><font size="2">Email</font></td>
							<td><input type="text" name="emailID" /></td>
						</tr>
						<tr>
							<td width="100"><font size="2">Password</font></td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td width="100"></td>
							<td><button class="btn btn-primary pull-left" type="submit">Login</button>
								<font size="2"><a href="#" class="pull-right"
									onclick="toggle('forgotpassword')">Forgot your password?</a></font></td>
						</tr>
					</table>
					<br />
					<font size="2">Don't have an account?<a href="#"
						onclick="show('login','forgotpassword','signup')"> Create One!</a></font>
					<br />
				</s:form>
				<s:form id="signup" action="signup">
					<a class="close" data-dismiss="modal"><b>x</b></a>
					<font size="3"><b> New User? Sign Up</b></font>
					<br />
					<br />
					<table>
						<tr>
							<td><font size="2">Email Address</font></td>
							<td><input type="text" name="emailAddress" /></td>
						</tr>
						<tr>
							<td width="100"><font size="2">Password</font></td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td width="100"><font size="2">Repeat</font></td>
							<td><input type="password" name="repeat" /></td>
						</tr>
						<tr>
							<td width="100"></td>
							<td><button class="btn btn-success pull-left" type="submit">Sign
									Up Now!</button></td>
						</tr>
					</table>
					<br />
					<font size="2">Already have an account? <a href="#"
						onclick="show('signup','forgotpassword','login')"> Login! </a></font>
					<br />
				</s:form>
				<s:form id="forgotpassword" action="forgotpassword">
					<font size="2"><b>Forgot your Password? </b></font>
					<br />
					<font size="1">Enter your Email Address here to receive a
						link to change password. </font>
					<table>
						<tr height="10"></tr>
						<tr>
							<td width="100"><font size="2">Email</font></td>
							<td><input type="text" name="emailID" /></td>
						</tr>
						<tr>
							<td width="100"></td>
							<td><button class="btn btn-primary pull-left" type="submit">Send
									mail</button></td>
						</tr>
					</table>
				</s:form>
			</div>
			<div class="modal-footer-aamir">
				<a href="#" class="btn btn-mini-aamir" data-dismiss="modal">Close
					window x</a>
			</div>
		</div>
		<!-- Aamir End -->


	</div>
	<div id="subheading" style="background-color: #0EBCE4;">
		<div class="btn-group ">
			<button class="btn btn-warning span3">
				<b>See All Categories</b>
			</button>
			<button class="btn btn-warning dropdown-toggle"
				data-toggle="dropdown">
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu span3" role="menu" aria-labelledby="dLabel">
				<s:iterator value="categoryList">
					<li><a tabindex="-1" href="#"><s:property /></a></li>

				</s:iterator>
				<li class="dropdown-submenu"><a tabindex="-1" href="#">More
						options <span class="label label-important">NEW</span>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">Action</a></li>
						<li><a tabindex="-1" href="#">Another action</a></li>
						<li><a tabindex="-1" href="#">Something else here</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- dropdown end here -->
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<s:form action="search" method="get" theme="simple"
			cssClass="form-inline" style="display: inline;">
			<div class="input-append">
				<s:textfield name="searchString" cssClass="span5"
					placeholder="Search for items" />
				<div class="btn-group">
					<button class="btn" tabindex="-1" name="searchBy"
						value="All Category">
						<i class="icon-search"> </i><font color="gray"> in</font> All
						Category
					</button>
					<button class="btn dropdown-toggle" name="all"
						data-toggle="dropdown" tabindex="-1">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<s:iterator value="categoryList">
							<li><button class="btn btn-link" name="searchBy"
									value="<s:property/>">
									<i class="icon-search"> </i><font color="gray"> in</font>
									<s:property />
								</button></li>
						</s:iterator>
					</ul>
				</div>
			</div>
		</s:form>
		&nbsp; &nbsp; &nbsp; <a href="#" ><button class="fk-button-blue pull-right"><span
			class="cart-icon" ></span> Cart (value)</button></a>
	</div>

</body>
</html>

