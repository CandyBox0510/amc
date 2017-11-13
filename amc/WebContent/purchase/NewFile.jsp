<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% int index = (int)(java.lang.Math.random()*3.0); %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body>
<!-- header -->
<div class="modal-header">
    <!-- ´Ý±â(x) ¹öÆ° -->
  <button type="button" class="close" data-dismiss="modal">¡¿</button>
  <!-- header title -->
  <h4 class="modal-title">Header</h4>
</div>
<!-- body -->
<div class="modal-body">
    Body 
</div>
<!-- Footer -->
<div class="modal-footer">
    Footer
  <button type="button" class="btn btn-default" data-dismiss="modal">´Ý±â</button>
</div>


</body>
</head>
</html>