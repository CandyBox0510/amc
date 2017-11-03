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
  <jsp:include page="/layout/topToolbar.jsp" />
    <div class="container">
         
	
		<input type="hidden" name="menu" value="${param.menu}"/>
		<input type="hidden" name="maxPage" value="${resultPage.maxPage}"/>
		<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
		<input type="text" name="userId" value="${sessionScope.user.role}"/>
		
		
	   	<!-- Main content -->
        <section class="container">
        	
        	<!-- Search bar -->
        	<div class="col-sm-12">
        	
                <h2 class="page-heading">${param.menu eq 'search'? "상품 목록조회" : "상품관리" }</h2>
                    <div class="tags-area tags-area--thin">
                    	<div class="container container--add">
                   			<div class="col-sm-6 text-left">
                   				<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
                   			</div>
		                   		<c:if test="${param.menu=='manage'}">
			       					<button type="button" class="btn btn-primary pull-right"  float = "right"
			       						 onclick="location.href='/product/addProduct'">상 품 등 록
			       					</button>	
			      				</c:if> 
			            	<div class="col-sm-6 text-right">
				                <form id='search-form' method='get' class="search">
				                    <input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword">
					                    <select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
					                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					                        <%-- <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option> --%>
					                    </select>
				                    <button type='button' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
				                    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
				                </form>
				             </div>
			             </div>
			        </div>
		
		              <div class="tags-area tags-area--thin" style="height : 50px">
		                 <p>안녕하세영</p>
		
		                    <div class="tags tags--unmarked tags--aside">
		                        <span class="tags__label">Sorted by:</span>
		                            <ul>
		                                <li class="item-wrap"><a href="#" class="tags__item item-active" data-filter='all'>all</a></li>
		                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='name'>name</a></li>
		                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='popularity'>popularity</a></li>
		                            </ul>
		                    </div>
		              </div>
		
			<input type = "text" value="${list }">
		 <div class="cinema-wrap">
	            	<div class="row">
				 		<c:set var="i" value="0" />
                		 <c:forEach var="product" items="${list }">
                		 <c:set var="i" value="${i+1 }" />
	                 
	                            <div class="col-xs-6 col-sm-3 cinema-item">
	                                <div class="cinema">
	                                    <a href='/product/getGoodsList/${product.prodNo}' class="cinema__images">
	                                        <img id="poster"alt='' src="../images/uploadFiles/${product.prodImage }" > 
	                                    </a>
	                                    <a href="/product/getGoodsList" class="movieNm">${product.prodName }</a>
	                                    <p><strong>가격</strong>  ${product.prodPrice }<br><strong>판매시작일</strong>${product.salesOpenDate}<br><strong>판매마감일</strong>  ${product.salesEndDate }</p>	     
	                                </div>
	                            </div>
	                   		        
                		 </c:forEach>
					</div>
	            </div>     
 				</div>
 			
 			
 						<div class="clearfix"></div>
 					<div class="coloum-wrapper">
	                    <div class="pagination paginatioon--full">
	                    	<c:if test="${resultPage.currentPage != 1 }">
	                            <a href='#' class="pagination__prev">prev</a>
	                    	</c:if>
	                     	<c:if test="${resultPage.endUnitPage !=  resultPage.currentPage}">	            
	                            <a href='#' class="pagination__next">next</a>
	                      	</c:if>
	                    </div>
	                </div>
 			
 			
 			
 			</div>
		
		
		
		</section>
		<div class="clearfix"></div>
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
      

      
<!-- 	    <script type="text/javascript">
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
 						list += '<div class="col-sm-4 col-md-4">';
						list += '<div class="gallery-item">';
						list += '<a href="/product/getGoodsProduct">';
						list += '<img src="../images/uploadFiles/'+(product.prodImage!=null ? product.prodImage : 'empty'+Math.floor(3*Math.random())+'.GIF')+'" style="width: 200%; height: auto;"></a>';
						list += '<div class="alert alert-'+(product.stock==0? 'danger':'warning')+'" role="alert">';
						list += '<strong>'+product.prodName+'</strong><br/>'+product.prodPrice+'';
						list += '<a href="/product/getGoodsProduct"><span class="label label-'+(product.stock==0? 'danger':'warning')+'"></span></a></div>';
						list += ' <input type="hidden" name="prodNo" value="'+product.prodNo+'">';
						list += '<a href="/product/getGoodsProduct" class="gallery-item__descript gallery-item--video-link">';
						list += '<span class="gallery-item__icon"><i class="fa fa-bell-o"></i></span>';
						list += '<p class="gallery-item__name">';
						if($('input:hidden[name="menu"]').val()=='manage'){
							list += '정보수정';
						}else{
							list += '상세보기';
						}
						list += '</p>';
						if($('input:hidden[name="userId"]').val() != '' && $('input:hidden[name="menu"]').val()=='search'){
							list += '<a href="#" class="btn btn-default" role="button">구매</a>';
						}
						list += '</a>';
						list += '</div></div>';
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
	  
	
	   </script>  -->
	   
	   
	   
	   
