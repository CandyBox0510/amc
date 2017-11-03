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
	
		<!--  ///////////////////////// Sweetalert CDN ////////////////////////// -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">

<title>selectRandomSeat.jsp</title>

<style>
	button.ui.inverted.purple.button{
	font-size: 1.8rem;
	}

	div.ui.red.horizontal.label {
	 font-size: 1.52rem;
	}
	.abc{
	  font-family: 'Hanna', sans-serif; 
	  font-size: 120%;
}	
    /* #child {
-ms-zoom: 0.75;
-moz-transform: scale(0.75);
-moz-transform-origin: 0 0;
-o-transform: scale(0.75);
-o-transform-origin: 0 0;
-webkit-transform: scale(0.75);
-webkit-transform-origin: 0 0;
} */
</style>

<script type="text/javascript">
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
			    amount : $("#totalPrice").text(), /* ticket or product price */
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
			    		if (  payStatusCheck == 'paid' && amountCheck == $("input[name='totalTicketPrice']").val()) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\n결제 금액 : ' + rsp.paid_amount;
			    			msg += '\n카드 승인번호 : ' + rsp.apply_num;

			    			$("input[name='qrUrl']").val("https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl="+impUid);
			    			$("input[name='impId']").val(impUid);
			    			
			    			alert("AJAX 후 결제완료 후 "+"\n"+msg);			    			
			    			
			    			confirmSeat();
			    			addBooking();
			    			
			    		} else {
			    			alert("111 AJAX 후 실패\n 결제 금액이 요청한 금액과 달라 결제를 자동취소처리 하였습니다");
			    			kakaoPayCancel(impUid);
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    			/**************************************/
			    			//node서버에 롤백 요청하기
			    			//rollbackSeat();
			    			//self.location = "/booking/selectSeat?screenContentNo="+${screenContent.screenContentNo};
			    			
			    		}
			    	});
			    	
			    } else {
			        var msg = '222 결제에 실패하였습니다.';
			        var errorMsg = '실패사유 : ' + rsp.error_msg;
			        alert("AJAX 전 실패"+"\n"+msg+"\n"+errorMsg);
			        
			        /**************************************/
			        //node서버에 롤백 요청하기
			        //rollbackSeat();
			        
			        //self.location = "/booking/selectSeat?screenContentNo="+${screenContent.screenContentNo};
			        
			        
			    }//end of rsp.success else 
			}); //end of Imp.request_pay
		}//end of kakaoPay function
		
	function confirmSeat(){
		
		var clientId = $("input[name='clientId']").val();
		
		  $.ajax(
					{
						url : "/booking/json/confirmSeat/"+clientId,				
						method : "GET" ,
						async : false,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						
						success : function(JSONData, status) {
							console.log('SeatNo 받아옴 : '+JSONData.seatNo);								
	                      if(JSONData != ""){
	                    	  console.log('ajax로 좌석 rollback resCode: '+jsonData);
	                      }//end of if문
						}
			});//end of ajax		
	}	
		
  	function kakaoPayCancel(impUid){
  		$.ajax({
  		    		url: "/cinema/json/cancelPay/"+impUid,
  		    		type: 'GET',
  		    	}).done(function(data) {
  		    		alert("data : " + data);
  		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
  		    		if ( data == 'cancelled' ) {
  		    			var msg = '취소가 성공적으로 처리되었습니다.';

  		    			alert("아작스 취소 후 "+"\n"+msg);

  		    			location.href="/#"
  		    			
  		    		} else {
  		    			alert("취소가 실패하였습니다.");
  		    			//[3] 아직 제대로 결제가 되지 않았습니다.
  		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
  		    		}
  		    	});
  	}//end of kakaoPayCancel function	
  	
	function addBooking(){
		
		$("addBooking").attr("method" , "POST").attr("action" , "/booking/addBooking").submit();	
		
	}
	function listener(event){		
		  document.getElementById('child').contentWindow.postMessage(event.data,"*");
	
		  if(event.data == 'pay'){
			  alert('카카오페이 결제요청이왔습니다.');
			  kakaoPay();	  
		
		  }else if(event.data == 'failed'){
			  
			alert("랜덤좌석 선택에 실패하여 좌석선택 페이지로 이동합니다.");
			self.location = "/booking/selectSeat?screenContentNo="+${screenContent.screenContentNo};
			
		  } else if(event.data.length>100){
			alert('카카오페이 결제진행 관련 알림입니다.');
			  
		  } else if(event.data.indexOf("id")==0){
			  //클라이언트 아이디를 전송받음
			  $("input[name='clientId']").val(event.data.split(",")[1]); 
		  }else{
			  
			  //alert('좌석번호를 받았습니다.');		  	
			  $("input[name='bookingSeatNo']").val(event.data);
			  var no = ${screenContent.ticketPrice};
			  $.ajax(
				{
				    url : "/booking/json/getDisplaySeatNo/"+event.data+"/"+no,						
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					
					success : function(JSONData, status) {
						console.log('SeatNo 받아옴 : '+JSONData.seatNo);								
	                if(JSONData != ""){
	                	$("#seatNo").text(JSONData.seatNo);
	                	$("#headCount").text(JSONData.headCount);
	                	$("#totalPrice").text(JSONData.totalPrice);
	                	
	                	//form전송을 위한 hidden input에 값 셋팅하기
	                	$("input[name='displaySeat']").val(JSONData.seatNo);
	                	$("input[name='headCount']").val(JSONData.headCount);
	              		$("input[name='totalTicketPrice']").val(JSONData.totalPrice);
	                }//end of if문
					}
			});//end of ajax
					  	  
		  }
	}
		
		
	if (window.addEventListener){
		  addEventListener("message", listener, false);
	} else {
		  attachEvent("onmessage", listener)
	}
	

		
		
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
                               <ul class="mega-menu container">
                                    <li class="col-md-3 mega-menu__coloum">
                                        <h4 class="mega-menu__heading">Now in the cinema</h4>
                                         <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">The Counselor</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Bad Grandpa</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Blue Is the Warmest Color</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Capital</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Spinning Plates</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Bastards</a></li>
                                          </ul>
                                      </li>
                                        
                                      <li class="col-md-3 mega-menu__coloum mega-menu__coloum--outheading">
                                          <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">Gravity</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Captain Phillips</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Carrie</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Cloudy with a Chance of Meatballs 2</a></li>
                                          </ul>
                                      </li>
                                      
                                      <li class="col-md-3 mega-menu__coloum">
                                        <h4 class="mega-menu__heading">Ending soon</h4>
                                          <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">Escape Plan</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Rush</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Prisoners</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Enough Said</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">The Fifth Estate</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Runner Runner</a></li>
                                          </ul>
                                      </li>
                                    
                                      <li class="col-md-3 mega-menu__coloum mega-menu__coloum--outheading">
                                          <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">Insidious: Chapter 2</a></li>
                                          </ul>
                                      </li>
                               </ul>
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
                    <div class="order-step second--step">2. Choose a sit</div>
                </div>
            
            <div class="choose-sits">
                <div class="choose-sits__info choose-sits__info--first">
                    <ul>
                        <li class="sits-price marker--none"><strong>랜덤으로 선택되어 홀딩된 좌석입니다.</strong></li>
                        <li class="sits-price marker--none"><strong>결제 실패 시에는 좌석 홀딩이 종료됩니다.</strong></li>
                    </ul>
                </div>

                <div class="choose-sits__info">
                    <ul>
                        <li class="sits-state sits-state--not">Not available</li>
                        <li class="sits-state sits-state--your">Yourd choice</li>
                    </ul>
                </div>
          </div>
          <!--  only UI -->
	
			<div  class="col-sm-8 com-md-9">

				<iframe id="child" src="http://192.168.0.32:52273/random_select?screenNo=${screenContent.screenContentNo}&headCount=${headCount}"
				style='width:100%; height:400px;' frameborder='0'  align='center'>		 
						  <p>Your browser does not support iframes.</p>
				</iframe>

				 <button onclick="kakaoPay()" class="ui inverted purple button">결제하기</button>	
			 	
			</div>
			
			
			
			<div class="col-sm-4 col-md-3">
				<div class="category category--popular marginb-sm">
                      <h3 class="category__title">Selected<br><span class="title-edition">Ticket Info</span></h3>
                      <ul>
                          <li><a href="#" class="category__item abc">Title: ${movie.movieNm} ${screenContent.previewTitle}</a></li>
                          <li><a href="#" class="category__item abc">Tickets:<span id="headCount"></span></a></li>
                          <li><a href="#" class="category__item abc">Seats: <span id="seatNo"></span></a></li>
                          <li><a href="#" class="category__item abc">Theater: ${screenContent.screenTheater}상영관</a></li>
                          <li><a href="#" class="category__item abc"><!-- Date & Time:&nbsp;&nbsp;  --> ${screenContent.screenDate}&nbsp; ${screenContent.screenOpenTime}</a></li>
                          <li><a href="#" class="category__item abc">Total Price:<span id="totalPrice">0</span>원</a></li>
                      </ul>
                  </div>
			</div>

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
     </div>
  

</body>
</html>
