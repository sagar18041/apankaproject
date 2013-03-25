<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body >
<div class="container-fluid" >
	<div class="pull-left" style="padding-top: 10px;">
	<a href="home.action"><img src="ViewResources/img/flipkartlogo.png"/></a>
	</div>
	<div class="pull-right">
		<ul class="nav nav-pills">
			<li><a href="#" style="color: white;">Contact Us</a></li>
			<li id="li_home"><a href="home" style="color: white;">Home</a></li>
			<li id="li_account"><a href="accountpage" style="color: white;">Account</a></li>
			<li><a href="#" style="color: white;">Wishlist</a></li>
			<li><a href="#" style="color: white;">Login</a></li>
			<li><a href="#" style="color: white;">Signup</a></li>
			
			 <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white;">Dropdown<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Menu 1</a></li>
                  <li><a href="#">Menu 2</a></li>
                </ul>
              </li>
		</ul>
	</div>
	</div>
	<div id="subheading" style="background-color: #0EBCE4;">
	<div class="btn-group ">
  		<button class="btn btn-warning span3"><b>See All Categories</b></button>
  		<button class = "btn btn-warning dropdown-toggle" data-toggle="dropdown">
   		 <span class="caret"></span></button>
  		<ul class="dropdown-menu span3" role="menu" aria-labelledby="dLabel">
    		<li class="dropdown-submenu">
   			<a tabindex="-1" href="#">More options</a>
    			<ul class="dropdown-menu">
    				<li><a tabindex="-1" href="#">Action</a></li>
    				<li><a tabindex="-1" href="#">Another action</a></li>
    				<li><a tabindex="-1" href="#">Something else here</a></li>
    			</ul>
    	 	</li>
    		<li class="divider"></li>
 		</ul></div> <!-- dropdown end here -->&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 		<s:form action="search" method="get" theme="simple" cssClass="form-inline" style="display: inline;">
  			<div class="input-append">
   				 <s:textfield	 name="searchString" cssClass="span5" placeholder="Search for items"/>
    			<div class="btn-group">
                <button class="btn" tabindex="-1" name="searchBy" value="All Category" ><i class="icon-search">  </i><font color="gray">  in</font> All Category</button>
                <button class="btn dropdown-toggle" name="all" data-toggle="dropdown" tabindex="-1">
                 	<span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <s:iterator value="categoryList">
                  <li><button class="btn btn-link" name="searchBy" value="<s:property/>"><i class="icon-search">  </i><font color="gray">  in</font> <s:property/> </button></li>
                  </s:iterator>
                </ul>
              </div>
  			</div>
		</s:form>
		&nbsp; &nbsp; &nbsp; 
			<a href="#" class="btn btn-primary pull-right"><i class="icon-shopping-cart"></i> Cart (value)</a>
		</div>
	
</body>
</html>

