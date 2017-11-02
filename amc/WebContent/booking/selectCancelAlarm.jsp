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
   
        <!--   Sweetalert2 CDN  -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
	
		<!--   semantic UI  -->
		<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="../semantic/semantic.min.js"></script>
  
  <script type="text/javascript">
  IMP.init('imp41659269');
   var things = "AMC : ";
      things += "예매"

         
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
         
      function addCancelAlarm(){
			var userId = $("input[name='userId']").val(); 
			if( userId == null || userId == ''){
				swal({
					  title: '신청 실패',
					  html: $('<div>')
					    .addClass('some-class')
					    .text('로그인 상태가 아닙니다'),
					  animation: false,
					  customClass: 'animated swing'
					})
				return;
			}
			$.ajax({
			    		url: "/alarm/json/addCancelAlarm/",
			    		type: 'POST',
			    	}).done(function(result) {
			    		console.log("result : " + result);
			    		if ( result == 'success' ) {
			    			var msg = '취소표 알림 신청 성공';
			    			swal({
			    				  //position: 'top-right',
			    				  type: 'success',
			    				  title: '취소표 알림 신청 성공!',
			    				  showConfirmButton: true,
			    				  timer: 2000
			    				})
			    		} else if( result == 'exceed'){
			    			swal(
			    					  '취소표알림 자리 수 초과!',
			    					  '신청 가능한 취소표알림 수 초과 (최대 4 좌석)',
			    					  'error'
			    					)
			    		} else {
			    			swal(
			    					  '중복 좌석 신청!',
			    					  '신청한 좌석 중 기존에 중복된 좌석이 있습니다.'+"\n"+result,
			    					  'error'
			    					)
			    		}
			    	});
		}	 
        
     function addBooking(){
         
        $("form").attr("method" , "POST").attr("action" , "/booking/addBooking").submit();   
        
     }
     
         
   function listener(event){      
        document.getElementById('child').contentWindow.postMessage(event.data,"*");

        if(event.data == 'pay'){
           alert('카카오페이 결제요청이왔습니다.');
           kakaoPay();     
           //지금은 쓰지않는다.
        } else if(event.data.length>100){
         alert('카카오페이관련 event 발생입니다.');
           
        } else if(event.data.indexOf("id")==0){
           //alert('클라이언트 ID를 받습니다. '+event.data.split(",")[1]);
           $("input[name='clientId']").val(event.data.split(",")[1]); 
          
        } else{
           
           alert('좌석번호를 받습니다.');
           
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
   
   function selectCancelAlarm(){
      $("form").attr("method" , "POST").attr("action" , "/alarm/selectCancelAlarm").submit();
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
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
        </header>
        
        <!-- Main content -->
        <div class="place-form-area">
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="../images/cinema/Cancel.jpg">
                    <p class="order__title">Cancel Alarm <br><span class="order__descript">request Cancelalarm</span></p>
                    <div class="order__control">
                        <a href="#" class="order__control-btn active">Alarm</a>
                    </div>
                </div>
            </div>
                <div class="order-step-area">
                    <div class="order-step first--step">Select CancelAlarm Seats</div>
                </div>
            
            <div class="choose-sits">
                <div class="choose-sits__info choose-sits__info--first">
                    <ul>
                       <li class="sits-price marker--none"><strong>취소표 알림은 1인 최대 4좌석 까지 신청 가능합니다</strong></li>
                       <li class="sits-price marker--none"><strong></strong></li>
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
   
         <div class="col-sm-8 com-md-9">   
            <%-- <iframe id="child" src="http://192.168.0.20:52273/yenakoh/3?screenNo=${screenContent.screenContentNo}" --%>
            <iframe id="child" src="http://192.168.0.20:52273/cancelAlarm?screenNo=10358" 
            style='width:100%; height:550px'  frameborder='0' align='center'>       
                    <p>Your browser does not support iframes.</p>
            </iframe>
            <!-- style='width:100%' -->
         </div>
         <div class="col-sm-4 col-md-3">
         	<div class="row"><p/></div>
         	<div class="row"><p/></div>
         	<div class="row"><p/></div>
            <div class="category category--popular marginb-sm">
                      <h3 class="category__title">Selected<br><span class="title-edition">CancelAlarm Info</span></h3>
                      <ul>
                          <li style="font-size:20px; color:black">Seat : </li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                          <li style="font-size:20px; color:black">Seat : </li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                          <li style="font-size:20px; color:black">Seat : </li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                          <li style="font-size:20px; color:black">Seat : </li>
                          <li>&nbsp;</li>
                          <li>&nbsp;</li>
                      </ul>
            </div>
            <button class="ui brown button" style="width:100%; height:50%;"><font size="4px">취소표 알리미</font><p/><font size="4px" color="white">신&nbsp;청</font></button>
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
      </script>
</body>
 <style>
      html{
 	     height: auto;
      }
 </style>
</html>