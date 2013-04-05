<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Google Books Embedded Viewer API Example</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("books", "0");

      function initialize() {
        var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
        viewer.load('ISBN:0321679695');
      }

      google.setOnLoadCallback(initialize);
    </script>
  </head>
  <body>
  <a href="#myModal" role="button" class="btn" data-toggle="modal">Book Preview</a>
  
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
      <div class="span3"  style="border: thin solid #EFF2FB; padding-left: 30px; padding-right: 30px; padding-top: 10px; padding-bottom: 5px;">  	
   			<a href="#" class="thumbnail">
    			<img src="ViewResources/img/1.jpg" style="width: 300px; height: 200px;" alt="">
			</a> 		
			<p align="center"><a href="#"><small>View Larger Images</small></a></p>
		
      </div>
<!--End of Product Image -->
<!-- Product Main Details -->
      <div class="span9">
      <s:iterator value="prod">
	<!-- item ID <s:property value="itemID"/><br />  -->
	<strong><s:property value="itemName"/></strong>
	<br />
	<img src="ViewResources/img/wishlist.png" /> <a href="#">Add to wishlist link here</a>
	<hr />
	some other details here
	<!-- Product ID<s:property value="productID"/><br />  -->
	</s:iterator>
	<hr />
	<div class="row-fluid">
	<div class="span4">
	<s:iterator value="attrib" var="attr1">
	<s:if test="%{#attr1.attribute=='price'}">
		offer details later
		<br />
		<b><font size="3" color="#B40404">Rs. <s:property value="#attr1.value"/></font></b>
		<br />
		<font size="1" color="#A4A4A4">Inclusive of taxes</font>
	</s:if>
	</s:iterator>
	</div>
	<div class="span5">
	<b><font color="#088A08">stock checking goes here</font></b>
	<br />
	Delivery detail goes here
	</div>
	</div>
	<br />
	<font size="2">Free Shipping if total order amount is Rs. 500 or above. Add Rs. 50 otherwise.</font>
	<br /><br />
	<div class="row-fluid">
		<div class="span6">
			<div align="center" class="well">
			<a class="btn btn-large btn-block btn-warning" href="#"><b>Buy This Now</b></a>
			</div>
		</div>
		<div class="span3">
			<div class="well">
			<font size="2" color="#848484">with an option to pay <br /><b>Cash on Delivery</b></font>
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
      <td><s:property value="#attr.attribute"/></td>
      <td><s:property value="#attr.value"/></td>
    </tr>
  </s:iterator>
  </tbody>
</table>
<!-- End of Product more Details -->
	</div>
	<div class="span3"  style="border: thin solid #BDBDBD; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;">
		<img src="ViewResources/img/ads.jpg" /> 
	</div>
</div>
<hr />
<!-- Display Product Review -->
<s:iterator value = "review" >
<div class="row-fluid">
	<div class="span2">
	<b><s:property value="userName" /></b><br />
	<s:property value="reviewDate" />
	</div>
	<div class="span7">
	<b><s:property value = "reviewTitle" /></b>
	<br /><s:property value = "reviewText" />
	</div>
</div>
<hr />
</s:iterator>
<!-- End of Product Review -->
<!-- End of Product Display -->


  </body>
</html>