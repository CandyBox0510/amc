<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <!--  기존 src -->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
		<!--  ///////////////////////// Sweetalert CDN ////////////////////////// -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
//imp초기화는 페이지 첫단에 해주는게 좋음
  IMP.init('imp41659269');
  	var things = "AMC : ";
  		things += "예매"

  	
  	function kakaoPay(){
  			alert("name : "+things);
  				IMP.request_pay({
  				    pg : 'kakao',
  				    pay_method : 'kapy',
  				    merchant_uid : 'merchant_' + new Date().getTime(),
  				    name : things,
  				    amount : "${booking.totalTicketPrice}", /* ticket or product price */
  				    buyer_email : "${user.userId}",
  				    buyer_name : "${user.userName}",
  				    buyer_tel : "${user.phone1}-${user.phone2}-${user.phone3}",
  				    buyer_addr : "${user.addr}+${user.addrDetail}"
  				}, function(rsp) {
  				    if ( rsp.success ){
  						
  				    	alert("impuid : " + rsp.imp_uid); //결제되서 여기는 뜸
  				    	console.log("impuid : "+rsp.imp_uid);
  				    	var impUid = rsp.imp_uid; 
  				    	
  				    	$.ajax({
  				    		url: "/cinema/json/checkPay/"+impUid, //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
  				    		type: 'GET',
  				    	}).done(function(data) {
  				    		alert("data : " + data);
  				    		var payStatusCheck = (data.split(','))[0];
  				    		var amountCheck = (data.split(','))[1];
  				    		alert("payStatusCheck : "+payStatusCheck+"\n"+"amountCheck : "+amountCheck);
  				    		
  				    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
  				    		if (  payStatusCheck == 'paid' && amountCheck == '${booking.totalTicketPrice}') {
  				    			var msg = '결제가 완료되었습니다.';
  				    			msg += '\n고유ID : ' + rsp.imp_uid;
  				    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
  				    			msg += '\n결제 금액 : ' + rsp.paid_amount;
  				    			msg += '\n카드 승인번호 : ' + rsp.apply_num;

  				    			$("input[name='qrUrl']").val("https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl="+impUid);
  				    			$("input[name='impId']").val(impUid);
  				    			
  				    			alert("AJAX 후 결제완료 후 "+"\n"+msg);
  				    			
  				    			addBooking();
  				    			
  				    		} else {
  				    			alert("AJAX 후 실패\n 결제 금액이 요청한 금액과 달라 결제를 자동취소처리 하였습니다");
  				    			kakaoPayCancel(impUid);
  				    			//[3] 아직 제대로 결제가 되지 않았습니다.
  				    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
  				    		}
  				    	});
  				    	
  				    } else {
  				        var msg = '결제에 실패하였습니다.';
  				        var errorMsg = '실패사유 : ' + rsp.error_msg;
  				        alert("AJAX 전 실패"+"\n"+msg+"\n"+errorMsg);
  				    }//end of rsp.success else 
  				}); //end of Imp.request_pay
  			}//end of kakaoPay function
  			
  	function kakaoPayCancel(impUid){
  		$.ajax({
  		    		url: "/cinema/json/cancelPay/"+impUid,
  		    		type: 'GET',
  		    	}).done(function(data) {
  		    		alert("data : " + data);
  		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
  		    		if ( data == 'cancelled' ) {
  		    			var msg = '취소가 성공적으로 처리되었습니다.';
  		    			/* msg += '\n고유ID : ' + rsp.imp_uid;
  		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
  		    			msg += '\n결제 금액 : ' + rsp.paid_amount;
  		    			msg += '\n카드 승인번호 : ' + rsp.apply_num; */

  		    			alert("아작스 취소 후 "+"\n"+msg);
  		    			
  		    			//location.href="/index.jsp"
  		    			location.href="/#"
  		    			
  		    		} else {
  		    			alert("취소가 실패하였습니다.");
  		    			//[3] 아직 제대로 결제가 되지 않았습니다.
  		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
  		    		}
  		    	});
  	}//end of kakaoPayCancel function	
  	
  	function addBooking(){
  						
  		$("#addBooking").attr("method" , "POST").attr("action" , "/booking/addBooking").submit();	
  		
  	}
  	
  	function a(){
  		$("input[name='qrUrl']").val("https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=123");
  		alert($("input[name='qrUrl']").val());
  	}
  	
  	$(document).ready(function() {
  		var seatNo ="${booking.bookingSeatNo}"; 
  	  $.ajax(
  				{
  					url : "/booking/json/getDisplaySeatNo/"+seatNo,						
  					method : "GET" ,
  					dataType : "json" ,
  					headers : {
  						"Accept" : "application/json",
  						"Content-Type" : "application/json"
  					},
  					
  					success : function(JSONData, status) {
  						console.log('SeatNo 받아옴 : '+JSONData.str);								
                        if(JSONData != ""){
                        	$("#displaySeat").text(JSONData.str);
                        }//end of if문

  					}
  			});//end of ajax
  	})
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
            <div class="container">
                <!-- Logo link-->
                <a href='index.html' class="logo">
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
                            <a href="#">Pages</a>
                            <ul>
                                <li class="menu__nav-item"><a href="movie-page-left.html">Single movie (rigth sidebar)</a></li>
                                <li class="menu__nav-item"><a href="movie-page-right.html">Single movie (left sidebar)</a></li>
                                <li class="menu__nav-item"><a href="movie-page-full.html">Single movie (full widht)</a></li>
                                <li class="menu__nav-item"><a href="movie-list-left.html">Movies list (rigth sidebar)</a></li>
                                <li class="menu__nav-item"><a href="movie-list-right.html">Movies list (left sidebar)</a></li>
                                <li class="menu__nav-item"><a href="movie-list-full.html">Movies list (full widht)</a></li>
                                <li class="menu__nav-item"><a href="single-cinema.html">Single cinema</a></li>
                                <li class="menu__nav-item"><a href="cinema-list.html">Cinemas list</a></li>
                                <li class="menu__nav-item"><a href="trailer.html">Trailers</a></li>
                                <li class="menu__nav-item"><a href="rates-left.html">Rates (rigth sidebar)</a></li>
                                <li class="menu__nav-item"><a href="rates-right.html">Rates (left sidebar)</a></li>
                                <li class="menu__nav-item"><a href="rates-full.html">Rates (full widht)</a></li>
                                <li class="menu__nav-item"><a href="offers.html">Offers</a></li>
                                <li class="menu__nav-item"><a href="contact.html">Contact us</a></li>
                                <li class="menu__nav-item"><a href="404.html">404 error</a></li>
                                <li class="menu__nav-item"><a href="coming-soon.html">Coming soon</a></li>
                                <li class="menu__nav-item"><a href="login.html">Login/Registration</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="page-elements.html">Features</a>
                            <ul>
                                <li class="menu__nav-item"><a href="typography.html">Typography</a></li>
                                <li class="menu__nav-item"><a href="page-elements.html">Shortcodes</a></li>
                                <li class="menu__nav-item"><a href="column.html">Columns</a></li>
                                <li class="menu__nav-item"><a href="icon-font.html">Icons</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="page-elements.html">Booking steps</a>
                            <ul>
                                <li class="menu__nav-item"><a href="book1.html">Booking step 1</a></li>
                                <li class="menu__nav-item"><a href="book2.html">Booking step 2</a></li>
                                <li class="menu__nav-item"><a href="book3-buy.html">Booking step 3 (buy)</a></li>
                                <li class="menu__nav-item"><a href="book3-reserve.html">Booking step 3 (reserve)</a></li>
                                <li class="menu__nav-item"><a href="book-final.html">Final ticket view</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="gallery-four.html">Gallery</a>
                            <ul>
                                <li class="menu__nav-item"><a href="gallery-four.html">4 col gallery</a></li>
                                <li class="menu__nav-item"><a href="gallery-three.html">3 col gallery</a></li>
                                <li class="menu__nav-item"><a href="gallery-two.html">2 col gallery</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="news-left.html">News</a>
                            <ul>
                                <li class="menu__nav-item"><a href="news-left.html">News (rigth sidebar)</a></li>
                                <li class="menu__nav-item"><a href="news-right.html">News (left sidebar)</a></li>
                                <li class="menu__nav-item"><a href="news-full.html">News (full widht)</a></li>
                                <li class="menu__nav-item"><a href="single-page-left.html">Single post (rigth sidebar)</a></li>
                                <li class="menu__nav-item"><a href="single-page-right.html">Single post (left sidebar)</a></li>
                                <li class="menu__nav-item"><a href="single-page-full.html">Single post (full widht)</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="#">Mega menu</a>
                        </li>
                    </ul>
                </nav>
                
                <!-- Additional header buttons / Auth and direct link to booking-->
                <div class="control-panel">
                    <a href="#" class="btn btn--sign login-window">Sign in</a>
                    <a href="#" class="btn btn-md btn--warning btn--book login-window">Book a ticket</a>
                </div>

            </div>
        </header>
        
        <!-- Search bar -->
        <div class="search-wrapper">
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
        <div class="place-form-area">
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="/images/tickets.png">
                    <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
                    <div class="order__control">
                        <a href="#" class="order__control-btn active">Purchase</a>
                        <a href="#" class="order__control-btn">Reserve</a>
                    </div>
                </div>
            </div>
                <div class="order-step-area">
                    <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>
                    <div class="order-step second--step order-step--disable">2. Choose a sit</div>
                    <div class="order-step third--step">3. Check out</div>
                </div>
            
            <div class="col-sm-12">
                <div class="checkout-wrapper">
                    <h2 class="page-heading">Ticket</h2>
                    <ul class="book-result">
                    	<li class="book-result__item">Title: <span class="book-result__count">영화명 : ${booking.movie.movieNm} 시사회명 :${booking.screenContent.previewTitle}</span></li>
                        <li class="book-result__item">Tickets: <span class="book-result__count">${booking.headCount} </span></li>
                        <li class="book-result__item">Theater: <span class="book-result__count">${booking.screenContent.screenTheater}상영관</span></li>
                        <li class="book-result__item">Date & Time: <span class="book-result__count">${booking.screenContent.screenDate}&nbsp; ${booking.screenContent.screenOpenTime}</span></li>
                        <li class="book-result__item">Seats: <span class="book-result__count" id="displaySeat">좌석번호</span></li>
                   </ul>
                    
					<h2 class="page-heading">price</h2>
                    <ul class="book-result">
                    	<li class="book-result__item">Total: <span class="book-result__count booking-cost">${booking.totalTicketPrice}원</span></li>
                    </ul>
                    
                    <h2 class="page-heading">Choose a payment mehtod</h2>
            
                    <form id='contact-info' method='post' novalidate="" class="form contact-info">
                        <div class="contact-info__field contact-info__field-mail">
                            <input type='email' name='user-mail' placeholder='카카오페이' class="form__mail">
                        </div>
                    </form>
                    
                    <p class="reservation-message">Fill your contact information to recieve your reservation code. Reserved tickets are removed 20 minutes befor the session is due to start</p>
                
                </div>
                
                <div class="order">
                    <a href="javascript:kakaoPay()" class="btn btn-md btn--warning btn--wide" >reserve</a>
                    <a href="javascript:kakaoPayCancel()" class="btn btn-md btn--warning btn--wide" >cancel reservation</a>
                </div>

            </div>
          
        </section>  
                   
            </div>
            </div>

	<form id="addBooking">
	<!--  !!!!!!!!!!!!!!!!!!!!!!!!!input type hidden으로 나중에 바꾸기 -->
		<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
		<input type="hidden" name="screenContentNo" value="${booking.screenContent.screenContentNo}"/>
		<input type="hidden" name="bookingSeatNo" value="${booking.bookingSeatNo}"/>
		<!-- <input type="hidden" name="impId" value=""/>  -->
		<input type="hidden" name="impId" value="abc"/>
		<input type="hidden" name="headCount" value="${booking.headCount}"/>
		<input type="hidden" name="totalTicketPrice" value="${booking.totalTicketPrice}"/>
		<!-- <input type="hidden" name="qrUrl" value=""/> -->
		<input type="hidden" name="qrUrl" value="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=abc"/>
		
	</form>
        
        

        <div class="clearfix"></div>
        
        <div class="booking-pagination">
                <a href="book2.html" class="booking-pagination__prev">
                    <p class="arrow__text arrow--prev">prev step</p>
                    <span class="arrow__info">choose a sit</span>
                </a>
                <a href="#" class="booking-pagination__next hide--arrow">
                    <p class="arrow__text arrow--next">next step</p>
                    <span class="arrow__info"></span>
                </a>
        </div>

        
        <div class="clearfix"></div>
	<div>
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


</body>
</html>
