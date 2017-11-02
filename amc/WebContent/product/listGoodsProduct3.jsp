<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="EUC-KR">

	<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
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
        <div class="clearfix"></div>
        <section class="container">
        
        
            <div class="col-sm-12">
                <h2 class="page-heading">Gallery</h2>
                
                
                
                
                
                
                <div class="row">
                <div class="gallery-wrapper">
                    <div class="col-sm-4">
                        <div class="gallery-item">
                            <a href='../images/gallery/large/item-1.jpg' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="../images/gallery/thumb/item-1.jpg">
                            </a>
                            <a href='../images/gallery/large/item-1.jpg' class="gallery-item__descript gallery-item--photo-link">
                                <span class="gallery-item__icon"><i class="fa fa-camera"></i></span>
                                <p class="gallery-item__name">Marble Arch Odeon</p>
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="gallery-item">
                            <a href='../images/gallery/large/item-2.jpg' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="../images/gallery/thumb/item-2.jpg">
                            </a>
                            <a href='../images/gallery/large/item-2.jpg' class="gallery-item__descript gallery-item--photo-link">
                                <span class="gallery-item__icon"><i class="fa fa-camera"></i></span>
                                <p class="gallery-item__name">Camden Town Odeon</p>
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="gallery-item">
                            <a href='../images/gallery/large/item-3.jpg' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="../images/gallery/thumb/item-3.jpg">
                            </a>
                            <a href='../images/gallery/large/item-3.jpg' class="gallery-item__descript gallery-item--photo-link">
                                <span class="gallery-item__icon"><i class="fa fa-camera"></i></span>
                                <p class="gallery-item__name">Camden Town Odeon</p>
                            </a>
                        </div>
                    </div>




                </div>
                </div>
    

                <div class="pagination paginatioon--full">
                    <a href='#' class="pagination__prev">prev</a>
                    <a href='#' class="pagination__next">next</a>
                </div>
            </div>

        </section>
        
        <div class="clearfix"></div>
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
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="../js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Magnific-popup -->
        <script src="../js/external/jquery.magnific-popup.min.js"></script>

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
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_Gallery();
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
						list += '<div class="col-sm-6 col-md-4"><div class="thumbnail alert alert-'+(product.stock==0? 'danger':'warning')+'">';
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
				/* console.log($(window).scrollTop()+ "    :::    "+($(document).height()-$(window).height())); */
				if($(window).scrollTop() >= $(document).height()-$(window).height()){	 				
		//$(window).scrollTop()이 옆항인  $(document).height()-$(window).height()이것과 같으면 fncNextList가 실행되는게 보통인데 경덕컴은 정수가 딱 안떨어져서 크기비교를해야됨
					fncNextList();
				}
			}
		});
	

	</script>

</body>
</html>
