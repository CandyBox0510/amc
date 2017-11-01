<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!doctype html>
<html>
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
        <script src="/js/form.js"></script>

        <!-- Twitter feed -->
        <script src="/js/external/twitterfeed.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>
		
        <script type="text/javascript">
             $(document).ready(function() {
               init_Home();
             });
	    </script> 

</head>
<div class="navbar  navbar-inverse navbar-fixed-top">
<!-- Header section -->
         <div class="container">
             <!-- Logo link-->
             <a href='/cinema/index2' class="logo">
                 <!-- <img alt='logo' src="/images/logo.png"> -->
                 <img src="/images/amc.png">
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
                             <li class="menu__nav-item"><a href="news-left.html">굿즈</a></li>
                             <li class="menu__nav-item"><a href="news-right.html">스낵바</a></li>
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
                         <li><a href="/booking/getBookingList?searchCondition=now" class="auth__function-item">예매 목록</a></li>
                         <li><a href="/movie/getWishList" class="auth__function-item">위시리스트</a></li>
                         <li><a href="/alarm/getCancelAlarmList?alarmFlag=C" class="auth__function-item">취소표 알리미</a></li>
                         <li><a href="/alarm/getCancelAlarmList?alarmFlag=O" class="auth__function-item">티켓오픈시간 알리미</a></li>
                         <li><a href="#" class="auth__function-item">스토어 구매 목록</a></li>
                     </ul>
                 </div>
                 <a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a>
        	</div>
	 </div>
</div>
</html>