
<%@ page language="java" contentType="text/html;"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!doctype html>
<html>
<head>

</head>

<body>
    <div class="wrapper">
   		
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
   
                
         
            <div class="clearfix"></div>
			
		
        
        <div class="clearfix"></div>

		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
        
    </div> <!--컨테이너 끝 -->

  
		    <script src="/js/custom.js"></script>
	
</body>
 <style>
      html{
 	     height: auto;
      }
 </style>
</html>