<!-- 	   	    <script type="text/javascript">
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
						list += '<section class="container">';
						list += '<div class="col-sm-12">';
						list += '<h2 class="page-heading">티켓 오픈 알림 리스트</h2>';
						list += '<div class="row">';
						list += '<div class="gallery-wrapper">';
						list += '<div class="col-sm-4 col-md-3">';
						list += '<div class="gallery-item">';
						list += '<a href="/product/getGoodsProduct">';
						list += '<img src="../images/uploadFiles/'+(product.prodImage!=null ? product.prodImage : 'empty'+Math.floor(3*Math.random())+'.GIF')+'" style="width: 100%; height: auto;"></a>';
						list += '<div class="alert alert-'+(product.stock==0? 'danger':'warning')+'" role="alert">';
						list += '<strong>'+product.prodName+'</strong><br/>'+product.prodPrice+'';
						list += '<a href="/product/getGoodsProduct"><span class="label label-'+(product.stock==0? 'danger':'warning')+'"></span></a></div>';
						list += ' <input type="hidden" name="prodNo" value="'+product.prodNo+'">';
						list += '<a href="/product/getGoodsProduct" class="gallery-item__descript gallery-item--video-link">';
						list += '<span class="gallery-item__icon"><i class="fa fa-bell-o"></i></span>';
						list += '<p class="gallery-item__name">';
						if($('input:hidden[name="menu"]').val()=='manage'){
							list += '정보수정';
						}else{
							list += '상세보기';
						}
						list += '</p>';
						if($('input:hidden[name="userId"]').val() != '' && $('input:hidden[name="menu"]').val()=='search'){
							list += '<a href="#" class="btn btn-default" role="button">구매</a>';
						}
						list += '</a>';
						list += '</div></div></div></div></div></section>';
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
	  
	
	   </script>  -->
	   <jsp:include page="../common/pageNavigator.jsp"/>
	   
</body>

<script type="text/javascript">
			   
function fncGetPageList(currentPage) {
    $("#currentPage").val(currentPage)		  
  
    $("form").attr("method", "POST").attr("action", "/product/getGoodsList?menu=search&searchKeyword=G").submit();
    $("input[name='searchKeyword']").val(searchKeyword);
}



$(document).ready(function() {
   
    $("button[name='search']").on("click", function() {
    	
    	fncGetPageList(1);
    });
    
    $(".pagination__next").on("click", function() {		
    	searchKeyword = $("input[name='searchKeyword']").val();
   
        var currentPage = $("#currentPage").val()
        currentPage = parseInt(currentPage)+1
	   	 	 
        fncGetPageList(currentPage);
    });
    
    $(".pagination__prev").on("click", function() {
    	 var currentPage = $("#currentPage").val()
         currentPage = parseInt(currentPage)-1
	   	 
        fncGetPageList(currentPage);
    });
});

</script>



<style type="text/css">
	.countPage {
	  	font-size: 13px;
	   	margin-top: 10px;
	}
	
	.search{
		margin-right : 30px;
	}
	
	
	.movieNm {
		  font-size: 16px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 5px;
		  margin-top: 5px;
	
	}
	
	#poster{
		height : calc(50vh - 100px);	
		width : auto;	
		height:260px; 
		margin-left: auto;
		margin-right: auto; 
		display: table;
	
	}
	
 	body {
		padding-top: 80px;
	} 
	
	html{
       		height: auto;
  		}
	
</style>

</html>