<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie - Login</title>
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

        <!-- Mobile menu -->
        <link href="../css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="../css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="../css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="../js/external/modernizr.custom.js"></script>
        
       	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		
	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="../js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="../js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="../js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Form element -->
        <script src="../js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="../js/form.js"></script>

        <!-- Custom -->
        <script src="../js/custom.js"></script>
 
</head>

<body>
    <div class="wrapper">
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <!-- Header section -->
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
        </header>
        
        <!-- Search bar -->
        <div class="search-wrapper" id="body">
            <div class="container container--add">
                <form id='search-form' method='get' class="search">
                    <input type="text" class="search__field" placeholder="Search">
                    <select name="sorting_item" id="search-sort" class="search__sort" tabindex="0">
                        <option value="1" selected='selected'>By title</option>
                        <option value="2">By year</option>
                        <option value="3">By producer</option>
                        <option value="4">By title</option>
                        <option value="5">By year</option>
                    </select>
                    <button type='submit' class="btn btn-md btn--danger search__button">search a movie</button>
                </form>
            </div>
        </div>
        
        <!-- Main content -->
                <form id="login-form" class="login" method='get' novalidate=''>
                    <p class="login__title">sign in <br><span class="login-edition">welcome to A.Movie</span></p>

                    <div class="social social--colored">
                            <a href='/user/kakaoGetCode'>
                            	<img src="../images/user/kakaobtn.png" class="social_used">
                            </a>
                            <a href='/user/Naver'>
                            	<img src="../images/user/kakaobtn.png" class="social_used">
                            </a>
                            <a href='#'>
                            	<img src="../images/user/kakaobtn.png" class="social_used">
                            </a>
                    </div>

                    <p class="login__tracker">or</p>
                    
                    <div class="field-wrap">
                    <input type='email' placeholder='Email' name='userId' id="userId" class="login__input">
                    <input type='password' placeholder='Password' name='password' id="password" class="login__input">

                    <input type='checkbox' id='#informed' class='login__check styled'>
                    <label for='#informed' class='login__check-info'>remember me</label>
                     </div>
                    
                    <div class="login__control">
                        <button type='submit' id="login" class="btn btn-md btn--warning btn--wider">sign in</button>
                        <a href="#" class="login__tracker form__tracker">Forgot password?</a>
                    </div>
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
    	<script type="text/javascript">
    	//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#login").on("click" , function() {
				var id=$("#userId").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$.ajax( 
						{	
							url : "/user/json/loginUser",
							method : "POST" ,
							async : false,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								userId : id,
								password : pw
							}),
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//alert("JSONData : \n"+JSONData);
								//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
								//alert("JSONData : "+ JSONData );
								//alert("status : "+ status );
									//alert(JSONData.role);
									console.log(JSONData.userId);
									
									//alert("로그인유저");
									
									if( JSONData.role == 'not' ){
										alert("탈퇴한회원...");
									}else if( JSONData !='' ){
									//$(window.parent.document.location).attr("href","/index.jsp");
									$(self.location).attr("href","/index.jsp");
									
									}else{
										alert("아이디 , 패스워드를 확인하시고 다시 로그인1...");
									}
								},
							error:function(request,status,error){
								//alert(error);
								//alert("아이디 , 패스워드를 확인하시고 다시 로그인2...");
						    }
					}); 
				
			});
		});	
		//============= 회원원가입화면이동 =============
		$( function() {
			/* $("a[href='#' ]").on("click" , function() {
				self.location = "/user/authForm.jsp"
			}); */
			$("#addUser").on("click" , function() {
				self.location = "/user/authForm.jsp"
			});
		});
		
		//============= ID/PW 찾기 =============
		$( function() {
			$("#findUser").on("click" , function() {
				self.location = "/user/findUser.jsp"
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
			                      	dataType : "json",
			                      	headers : {
			                       		"Accept" : "application/json",
			                       		"Content-Type" : "application/json"
			                      	},
									data : JSON.stringify({
										userId : userId
										/* password : pw */
									}),

			                      	success : function(JSONData, status) {     
			                       		if(JSONData.user == null ) {
			                       			alert("반갑습네다.");
			                       			self.location="/user/addUser";                 
			                         	}else if(JSONData.user == ''){
			                         		alert("계정이 없습니다. 회원가입을 해주시기 바랍니다.");  
			                       			$(self.location).attr("href","/user/addUser");
			
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
 	
 	.social-used {
	  width: 10px;
	  height: 10px;
	  font-size: 10px;
	  color: #ffffff;
	  text-align: center;
	  position: absolute;
	  top: 8px;
	  left: 0;
	}
</style>
		
</html>
