<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
    <h3 id="myModalLabel">Book Title</h3>
  </div>
  <div class="modal-body">
    <div id="viewerCanvas" style="width: 520px; height: 410px"></div>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>
  </body>
</html>