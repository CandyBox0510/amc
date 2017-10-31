<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page contentType="text/html; charset=EUC-KR" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"><!-- Basic Page Needs -->
        <meta charset="utf-8">

    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
    <style type="text/css">
    
    	.add__input {
		  font-size: 13px;
		  color: #b4b1b2;
		  width: 100%;
		  -webkit-box-shadow: none;
		  box-shadow: none;
		  -webkit-appearance: none;
		  border: 1px solid #dbdee1;
		  -webkit-border-radius: 3px;
		  -moz-border-radius: 3px;
		  border-radius: 3px;
		  margin: 5px 0;
		  padding: 9px;
		}
		#title {
		font-size: 13px;
 		margin-top: 15px;
		 text-align : right;
		/*  vertical-align : middle;
		 margin : 0 auto; */
		}
		
		#context {
		font-size: 13px;
 		margin-top: 15px;
		 text-align : left;
		/*  vertical-align : middle;
		 margin : 0 auto; */
		}
		
		#addFreeBoardConetext {
			  width: 100%;
			  min-height: 500px;
			  padding: 8px 19px;
			  -webkit-border-radius: 3px;
			  -moz-border-radius: 3px;
			  border-radius: 3px;
			  background-color: #ffffff;
			  border: solid 2px #dbdee1;
			  font-size: 13px;
			  color: #b4b1b2;
			}
			
			#add {
			  text-align : left;
			}
			
			

    </style>
    
</head>

<body>
<div class="container">
    <div class="wrapper">
    	<div class="col-md-12">
  				<h2 class="page-heading"> 게시글 등록</h2>
  				<form class="addFreeBoard">
  					<div class ="field">
  					<div class='col-md-1' id="title">제목</div>
  					<div class='col-md-11'><input type='text' name='freeBoardTitle' class="add__input"></div>
  					<div class='field' >
  						<div class='col-md-12' id="context"><textarea id="addFreeBoardConetext"></textarea></div>
  					</div>
  					</div>
  					<div class="col-md-12l">
                        <button type='submit' class="btn btn-md btn--warning btn--wider" id="add">등록하기</button>                   
                    </div>
  				</form>
                            
        
   		    <div class="clearfix"></div>
        </div>
    </div>
</div>

	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>
        

</body>
</html>