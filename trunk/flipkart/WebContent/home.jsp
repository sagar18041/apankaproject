<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script>
	function searchAction() {
		if (event.keyCode == 13) {
			alert(document.getElementById("search").value);
		}
	}
</script>

<title>Home</title>
</head>
<body>
	<div class="row">
		<div class="span3">
			<ul class="thumbnails">
			<s:iterator value="prod" var="product">
			<li class="span3">
					<div align="center" class="thumbnail">
			
				<a href="displayitem.action?itemID=<s:property value="#product.itemID" />"><h5><s:property value="#product.itemName"/></h5>
				<img src="<s:property value="#product.thumbnail"/>" height="120px" width="60px" alt="" /></a>
			<s:iterator value="trendingitm" var="itm">
			<s:if test="%{#product.itemID == #itm.key}">
			<s:iterator value="#itm.value" var ="attb">
			<s:if test="%{#attb.itemID == #itm.key}">
			<br /> <br />
				<font color="#B40404"><b>Rs.
								<s:property value="#attb.value"/></b></font>
								</s:if>
			</s:iterator>
  			<br />
  						</s:if>
			</s:iterator>

			
			</div>
			</s:iterator>
			</ul>
			
		</div>
		
		<div class="span9">

			<div class="row">
				<!-- Offer Product Slide Show Start-->
				<div class="span9">

					<div id="myCarousel" class="carousel slide">

						<div class="carousel-inner">
							<div class="item active">
								<img src="ViewResources/img/1.jpg" alt="">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="ViewResources/img/2.jpg" alt="">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="ViewResources/img/3.jpg" alt="">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
							href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
				</div>
				<!-- Offer Product Slide Show End-->
			</div>
			<div>
				<div
					style="background-color: #E9E9E9; padding: 2px 5px 5px 5px; height: 30px; border-bottom-style: solid; border-bottom-width: 5px; border-bottom-color: #C78407;">
					<div>
						<h5>
							Top Selling Products
						</h5>
					</div>
				</div>
				<div class="span9" style="margin-top: 10px; margin-bottom: 10px">
				<ul class="thumbnails">
			<s:iterator value="prodtopselling" var="producttopselling">
			<li class="span2">
					<div align="center" class="thumbnail">
			
				<a href="displayitem.action?itemID=<s:property value="#producttopselling.itemID" />"><h5><s:property value="#producttopselling.itemName"/></h5>
				<img src="<s:property value="#producttopselling.thumbnail"/>" height="120px" width="60px" alt="" /></a>
			<s:iterator value="topsellingitm" var="itmtopselling">
			<s:if test="%{#producttopselling.itemID == #itmtopselling.key}">
			<s:iterator value="#itmtopselling.value" var ="attbtopselling">
			<s:if test="%{#attbtopselling.itemID == #itmtopselling.key}">
			<br /> <br />
				<font color="#B40404"><b>Rs.
								<s:property value="#attbtopselling.value"/></b></font>
								</s:if>
			</s:iterator>
  			<br />
  						</s:if>
			</s:iterator>

			
			</div>
			</s:iterator>
			</ul>
			</div>
			<br /> <br />
			

		</div>
	</div>
	<br />
	<br />
	</div>
	<div class="row" style="hieght:"> </div>
	<div class="row-fluid"
			style="border-style: solid; border-color: #6E6E6E; border-width: 1px;">
			<div class="span4"
				style="padding: 5px 5px 5px 5px; border-right: thin dotted #6E6E6E;">
				<b>You Recently Viewed</b> <br /> <br />
				<s:iterator value="recentlyViewedItems">
					<div class="row-fluid">
						<div class="span4">
							<a
								href="displayitem.action?itemID=<s:property value = "itemID"/>">
								<img src="<s:property value = "thumbnail"/>" height="40px"
								width="40px">
							</a>
						</div>
						<div class="span8">
							<a
								href="displayitem.action?itemID=<s:property value = "itemID"/>"><s:property
									value="itemName" /></a> <br /> <b><font size="1"
								color="#B40404">Rs. <s:property value="price" /></font></b>
						</div>
					</div>
					<br />
				</s:iterator>
			</div>
			<div class="span8" style="padding: 5px 5px 5px 5px;">
				<b>Recommendations Based On Your Browsing History</b> <br /> <br />
				<div class="row-fluid">
					<s:iterator value="browsingHistoryItems">
						<div class="span4">
							<a
								href="displayitem.action?itemID=<s:property value = "itemID"/>">
								<img src="<s:property value = "thumbnail"/>" height="100px"
								width="80px">
							</a> <br /> <a
								href="displayitem.action?itemID=<s:property value = "itemID"/>"><s:property
									value="itemName" /></a> <br /> <b><font size="1"
								color="#B40404">Rs. <s:property value="price" /></font></b>
						</div>
					</s:iterator>
				</div>

			</div>
		</div>
</body>
</html>