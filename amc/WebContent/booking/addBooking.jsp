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
 
</head>

<body>
    <div class="wrapper place-wrapper">
        <!-- Banner -->
        <div class="banner-top">
        	<img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
        

        <br><br>
        <!-- Main content -->
        <div class="place-form-area">
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="/images/tickets.png">
                    <p class="order__title">Thank you<br><span class="order__descript">you have successfully purchase tickets</span></p>
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
            <!--  test  -->
            <section class="container">
            <div class="order-container">

                <div class="ticket">
                    <div class="ticket-position">
                        <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div> </div>
                        <div class="ticket__inner">

                            <div class="ticket-secondary">
                                <span class="ticket__item">Ticket number <strong class="ticket__number">${booking.bookingNo}</strong></span>
								<%-- <span class="ticket__item ticket__date">${booking.screenContent.screenDate}</span> --%>
                                <span class="ticket__item ticket__time">${booking.screenContent.screenOpenTime}</span>
                                <span class="ticket__item">Cinema: <span class="ticket__cinema">Americode Cinema</span></span>
                                <span class="ticket__item">Hall: <span class="ticket__hall"> <br>${booking.screenContent.screenTheater}관</span></span>
                                <span class="ticket__item ticket__price">price: <strong class="ticket__cost">${booking.totalTicketPrice}원</strong></span>
                            </div>

                            <div class="ticket-primery">
                                <span class="ticket__item ticket__item--primery ticket__film">Film<br><strong class="ticket__movie">${booking.movie.movieNm} ${booking.screenContent.previewTitle}</strong></span>
                                <span class="ticket__item ticket__item--primery" style="vertical-align:middle">
                                	Sits: <span  align='center left'  class="ticket__place">${displaySeat}</span>
                                	<iframe style='width:50%; height:100%'  frameborder='0' align='right' 
                                	 src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=abc"></iframe>
								</span>
                            </div>


                        </div>
                        <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>
                    </div>
                </div>
                
                 <p></p>
                


              <center><a href="/booking/getBooking?bookingNo=${booking.bookingNo}" class="btn btn-md btn--warning">예매 확인 및 QR코드 보내기</a></center>

               </div> 
   
            </div>
            </div>
            
         <!-- emaill -->   



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
		alert('고객님의 메일로 QR코드를 전송하였습니다.');
		self.location="/booking/sendEmailQR?bookingNo="+bookingNo+"&userEmailAddr="+email;

		
			/* 	  //왜 restController로는 안될까..?	  
 			$.ajax(
	  				{
	  					url : "/booking/json/sendEmailQR/"+bookingNo+"/"+email,						
	  					method : "GET" ,
	  					dataType : "json" ,
	  					headers : {
	  						"Accept" : "application/json",
	  						"Content-Type" : "application/json"
	  					},
	  					
	  					success : function(JSONData, status) {
	  						console.log('JSONData 받아옴 : '+JSONData.str);								
	                        if(JSONData == 1){
	                        	alert("이메일로 QR코드를 전송했습니다.");
	                        }//end of if문

	  					}
	  			});//end of ajax 
	  			*/
	}
  	
  	
  	
   </script>
  <style>
	   .contact-info {
		  text-align: center;
		}
		.reservation-message {
		  position: relative;
		  font-size: 13px;
		  /* padding-left: 45px; */
		  margin-top: 10px;
		  margin-bottom: 8px;
		  
		}
		
		.reservation-message:before {
		  content: '';
		  background-image: url(../images/icons/speech.svg);
		  background-repeat: no-repeat;
		  background-position: right center;
		  -webkit-background-size: 42px 36px;
		  background-size: 42px 36px;
		  width: 45px;
		  height: 40px;
		  position: absolute;
		  top: -4px;
		  left: -1px;
		}
		.form .form__mail,
		.form .form__message {
		  margin-bottom: 10px;
		  width: 100%;
		  border: none;
		  box-shadow: none;
		  border: 1px solid #dbdee1;
		  -webkit-border-radius: 3px;
		  -moz-border-radius: 3px;
		  border-radius: 3px;
		  font-size: 13px;
		  color: #b4b1b2;
		  padding: 9px 18px 10px;
		}
		
		.contact-info {
		  text-align: center;
		}
		.contact-info .contact-info__field {
		  position: relative;
		  width: 460px;
		  display: inline-block;
		  margin-right: 20px;
		}
		.contact-info .contact-info__field .form__mail {
		  padding-left: 35px;
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
		
		.ticket .ticket__item {
		  display: block;
		  margin-bottom: 2.5px;
		  font-family: 'PT Mono';
		  font-size: 15px;
		  text-transform: uppercase;
		  text-align: left;
		  vertical-align:middle
		}
		
   </style> 
		<script type="text/javascript">
            $(document).ready(function() {
                 if($('html').height() < window.outerHeight){
                	$('html').css('height', '100%');
                } 
            });
    		</script>
    		
    		<!-- Custom -->
        	<script src="/js/custom.js"></script>
		    

    		
    		<style type="text/css">
    		 html{
    		  height: auto;
    		} 
    		</style>
</html>

