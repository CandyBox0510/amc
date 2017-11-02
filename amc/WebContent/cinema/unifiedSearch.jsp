<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.util.StringUtils" %>
<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema-booking2</title>
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
        <link href="/css/style.css?v=1" rel="stylesheet" />


        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
    
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
    
  
  <script type="text/javascript">
   </script> 
</head>


<body>
    <div class="wrapper place-wrapper">
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="/images/banners/bra.jpg">
        </div>

        <!-- Header section -->
        <header class="header-wrapper">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
        </header>
        
         <!-- Search bar -->
        <div class="search-wrapper">
            <div class="container container--add">
                <form id='search-form' action="/cinema/unifiedSearch" method='post' class="search">
                    <input type="text" class="search__field" placeholder="Search" name="searchKeyword">
                    <button type='submit' class="btn btn-md btn--danger search__button" onClick="javascript:unifiedSearch()">search a amc</button>
                </form>
            </div>
        </div>
        
        
        <!-- Main content -->
        <div class="place-form-area">
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="/images/unifiedSearch.png">
                    <p class="order__title">통합검색 <br><span class="order__descript">in amc homepage</span></p>
                </div>
            </div>
            
            <!-- 영화 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step second--step">영화</div>
            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="movie" items="${unifiedSearch.uniMovieList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-sm-4 col-md-3">
	                        <div class="gallery-item">
	                            <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=search">
	                                <img alt='' src="${movie.postUrl}" align="middle" width="230px" height="230px">
	                            </a>
	                            <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=search" class="gallery-item__descript gallery-item--video-link">
	                                <span class="gallery-item__icon"><i class="fa fa-video-camera"></i></span>
	                                <p class="gallery-item__name">${movie.movieNm }</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 영화 통합검색 끝 -->
          	
          	<!-- 시사회 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step second--step">시사회</div>
            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="screenContent" items="${unifiedSearch.uniPreviewList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-sm-4 col-md-3">
	                        <div class="gallery-item">
	                            <a href="/movie/getMovie?movieNo=${screenContent.movie.movieNo}&menu=search">
	                                <img alt='' src="${screenContent.movie.postUrl }" align="middle" width="230px" height="230px">
	                            </a>
	                            <div class="alert alert-danger"><strong>티켓 오픈 일자</strong><br/> ${screenContent.ticketOpenDate }</div>
	                            <a href="/movie/getMovie?movieNo=${screenContent.movie.movieNo}&menu=search" class="gallery-item__descript gallery-item--video-link">
	                                <span class="gallery-item__icon"><i class="fa fa-video-camera"></i></span>
	                                <p class="gallery-item__name">${screenContent.previewTitle }</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 시사회 통합검색 끝 -->
          	
          	<!-- 굿즈 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step third--step">굿즈</div>
            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="goods" items="${unifiedSearch.uniGoodsList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-sm-4 col-md-3">
	                        <div class="gallery-item">
	                            <a href="/product/getGoodsProduct?prodNo=${goods.prodNo}">
	                                <img alt='' src="/images/uploadFiles/${goods.prodImage}" align="middle" width="230px" height="230px">
	                            </a>
	                            <a href="/product/getGoodsProduct?prodNo=${goods.prodNo}" class="gallery-item__descript gallery-item--goods-link">
	                                <span class="gallery-item__icon"><i class="fa fa-shopping-cart"></i></span>
	                                <p class="gallery-item__name">${goods.prodName}</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 굿즈 통합검색 끝 -->
          	
        	<!-- 스낵바 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step first--step">스낵바</div>
            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="snack" items="${unifiedSearch.uniSnackList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-sm-4 col-md-3">
	                        <div class="gallery-item">
	                            <a href="/product/getSnackProduct?prodNo=${snack.prodNo}">
	                                <img alt='' src="/images/uploadFiles/${snack.prodImage}" align="middle" width="230px" height="230px">
	                            </a>
	                            <a href="/product/getSnackProduct?prodNo=${snack.prodNo}" class="gallery-item__descript gallery-item--photo-link">
	                                <span class="gallery-item__icon"><i class="fa fa-glass"></i></span>
	                                <p class="gallery-item__name">${snack.prodName }</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 스낵바 통합검색 끝 -->
   
        </section>  
       
         <input type="hidden" name="clientId" value=""/>
         <form id="addBooking">
         <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
         <input type="hidden" name="screenContentNo" value="${screenContent.screenContentNo}"/>
         <input type="hidden" name="bookingSeatNo" value=""/>         
         <input type="hidden" name="headCount" value=""/>
         <input type="hidden" name="totalTicketPrice" value=""/>
         <!-- <input type="hidden" name="impId" value=""/> -->
         <!-- <input type="hidden" name="qrUrl" value=""/> -->   
         <input type="hidden" name="impId" value="temp_imp_uid"/>
         <input type="hidden" name="qrUrl" value="temp_qrUrl"/>
         <input type="hidden" name="displaySeat" value="temp_displaySeat"/>
      </form>
                
       </div>
               <footer class="footer-wrapper">
            <section class="container">
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">Cities</a></li>
                        <li><a href="movie-list-left.html" class="nav-link__item">Movies</a></li>
                        <li><a href="trailer.html" class="nav-link__item">Trailers</a></li>
                        <li><a href="rates-left.html" class="nav-link__item">Rates</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="coming-soon.html" class="nav-link__item">Coming soon</a></li>
                        <li><a href="cinema-list.html" class="nav-link__item">Cinemas</a></li>
                        <li><a href="offers.html" class="nav-link__item">Best offers</a></li>
                        <li><a href="news-left.html" class="nav-link__item">News</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">Terms of use</a></li>
                        <li><a href="gallery-four.html" class="nav-link__item">Gallery</a></li>
                        <li><a href="contact.html" class="nav-link__item">Contacts</a></li>
                        <li><a href="page-elements.html" class="nav-link__item">Shortcodes</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="footer-info">
                        <p class="heading-special--small">A.Movie<br><span class="title-edition">in the social media</span></p>

                        <div class="social">
                            <a href='#' class="social__variant fa fa-facebook"></a>
                            <a href='#' class="social__variant fa fa-twitter"></a>
                            <a href='#' class="social__variant fa fa-vk"></a>
                            <a href='#' class="social__variant fa fa-instagram"></a>
                            <a href='#' class="social__variant fa fa-tumblr"></a>
                            <a href='#' class="social__variant fa fa-pinterest"></a>
                        </div>
                        
                        <div class="clearfix"></div>
                        <p class="copy">&copy; A.Movie, 2013. All rights reserved. Done by Olia Gozha</p>
                    </div>
                </div>
            </section>
        </footer>           
     </div>
  


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
      
      <script type="text/javascript">
            $(document).ready(function() {
                init_BookingOne();
            });
            
            function unifiedSearch(){
    	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").attr("accept-charset","EUC-KR").submit();
    	   	}
      </script>
     
</body>
 <style>
      html{
 	     height: auto;
      }
 </style>
</html>