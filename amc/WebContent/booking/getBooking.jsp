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
		
		<!--  font from googleApi -->
		<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
		<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
		
  <script type="text/javascript">
	$( function() {
		
		$("#deleteBooking").on("click" , function() {
			if(confirm("예매를 취소하시겠습니까?")){
				var bookingNo = $("input[name='bookingNo']").val();
				self.location = "/booking/deleteBooking?bookingNo="+bookingNo;
			}		
		});
		
		$("#sendQR").on("click", function(){
			alert("clicked!");
			fncSendMail();
		})
	
	});

	function fncSendMail() {
			
		 var email = $("#email").val();	
		 var bookingNo = "${booking.bookingNo}";
		 //var bookingNo = "b10100";
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) 
			 || email == ""){
	   	alert("이메일 형식이 아닙니다.");
	   	return;
	    }
		alert("메일을 보냅니다. \n이메일주소 : "+email+"\n예매번호 : "+bookingNo);
		self.location="/booking/sendEmailQR?bookingNo="+bookingNo+"&userEmailAddr="+email;
	
	}

</script>
<style>
	.promo--short .promo__head {
	  color: #4c4145;
	  position: relative;
	  display: inline-block;
	  margin-bottom: 6px;
	  margin-top: 8px;
	}
	.promo--short .promo__head:before {
	  content: '';
	  background-image: url(../images/components/wave-dark.svg);
	  background-repeat: no-repeat;
	  background-size: 84px 8px;
	  width: 84px;
	  height: 8px;
	  position: absolute;
	  top: 8px;
	  left: -116px;
	}
	.promo--short .promo__head:after {
	  content: '';
	  background-image: url(../images/components/wave-dark.svg);
	  background-repeat: no-repeat;
	  background-size: 84px 8px;
	  width: 84px;
	  height: 8px;
	  position: absolute;
	  top: 8px;
	  right: -116px;
	}
	.content__text{
	 /*font-family: 'Jeju Gothic', sans-serif;*/
	  font-family: 'Hanna', sans-serif; 
	 
	}
	.abc{
	  font-family: 'Hanna', sans-serif; 
	 }
	 
	 .contact-info {
	  text-align: left;
	}
	.contact-info .contact-info__field {
	  position: relative;
	  width: 100%;
	  display: inline-block;
	  margin-right: 28px;
	}
	.contact-info .contact-info__field .form__mail {
	  padding-left: 60px;
	}
	.contact-info .contact-info__field:before {
	  content: '';
	  width: 39px;
	  height: 39px;
	  -webkit-border-radius: 3px 0 0 3px;
	  -moz-border-radius: 3px 0 0 3px;
	  border-radius: 3px 0 0 3px;
	  background-color: #4c4145;
	  position: absolute;
	  top: 0px;
	  left: 0;
	}
	.contact-info .contact-info__field:after {
	  content: '';
	  color: #b4b1b2;
	  font: 13px "FontAwesome";
	  position: absolute;
	  top: 10px;
	  left: 15px;
	}
	.contact-info .contact-info__field-mail:after {
	  content: "\f0e0";
	  left: 13px;
	}
	.contact-info .contact-info__field-tel:after {
	  content: "\f095";
	}
	.ticket-control .list--download {
	  border-radius: 3px 0 0 3px;
	  margin-right: -5px;
	}
	.watchlist list--download {
		color:white;
	}
	
</style>
</head>
		
<body>

	<div class="container">
	            <!-- Promo boxes -->
            <div class="content-wrapper">
                <h2 class="heading heading--outcontainer">Promo boxes</h2>
                
                <div class="col-sm-3">
                  <div class="promo promo-field">
                      <div class="promo__head">A.Movie app</div>
                      <div class="promo__describe">for all smartphones<br> and tablets</div>
                      <div class="promo__content">
                          <ul>
                              <li class="store-variant"><a href="#"><img alt='' src="/images/apple-store.svg"></a></li>
                              <li class="store-variant"><a href="#"><img alt='' src="/images/google-play.svg"></a></li>
                              <li class="store-variant"><a href="#"><img alt='' src="/images/windows-store.svg"></a></li>
                          </ul>
                      </div>
                  </div>
                </div>
                <div class="col-sm-9">
                  <div class="promo promo--short">
                      <img class="promo__images" alt='' src="/images/tickets.png">
                      <div class="promo__head">My Ticket</div>
                      <div class="promo__describe"><span class="abc">예매 조회 /취소하기</span></div>
                      <div class="promo__content"></div>
                  </div>
                  <div class="promo promo--info">
                      <div class="promo__head"><!-- Join <br> --><span class="abc">${booking.movie.movieNm}</span></div>
                      <div class="promo__content">
                          <p class="content__text">예매번호 : ${booking.bookingNo}&nbsp;&nbsp;&nbsp;&nbsp;
                          	예매 가격 : ${booking.totalTicketPrice}&nbsp;&nbsp;&nbsp;&nbsp;
                          	좌석 번호 : ${booking.bookingSeatNo}&nbsp;&nbsp;&nbsp;&nbsp;	
                          	<br>
                          	좌석 번호 : ${booking.bookingSeatNo}&nbsp;&nbsp;&nbsp;&nbsp;	
                          </p>
                          <a href="#" id="deleteBooking" class="btn btn-md btn--warning btn-wider btn--follow"><span class="abc">예매 취소하기</span></a>                  
                      </div>
                      
                      
						<form id='contact-info' method='post' novalidate="" class="form contact-info">
			                   <div class="contact-info__field contact-info__field-mail"  >
			                        <input type='email' id="email" name='user-mail' value="" placeholder='QR코드를 받을 이메일주소' 
			                        class="form__mail" style="width:50%" autofocus autocomplete="off" required >		                     
			                         <div class="watchlist list--download abc" id="sendQR">QR CODE 전송</div>                   
			                    </div> 			                                                              
		                </form>
                	
                	
                  </div>
                </div>
            </div>
		<!--  end of promo box -->
	
	<!--  yena made -->
	<input type="hidden" name="bookingNo" value="${booking.bookingNo}">
	<!--  yena made -->

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

