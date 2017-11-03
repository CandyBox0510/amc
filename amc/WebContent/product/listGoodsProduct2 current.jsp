
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
  
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	   
	    <!-- jQuery UI toolTip 사용 CSS-->
	    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	    <!-- jQuery UI toolTip 사용 JS-->
	    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
  
  

</head>

<body>
    <div class="wrapper">
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
        
        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">티켓 오픈 알림 리스트</h2>
                <div class="row">
                   <div class="gallery-wrapper">
                    <%-- <c:set var="i" value="0" />
                 <c:forEach var="movie" items="${unifiedSearch.uniMovieList}">
                  <c:set var="i" value="${ i+1 }" /> --%>
                  <c:forEach var="count" begin="1" end="9" step="1">
                    <div class="col-sm-4 col-md-3">
                       <div class="gallery-item">
                               <a href="http://imgmovie.naver.com/mdi/mit110/1495/149517_P11_135849.jpg">
                                   <img alt='' src="https://pbs.twimg.com/media/DMjnIyvUQAAYKLy.jpg" style="width: 100%; height: auto;">
                               </a>
                               <div class="alert alert-danger" role="alert">
                             <strong>티켓 오픈 일자</strong><br/>2017-01-01 15:00<a href="http://naver.com"><span class="label label-danger">취소</span></a>
                        </div>
                               <a href="http://imgmovie.naver.com/mdi/mit110/1495/149517_P11_135849.jpg" class="gallery-item__descript gallery-item--video-link">
                                   <span class="gallery-item__icon"><i class="fa fa-bell-o"></i></span>
                                   <p class="gallery-item__name">영화이름</p>
                               </a>
                             </div>       
                       </div>
                    </c:forEach>
                      <%-- </c:forEach> --%>   
                   </div>
                </div>
            </div>
        </section>
       
       
       
       <div class="container">
		
		<%-- <form name="detailForm" action="/product/getGoodsList?menu=${param.menu }" method="post"> --%>
	
		<input type="hidden" name="menu" value="${param.menu}"/>
		<input type="hidden" name="maxPage" value="${resultPage.maxPage}"/>
		<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
		
		
		<div class="page-header text-info">
	       <span><h3>${param.menu eq 'search'? "상품 목록조회" : "상품관리" }&ensp;&ensp;
	      
	      <c:if test="${param.menu=='manage'}">
	       <button type="button" class="btn btn-primary pull-right"  float = "right"
	       			 onclick="location.href='/product/addProduct'">상 품 등 록</button></h3></span>	
	      </c:if> 		
	    </div>
		
	  	<div class="container">
		<div class="row">
			<div class="col-md-9" role="main">
				<div class="page-header col-sm-offset-2 col-sm-10">
					<c:if test="${param.menu=='manage'}">
						<h1>상품 관리</h1>
					</c:if>
					<c:if test="${param.menu=='search'}">
						<h1>상품 구매</h1>
					</c:if>
				</div>
				<div class="row">
				
				</div>
			</div>
<%--  			<jsp:include page="../history.jsp">
				<jsp:param name="uri" value="../"/>
			</jsp:include>
 --%> 		</div>
	</div>
	  
 	</div>
       
       
       
       
       <footer class="footer-wrapper">
            <section class="container">
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">현재 상영 영화</a></li>
                        <li><a href="#" class="nav-link__item">상영 예정 영화</a></li>
                        <li><a href="#" class="nav-link__item">시사회</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">영화 예매</a></li>
                        <li><a href="#" class="nav-link__item">시사회 예매</a></li>
                        <li><a href="#" class="nav-link__item">영화관 정보</a></li>
                        <li><a href="#" class="nav-link__item">커뮤니티</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">굿즈</a></li>
                        <li><a href="#" class="nav-link__item">스낵바</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="footer-info">
                        <p class="heading-special--small">A.Movie<br><span class="title-edition">in the social media</span></p>

                        <div class="social">
                            <a href='#' class="social__variant fa fa-facebook"></a>
                        </div>
                        
                        <div class="clearfix"></div>
                        <p class="copy">&copy; AMC, 2017. All rights reserved. Done by AMC</p>
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
      </script>
      
	    <script type="text/javascript">
		var currentPage = 0;
		var searchKeyword = 'G';
		
		function fncNextList(){
			currentPage++;
			$.ajax({
				url : 'json/getGoodsList/'+$('input:hidden[name="menu"]').val(),
				method : 'post',
				async : false,
				dataType : 'json',
				data : JSON.stringify({
						currentPage : currentPage,
						searchKeyword : searchKeyword, 
				}),
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				success : function(JSON){
					var list = '';
					for( x in JSON.list){
						var product = JSON.list[x];
						list += '<div class="col-sm-4 col-md-3"><div class="thumbnail alert alert-'+(product.stock==0? 'danger':'warning')+'">';
						list += '<img src="../images/uploadFiles/'+(product.prodImage!=null ? product.prodImage : 'empty'+Math.floor(3*Math.random())+'.GIF')+'" class="img-responsive" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">';
						list += '<div class="caption">';
						list += '<input type="hidden" name="prodNo" value="'+product.prodNo+'">';
						list += '<h3>'+product.prodName+'</h3>';
						list += '<p>';
						list += '<div class="btn-group" role="group">';
						list += '<a href="#" class="btn btn-primary" role="button">';
						if($('input:hidden[name="menu"]').val()=='manage'){
							list += '정보수정';
						}else{
							list += '상세보기';
						}
						list += '</a>';
						if($('input:hidden[name="userId"]').val() != '' && $('input:hidden[name="menu"]').val()=='search'){
							list += '<a href="#" class="btn btn-default" role="button">구매</a>';
						}
						list += '</div>';
						list += '</p></div></div></div>';
					}
					$('.col-md-9 > .row').html($('.col-md-9 > .row').html() + list);
					
					init();
				}
			});
		}
		
		function init(){
			$('a.btn-primary:contains("상세보기"), a.btn-primary:contains("정보수정")').unbind('click').bind('click',function(){
				self.location.href='getGoodsProduct?menu=${param.menu}&prodNo='+$(this).parent().parent().find('input:hidden').val();
			});
			
			$('a.btn-default:contains("구매")').unbind('click').bind('click',function(){
				self.location.href='../purchase/addPurchase?prodNo='+$(this).parent().parent().find('input:hidden[name="prodNo"]').val();
			});
		};
		
		$( function() {
			while($(document).height() == $(window).height() && currentPage < $('input:hidden[name="maxPage"]').val()){
				fncNextList();
			}
			
		} );
		
		$(window).scroll(function(){
			if(currentPage < $('input:hidden[name="maxPage"]').val()){
				console.log($(window).scrollTop()+ "    :::    "+($(document).height()-$(window).height()));
				if($(window).scrollTop() >= $(document).height()-$(window).height()){	 	
				//$(window).scrollTop()이 옆항인  $(document).height()-$(window).height()이것과 같으면 fncNextList가 실행되는게 보통인데 경덕컴은 정수가 딱 안떨어져서 크기비교를해야됨
					fncNextList();
				}
			}
		}); 
	  
	
	   </script> 
</body>
 <style>
      html{
         height: auto;
      }
 </style>
</html>