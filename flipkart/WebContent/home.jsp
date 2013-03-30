<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
     <script>
 function searchAction()
 {
	 if(event.keyCode == 13)
	 	{
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
	<!-- Offer Product Slide Show Start-->
	<div class="span9">
		
		<div id="myCarousel" class="carousel slide">
               
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="ViewResources/img/1.jpg" alt="">
                    <div class="carousel-caption">
                    </div>
                  </div>
                  <div class="item">
                    <img src="ViewResources/img/2.jpg" alt="">
                    <div class="carousel-caption">
                    </div>
                  </div>
                  <div class="item">
                    <img src="ViewResources/img/3.jpg" alt="">
                    <div class="carousel-caption">
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
              </div>
              </div>
  <!-- Offer Product Slide Show End-->
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
<div class="row-fluid" style="border-style:solid; border-color:#6E6E6E; border-width:1px;" >
<div class="span4" style="border-right:thin dotted #6E6E6E;"><b>You Recently Viewed</b></div>
<div class="span8"><b>Recommendations Based On Your Browsing History</b></div>
</div>
<hr size="3" color="#6E6E6E" />
<hr size="3" color="#6E6E6E" />
  </body>
</html>