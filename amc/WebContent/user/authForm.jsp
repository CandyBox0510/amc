<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>본인 인증</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
    <!-- Mobile Specific Metas-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->
    <!-- jQuery UI --> 
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
        <!-- Swiper slider -->
        <link href="/css/external/idangerous.swiper.css" rel="stylesheet" />
    
        <!-- Custom -->
        <!-- <link href="/css/style.css?v=1" rel="stylesheet" /> -->

        <!-- Modernizr --> 
        <!-- <script src="/js/external/modernizr.custom.js"></script> -->
    
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
        <!--   Sweetalert2 CDN  -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
   
        <!--   semantic UI  -->
        <link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
        <script
        src="https://code.jquery.com/jquery-3.1.1.min.js"
        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
        crossorigin="anonymous"></script>
        <script src="../semantic/semantic.min.js"></script>	
		
		<!-- 카카오 API -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
    	<!-- Banner -->
        <div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
	
		<div class="container" id="body">
			<form id="findForm">
		    	<fieldset>
		        	<legend class="screen_in">이메일 인증 방법</legend>
			 			<div class="row">
			        		<div class="box email">
			            		<label for="email">이메일</label>
			            			<input value="" type="text" id="email" name="email" autofocus autocomplete="off" required />		            
			        		</div>
			        		<span id="helpBlock" class="help-block col-sm-6"></span>
			        	</div>
			 
			        	<div class="box btn">
			            	<button type="button" class="btn join">
			                	<i class="fa fa-envelope"></i>
			               	 		인증코드발송
			            	</button>
			        	</div>        
		    	</fieldset><br/><br/><br/>
 		   		
 		   		<fieldset>
		        	<legend class="screen_out">SNS 계정 인증 방법</legend>
						<div>		
							<span class="col-md-4">
								<a id="custom-login-btn" href="javascript:loginWithKakao()">
									<img src="../images/user/kakao_account.png" class="img-rounded" width="70%">
								</a><br/><br/>
								<a href="/user/json/start" >
									<img src="../images/user/naver.account.PNG" class="img-rounded" width="70%"> 
								</a><br/><br/>
								<a href="/user/kakaoGetCode" >
									<img src="../images/user/google_account.png" class="img-rounded" width="70%"> 
								</a>
							</span>
					    </div>
		    	</fieldset>
			</form> 
		</div>	    
		
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Swiper slider -->
        <script src="/js/external/idangerous.swiper.min.js"></script>

        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>

</body>
</body>
	<script type="text/javascript">
 	var check = false;
		function fncCheckUser() {
			// Form 유효성 검증
			var id=$('#email').val();
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(!check){
				alert("이미 존재하는 아이디 입니다.");
				return;
			}
			fncSendMail();
		}
	
		//============= "인증메일발송"  Event 연결 =============
 		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.join" ).on("click" , function() {
				fncCheckUser();
			});
		});	
		
		function fncSendMail() {
			 var email=$("input[name='email']").val();			    
			 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) 
				 || email == ""){
		    	alert("이메일 형식이 아닙니다.");
		    	return;
		     }
			alert("메일을 성공적으로 보냈습니다.");
			$("form").attr("method" , "POST").attr("action" , "/user/auth").submit();
		}
 		
		//==>""이메일" 유효성Check / ID중복확인" Event 처리 및 연결
		$(function(){					
			$('#email').bind('keyup', function(){
				var userId = $(this).val().trim();
				var tempId = userId.split(".");
	        	console.log("email :: " + email);
	         	console.log("tempId :: " + tempId);
					$.ajax({
						url : 'json/checkDuplication/'+tempId,
						method : 'get',
						dataType : 'json', 
						 headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						}, 
						success : function(JSONData , status){
							/* alert("JSONData" + JSONData); */
							if(JSONData){
								$('span.help-block').html('사용가능한 아이디 입니다.').css('color','blue');
								check = true;
							}else{
								$('span.help-block').html('이미 존재하는 아이디 입니다.').css('color','red');
								check = false;
							}
						}
					});
				
					if(userId == ''){
						$('span.help-block').html('');
					}
			      
			});
		});		
		
		
		//============= 카카오 로그인 =============
		function loginWithKakao() {
			Kakao.init('fc5658887af25f840e94144f6722b228');
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
		 		success: function(authObj) {
		   			var accessToken = Kakao.Auth.getAccessToken();
		    		Kakao.Auth.setAccessToken(accessToken);
		    
		    		Kakao.API.request({
		    			url: '/v1/user/me',
		       			success: function(res) {
			        		console.log("response 확인 :: " + res);
			           		var userId = res.kaccount_email;       
			           		/* var tempId = userId.replace(".", ","); */
			           		console.log("userId :: " + userId);
			           		/* console.log("tempId :: " + tempId); */
			           		$.ajax(
			            		{
			                   		/* url : "/user/json/loginUser/"+tempId, */
			                   		url : "/user/json/kakaoLogin", 
			                      	method : "POST",
			                      	/* dataType : "json", */
			                      	headers : {
			                       		"Accept" : "application/json",
			                       		"Content-Type" : "application/json"
			                      	},
									data : JSON.stringify({
										userId : userId
										/* password : pw */
									}),
			                      	success : function(JSONData, status) {
			                      		alert("성공");
			                       		if(JSONData.user == null ) {
			                       			alert("계정이 없습니다. 회원가입을 해주시기 바랍니다..");
			                       			$(self.location).attr("href","/user/addUser?email="+userId);                 
			                         	}else if(JSONData.user != ''){
			                         		alert("반갑습니다.");  
			                       			$(self.location).attr("href","/user/loginUser");
			
			                       	  		location.reload();
			                         	}else{
			                       	  		location.reload();
			                         	}
			                      	}
			                });
		          		}                  
		      		});
			  	},
			   	fail: function(err) {
			   		alert(JSON.stringify(err));
			   	}
		  	});
		}

	</script>	
	
<style type="text/css">
 	#body{ padding-top: 100px; }
</style>
</html>