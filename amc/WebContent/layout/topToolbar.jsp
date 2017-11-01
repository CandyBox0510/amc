<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!doctype html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie</title>
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
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
        <!-- Open Sans -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />

        <!-- Slider Revolution CSS Files -->
        <link rel="stylesheet" type="text/css" href="/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="/revolution/css/navigation.css">
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />


        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
        
        <!-- JavaScript-->
		<!-- jQuery 3.1.1 --> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate  -->
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3 --> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Slider Revolution core JavaScript files -->
        <script type="text/javascript" src="/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="/revolution/js/jquery.themepunch.revolution.min.js"></script>

        <!-- Slider Revolution extension scripts. --> 
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="/revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
        <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Stars rate -->
        <script src="/js/external/jquery.raty.js"></script>
        
        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
 <!--        <script src="/js/form.js"></script> -->

        <!-- Twitter feed -->
        <!-- <script src="/js/external/twitterfeed.js"></script> -->

        <!-- Custom -->
 		<script src="/js/custom.js"></script>

  <!--       <script type="text/javascript">
             $(document).ready(function() {
               init_Home();
             });
	    </script>  -->
	    
	    <script type="text/javascript">
    	//============= "로그인"  Event 연결 =============
		$( function() {
		/* 	alert("제발 일로좀 들어와라"); */
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
    	
    	
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)				
				$("a:contains('로그아웃')").on("click" , function() {
					$(self.location).attr("href","/user/logoutUser");
				}); 
			});
		 
		 	//============= 스토어 Event 처리 =============	
		 	$( "a:contains('스토어')" ).on("click" , function() {
				$(self.location).attr("href","/product/getGoodsList?menu=search");
			});
		 	
		 	//=============  굿즈 Event 처리 =============	
		 	$( "a:contains('굿즈')" ).on("click" , function() {
				$(self.location).attr("href","/product/getGoodsList?menu=search&searchKeyword=G");
			});
		 	
		 	//=============  스낵바 Event 처리 =============	
		 	$( "a:contains('스낵바')" ).on("click" , function() {
				$(self.location).attr("href","/product/getSnackList?menu=search&searchKeyword=S");
			});
		 	
		 	//=============  회원관리 Event  처리 =============	
		 	$( "a:contains('회원관리')" ).on("click" , function() {
				$(self.location).attr("href","/user/getUserList");
			});
		 	
		 	//=============  상품관리 Event  처리 =============	
		 	$( "a:contains('상품관리')" ).on("click" , function() {
				$(self.location).attr("href","/product/getGoodsList?menu=manage");
			});
		 	
		 	//=============  판매관리 Event  처리 =============	
		 	$( "a:contains('판매관리')" ).on("click" , function() {
				$(self.location).attr("href","/purchase/getSaleList?searchKeyword=saleList");
			});

		</script>

</head>
<div class="navbar  navbar-inverse navbar-fixed-top">
<!-- Header section -->
         <div class="container">
        
             <!-- Logo link-->
             <a href='/index.jsp' class="logo">
                 <img alt='logo' src="/images/logo.png">
             </a>
             
             <!-- Main website navigation-->
             <nav id="navigation-box">
                 <!-- Toggle for mobile menu mode -->
                 <a href="#" id="navigation-toggle">
                     <span class="menu-icon">
                         <span class="icon-toggle" role="button" aria-label="Toggle Navigation">
                           <span class="lines"></span>
                         </span>
                     </span>
                 </a>
                 
                 <!-- Link navigation -->
                 <ul id="navigation">
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">영화</a>
                         <ul>
                             <li class="menu__nav-item"><a href="#">현재 상영 영화</a></li>
                             <li class="menu__nav-item"><a href="#">상영 예정 영화</a></li>
                             <li class="divider"></li>
                             <li class="menu__nav-item"><a href="#">시사회</a></li>

                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">예매</a>
                         <ul>
                             <li class="menu__nav-item"><a href="typography.html">영화 예매</a></li>
                             <li class="menu__nav-item"><a href="page-elements.html">시사회 예매</a></li>
                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="page-elements.html">영화관</a>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="gallery-four.html">커뮤니티</a>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="news-left.html">스토어</a>
                         <ul>
                             <!-- <li class="menu__nav-item"><a href="news-left.html">굿즈</a></li>
                             <li class="menu__nav-item"><a href="news-right.html">스낵바</a></li> -->
                             <li class="menu__nav-item"><a href="/product/getGoodsList?menu=search&searchKeyword=G">굿즈</a></li>
                             <li class="menu__nav-item"><a href="/product/getGoodsList?menu=search&searchKeyword=S">스낵바</a></li>
                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">[관리자 메뉴]</a>
						<ul class="mega-menu__list">
                                 <li class="mega-menu__nav-item"><a href="#">회원 관리</a></li>
                                 <li class="mega-menu__nav-item"><a href="#">상품 관리</a></li>
                                 <li class="mega-menu__nav-item"><a href="#">판매 관리</a></li>
                                 <li class="mega-menu__nav-item"><a href="#">영화 관리</a></li>
                                 <li class="mega-menu__nav-item"><a href="#">상영 관리</a></li>
                                 <li class="mega-menu__nav-item"><a href="#">예매 관리</a></li>
                             </ul>
                     </li>
                 </ul>
             </nav>
             
             <!-- Additional header buttons / Auth and direct link to booking-->
             <div class="control-panel">
                 <div class="auth auth--home">
                   <div class="auth__show">
                   </div>
                   <a href="#" class="btn btn--sign btn--singin">
                       	MyPage
                   </a>
                     <ul class="auth__function">
                         <li><a href="#" class="auth__function-item">내 정보 보기</a></li>
                         <li><a href="#" class="auth__function-item">예매 목록</a></li>
                         <li><a href="#" class="auth__function-item">위시리스트</a></li>
                         <li><a href="#" class="auth__function-item">취소표 알리미</a></li>
                         <li><a href="#" class="auth__function-item">티켓오픈시간 알리미</a></li>
                         <li><a href="#" class="auth__function-item">스토어 구매 목록</a></li>
                     </ul>
                 </div>
                 
           	<!-- 유저가 비로그인 상태일 시 -->	
 			<c:if test="${empty sessionScope.user}">		
 				<li>			
					<form class="navbar-form navbar-right">						
					<!-- <a data-toggle="modal" href="/user/loginUser" data-target="#modal-testNew" role="button" data-backdrop="static">
						<button type="button" class="btn btn-primary">Log in</button>
					</a > -->
<!-- 						<a href="/user/loginUser.jsp"><button type="button" class="btn btn-primary">Log in</button></a>
						<a href="/user/authForm.jsp"><button type="button" class="btn btn-primary">Sign in</button></a>
 -->						<a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a> 
					</form>
				</li>	
			</c:if>	
			
			<c:if test="${!empty sessionScope.user}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="user-info">[${sessionScope.user.userName}]</a>
					<!-- <li><a href="/cinema/myPage.jsp">마이페이지</a></li> -->
					<li><a href="#">로그아웃</a></li>
				</ul>
			</c:if> 
 
                 
        	</div>
          	
      	
        	
	 </div>
</div>
</html>