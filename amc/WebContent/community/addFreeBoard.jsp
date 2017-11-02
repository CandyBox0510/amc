<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page contentType="text/html; charset=EUC-KR" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="EUC-KR">

</head>

<body>
   <div class="wrapper">
    	<c:set var="who" value=""/>
    	<c:if test="${sessionScope.user.role ne 'admin'}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user.role eq 'admin'}">
    		<c:set var="who" value="admin"/>	
    	</c:if>
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>

        
        <!-- Main content -->
        <div class="container">
           
    	<div class="col-md-12">
  				<h2 class="page-heading">�Խñ� �ۼ�</h2>
  					<form id = 'addFreeForm'>
		  				<div class="addFreeBoard">
		  					<div class ="field">
		  					<div class='col-md-1' id="title">����</div>
		  					<div class='col-md-11'><input type='text' name='freeBoardTitle' id ="freeBoardTitle" class="add__input"></div>
		  					<div class='field' >
		  						<div class='col-md-12' id="context"><textarea id="freeBoardContent" name="freeBoardContent"></textarea></div>
		  						<div class='col-md-1' id="title">÷������</div>
		  						<div class='col-md-11' >
		  						<span class="notice">�̹��� ����(jpg, jpeg, png, gif)�� ���ε� �����մϴ�</span>
		  						<input type="file" id="imageFile" name="imageFile" class="add__input" ></div>
		  					</div>
		  					</div>
		  					<div class="col-md-12" id ="buttonWrap" >
		                        <button type='button' class="btn btn-md btn--warning btn--wider" id="addButton">����ϱ�</button>     
		                        <button type='button' class="btn btn-md btn--warning btn--wider" id="cancleButton">����ϱ�</button>               
		                    </div>
		                    <div>
		                    	<input type="hidden" name="userId" id="userId" value ="${user.userId }">
		                    </div>
		  				</div>
                     </form>
        
   		    <div class="clearfix"></div>
        </div>
 
                
        </div>
        
        

      
    </div>

    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" class="login" method='get' novalidate=''>
                        <p class="login__title">sign in <br><span class="login-edition">welcome to A.Movie</span></p>

                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>

                        <p class="login__tracker">or</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email' name='user-email' class="login__input">
                        <input type='password' placeholder='Password' name='user-password' class="login__input">

                        <input type='checkbox' id='#informed' class='login__check styled'>
                        <label for='#informed' class='login__check-info'>remember me</label>
                         </div>
                        
                        <div class="login__control">
                            <button type='submit' class="btn btn-md btn--warning btn--wider">sign in</button>
                            <a href="#" class="login__tracker form__tracker">Forgot password?</a>
                        </div>
                    </form>
                </div>

            </section>
        </div>

         <script src="/js/external/modernizr.custom.js"></script> 
	
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script> 


        <!-- Custom -->
        <script src="/js/custom.js"></script>
       
        
        <script type="text/javascript">
        
        function fncAddFreeBoard() {
        	freeBoardTitle = $("input[name='freeBoardTitle']").val();
        	freeBoardContent = $("textarea[name='freeBoardContent']").val();
        	imageFile = $("input[name='imageFile']").val();
        	console.log(freeBoardTitle +"   "+freeBoardContent +"   " +imageFile);
        	
        	if(freeBoardTitle == null || freeBoardTitle.length <1){
        		alert("������ �Է� �� �ּ���");
        		return;
        	}
        	if(freeBoardContent == null || freeBoardContent.length <1){
        		alert("������ �Է� �� �ּ���");
        		return;
        	}
        	if(imageFile != ""){
            	extension = imageFile.substring(imageFile.lastIndexOf(".")+1);
				extension = extension.toLowerCase();

					if(extension =='jpg' || extension=='jpeg' || extension=='png' || extension=='gif'){
						
					}else{
		        		alert("���ε尡���� Ȯ���ڰ� �ƴմϴ�. �ٽ� Ȯ�����ּ���");
						return;
		        	}						
        	}
        	
        	$("form").attr("method", "POST").attr("action", "/community/addFreeBoard").attr('enctype','multipart/form-data').submit();
		}
        
        $(document).ready(function () {

       	 

			$(document).on("click", "#addButton", function () {
				
			
				fncAddFreeBoard();
		
			})
			
			
			$(document).on("click", "#cancleButton", function () {
				
				if( confirm("���� ����� ����Ͻðڽ��ϱ�?")==true){
					history.go(-1);
				}else{
					return;
				}
		
			})
			
			
		})
        </script>
    

</body>
<style type="text/css">
	   .page-heading{
			margin-top : 100px
		}
		.wrapper{
			margin-bottom : 30px
		}
            html{
            height:auto;
            }
    
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
		
		#freeBoardContent {
			  width: 100%;
			  min-height: 400px;
			  padding: 8px 19px;
			  -webkit-border-radius: 3px;
			  -moz-border-radius: 3px;
			  border-radius: 3px;
			  background-color: #ffffff;
			  border: solid 2px #dbdee1;
			  font-size: 13px;
			  color: #b4b1b2;
			}
			
			#addButton {
			font-size: 13px;
			 text-align : center;
  			margin-top: 10px;
  			height : 40px;
  			margin-right: 5px;
  			color : #4C4145;
			}
			
			#cancleButton {
			font-size: 13px;
			 text-align : center;
  			margin-top: 10px;
  			height : 40px;
  			margin-left: 5px;
  			color : #4C4145;
			}
			
			#buttonWrap{
			text-align : center;
			}
			.notice{
				font-size : 12px;
				color:#969b9f;
			}
			
			

    </style>
    
</html>