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
<script type="text/javascript">
	function LoginFormValidator() {

		if (login.emailAddress.value == "") {
			alert("Please enter email address !");
			login.emailAddress.focus();
			return (false);
		}

		if (login.password.value == "") {
			alert("Please enter password !");
			login.password.focus();
			return (false);
		}

		return (true);
	}
</script>
<script type="text/javascript">
	function signUpFormValidator() {

		if (signup.emailAddress.value == "") {
			alert("Please enter email address !");
			signup.emailAddress.focus();
			return (false);
		}

		if (signup.password.value == "") {
			alert("Please enter password !");
			signup.password.focus();
			return (false);
		}

		if (signup.repeat.value == "") {
			alert("Please re-enter password !");
			signup.repeat.focus();
			return (false);
		}

		if (signup.password.value != signup.repeat.value) {
			alert("The given passwords do not match !");
			return (false);
		}

		return (true);
	}
</script>
<script type="text/javascript">
	function forgotPasswordFormValidator() {

		if (forgotpassword.emailAddress.value == "") {
			alert("Please enter email address !");
			forgotpassword.emailAddress.focus();
			return (false);
		}
		return (true);
	}
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  *** Added By Neha to call Search Action*** -->
<script>
 $('.selectpicker').selectpicker({
     style: 'btn-info',
     size: 4
 });
 
 function callSearch()
 {
	 setInterval(function(){ if(event.keyCode == 13)
	 {
	 
	 var search = document.getElementById("search").value;
	// alert("Search " + search);
	 var catId = document.getElementById("categorySel");
	 var category = catId.options[catId.selectedIndex].value;
	// alert(category);
	 window.location = "searchPage?searchText=" + search + "&categorySel=" + category;
	 }}, 5000);
 }
 </script>
 <!-- **** END **** -->
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
				<s:if test="#session['login']==true">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="color: white;"><s:property
								value="#session['emailAddress']" /><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="logout">Logout</a></li>
							<li><a href="#">Menu 2</a></li>
						</ul></li>
				</s:if>
			</ul>
		</div>

		<!-- Aamir Start -->
		<div id="loginmodal" class="modal-aamir" style="display: none;">
			<div class="modal-body">

				<s:form action="login" id="login"
					onsubmit="return LoginFormValidator()">
					<a class="close" data-dismiss="modal"><b>x</b></a>
					<font size="3"><b>Login</b></font>
					<br />
					<br />
					<table>
						<tr>
							<td><font size="2">Email</font></td>
							<td><input type="text" name="emailAddress" /></td>
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
				<s:form id="signup" action="signup"
					onsubmit="return signUpFormValidator()">
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
				<s:form id="forgotpassword" action="forgotpassword"
					onsubmit="return forgotPasswordFormValidator()">
					<font size="2"><b>Forgot your Password? </b></font>
					<br />
					<font size="1">Enter your Email Address here to receive a
						link to change password. </font>
					<table>
						<tr height="10"></tr>
						<tr>
							<td width="100"><font size="2">Email</font></td>
							<td><input type="text" name="emailAddress" /></td>
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
  		<button class="btn btn-warning span3"><b>See All Categories</b></button>
  		<button class = "btn btn-warning dropdown-toggle" data-toggle="dropdown">
   		 <span class="caret"></span></button>
  		<ul class="dropdown-menu span3" role="menu" aria-labelledby="dLabel">
				<s:iterator value="catalogueList" var ="catList">
					<s:if test="%{#catList.catalogueLevel==0}">
					<li class="dropdown-submenu"><a href="#"><s:property value="#catList.catalogueName"/></a>
						<ul class="dropdown-menu">
						<s:iterator value="catalogueList" var ="subcatList">
						<s:if test="%{#catList.catalogueParentID==#subcatList.catalogueID && #subcatList.catalogueLevel==1}">
							<li class="dropdown-submenu"><a href="#"><s:property value="#subcatList.catalogueName" /></a>
								<ul class="dropdown-menu">
									<s:iterator value="catalogueList" var="subsubcatList">
										<s:if test="%{#subsubcatList.catalogueID==#subcatList.catalogueParentID && #subsubcatList.catalogueLevel==2}">
											<li>
												<a href="#"><s:property value="#subsubcatList.catalogueName" /></a>
											</li>
										</s:if>
									</s:iterator>
								</ul>
							</li>
						</s:if>
						</s:iterator>
						</ul>
					</li>
					</s:if>
				</s:iterator>
				<li class="dropdown-submenu"><a href="#">More
						options <span class="label label-important">NEW</span>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">Action</a></li>
						<li><a tabindex="-1" href="#">Another action</a></li>
						<li><a tabindex="-1" href="#">Something else here</a></li>
					</ul></li>
			</ul></div> <!-- dropdown end here -->&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 		<s:form action="searchPage" method="post" theme="simple" cssClass="form-inline" style="display: inline;">
  			<div class="input-append">
  				<input type="text" data-provide="typeahead" class="span4" 
  				placeholder="Search for items" id="search" name="searchText"
  				 data-source='<s:property value="autoCompleteList"/>' onkeypress="callSearch()" />
  			
    				 
    			<div class="btn-group">
              
               <select class="selectpicker" id="categorySel" name="categorySel">
               		<option></i><font color="gray">  in</font> All Category</option>
               	<s:iterator value="categoryList">
               		<option></i><font color="gray">  in</font> <s:property/></option>
               	</s:iterator>
               </select>
                
               <span class="add-on" ><i class="icon-search"></i></span>
              </div>
  			</div>
		</s:form>
		&nbsp; &nbsp; &nbsp; 
			<a href="displayCart.action" class="btn btn-primary pull-right"><i class="icon-shopping-cart"></i> Cart (value)</a>
		</div>
</body>
</html>

