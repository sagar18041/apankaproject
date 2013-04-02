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
<div class="row">
	<div class="span3">
	<div class="acct">
					<!-- changed nav-list -->
					<ul class="nav nav-list">
						<li class="nav-head">&nbsp;Select a Category</li>
						<li class="nav-heading">&nbsp;&nbsp;All Categories</li>
						<li class="dividertop"></li>
						<li><s:iterator value="searchCatg">
							<li class="divider"></li>
							<li><a href='#'><s:property value="categoryName"/> ( <s:property value="noOfItems"/> ) </a></li>
							<li class="divider"></li>
						</s:iterator>
						</li>
						<li class="dividerbottom"></li>
						
					</ul>
				</div>
				<br/>
		<ul class="thumbnails">
 		<li class="span3">
    	<div align="center" class="thumbnail">
    	<h5>Product Category</h5>
      	<img src="ViewResources/img/1.jpg" alt=""><br />
     	<a href="#">Item Name</a><br /><font color="#B40404"><b>Rs. 500</b></font><br />
     	<a href="#">Link to product category &rsaquo;&rsaquo;</a>
    	</div>
  		</li>
  		<li class="span3">
    	<div align="center" class="thumbnail">
    	<h5>Product Category</h5>
      	<img src="ViewResources/img/2.jpg" alt=""><br />
     	<a href="#">Item Name</a><br /><font color="#B40404"><b>Rs. 500</b></font><br />
     	<a href="#">Link to product category &rsaquo;&rsaquo;</a>
    	</div>
  		</li>
		</ul>
	</div>
	<div class="span9">
	<div class="row">
	
</div>
<div>
<div style="background-color:#E9E9E9; padding:2px 5px 5px 5px; height:30px; border-bottom-style:solid; border-bottom-width:5px; border-bottom-color:#C78407;">
<div><h5><a href="">Category Name</a></h5></div>
</div>
<div class="span9" style="margin-top:10px; margin-bottom:10px">
<div class="span2">
      	<img src="ViewResources/img/2.jpg" alt=""><br />
     	<a href="#">Item Name</a><br /><font color="#B40404"><b>Rs. 500</b></font><br />
     	<ul>
     	<li>some featres</li>
     	<li>some featres</li>
     	<li>some featres</li>
     	</ul>
</div>
<div class="span2">zxcz</div>
<div class="span2">zxcz</div>
<div class="span2">zxcz</div>
</div>
<div><span style="background-color:#E9E9E9;">Featured: <a href="">Best Seller </a>|<a href=""> Android </a>|</span></div>
</div>
<br /><br />
<div>
<div style="background-color:#E9E9E9; padding:2px 5px 5px 5px; height:30px; border-bottom-style:solid; border-bottom-width:5px; border-bottom-color:#C78407;">
<div><h5><a href="">Category Name</a></h5></div>
</div>
<div class="span9" style="margin-top:10px; margin-bottom:10px">
<div class="span2">
      	<img src="ViewResources/img/2.jpg" alt=""><br />
     	<a href="#">Item Name</a><br /><font color="#B40404"><b>Rs. 500</b></font><br />
     	<ul>
     	<li>some featres</li>
     	<li>some featres</li>
     	<li>some featres</li>
     	</ul>
</div>
<div class="span2">zxcz</div>
<div class="span2">zxcz</div>
<div class="span2">zxcz</div>
</div>
<div><span style="background-color:#E9E9E9;">Featured: <a href="">Best Seller </a>|<a href=""> Android </a>|</span></div>
</div>

</div>
</div>
<br /><br />
<div style="border-style:solid; border-color:#E9E9E9; border-width:1px;" class="row">
recomendation will here
</div>
</body>
</html>