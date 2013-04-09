<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Google Books Embedded Viewer API Example</title>
<%-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> --%>
<script type="text/javascript">
	google.load("books", "0");

	function initialize() {
		var viewer = new google.books.DefaultViewer(document
				.getElementById('viewerCanvas'));
		viewer.load('ISBN:0321679695');
	}

	google.setOnLoadCallback(initialize);
</script>
</head>
<body>
	<a href="#myModal" role="button" class="btn" data-toggle="modal">Book
		Preview</a>

	<s:form action="addToCart" method="post">
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">Book Title</h3>
			</div>
			<div class="modal-body">
				<div id="viewerCanvas" style="width: 520px; height: 410px"></div>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div>
		<br />
		<!-- Product Display -->
		<!-- Product Image -->
		<div class="row-fluid">

			<div class="span3"
				style="border: thin solid #EFF2FB; padding-left: 30px; padding-right: 30px; padding-top: 10px; padding-bottom: 5px;">
				<a href="#" class="thumbnail"> <img
					src="ViewResources/img/1.jpg" style="width: 300px; height: 200px;"
					alt="">
				</a>
				<p align="center">
					<a href="#"><small>View Larger Images</small></a>
				</p>

			</div>
			<!--End of Product Image -->
			<!-- Product Main Details -->

			<div class="span9">

				<s:iterator value="prod">
					<!-- item ID <s:property value="itemID"/><br />  -->
					<strong><s:property value="itemName" /></strong>
					<br />
					<span
						class="rating-static rating-<s:property value="finalRating"/>0"></span>
					<img src="ViewResources/img/wishlist.png" />
					<a href="#" />Add to wishlist link here</a>
					<hr />
					<!-- Product ID<s:property value="productID"/><br />  -->
					<s:hidden name="itemID" value="%{itemID}" />
					<s:hidden name="itemName" value="%{itemName}" />

				</s:iterator>

				<hr />
				<s:iterator value="attrib" var="attrwarranty">
					<s:if test="%{#attrwarranty.attribute=='warrantydetails'}">
						<hr />
						<s:property value="#attrwarranty.value" />
						<hr />
					</s:if>

				</s:iterator>



				<div class="row-fluid">
					<br />
					<div class="span4">

						<s:iterator value="attrib" var="attr1">
							<s:if test="%{#attr1.attribute=='price'}">
		offer details later
		<br />
								<b><font size="3" color="#B40404">Rs. <s:property
											value="#attr1.value" /></font></b>
								<br />
								<font size="1" color="#A4A4A4">Inclusive of taxes</font>

								<s:hidden name="price" value="%{#attr1.value}" />
							</s:if>
						</s:iterator>
					</div>
					<div class="span5">
						<b><font color="#088A08">stock checking goes here</font></b> <br />
						<s:iterator value="attrib" var="attrdelivery">
							<s:if test="%{#attrdelivery.attribute=='deliverytime'}">
	Delivered in <s:property value="#attrdelivery.value" /> business days.
	</s:if>
						</s:iterator>
					</div>
				</div>

				<br /> <font size="2">Free Shipping if total order amount is
					Rs. 500 or above. Add Rs. 50 otherwise.</font> <br /> <br />
				<div class="row-fluid">
					<div class="span6">
						<div align="center" class="well">
							<s:submit cssClass="btn btn-large btn-block btn-warning"
								value="Buy This Now"></s:submit>
						</div>
					</div>
					<div class="span3">
						<div class="well">
							<font size="2" color="#848484">with an option to pay <br />
								<b>Cash on Delivery</b></font>
						</div>
					</div>
				</div>
			</div>



			<!-- End of Product Main Details -->
		</div>
		<hr />

		<div class="row-fluid">
			<div class="span9">
				<!-- Product More Details -->
				<strong>Product Specifications</strong>
				<table class="table table-bordered">
					<caption></caption>
					<thead>
					</thead>
					<tbody>
						<s:iterator value="attrib" var="attr">
							<tr>
								<td><s:property value="#attr.attribute" /></td>
								<td><s:property value="#attr.value" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<!-- End of Product more Details -->
			</div>
			<div class="span3"
				style="border: thin solid #BDBDBD; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">
				<img src="ViewResources/img/ads.jpg" />
			</div>
		</div>
		<hr />
		<!-- Display Product Review -->
		<s:iterator value="review">
			<div class="row-fluid">
				<div class="span2">
					<b><s:property value="userName" /></b><br />
					<s:property value="reviewDate" />
				</div>
				<div class="span7">
					<b><s:property value="reviewTitle" /></b> <br />
					<s:property value="reviewText" />
				</div>
			</div>
			<hr />
		</s:iterator>
		<!-- End of Product Review -->
		<!-- End of Product Display -->


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
	</s:form>
</body>
</html>