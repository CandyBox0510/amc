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
				
				$.ajax(
						{
							url : "/booking/json/refundBooking/"+bookingNo,					
							method : "GET" ,
							success : function(JSONData, status) {				
							
		                        if(JSONData == "refunded"){
		                        	alert("정상적으로 환불처리되었습니다.");
		                        	self.location = "/booking/deleteBooking?bookingNo="+bookingNo;
		                        }else{
		                        	alert("환불처리를 실패하였습니다. 관리자에게 문의해주세요.");		                        	
		                        }		                           
							}
					});//end of ajax

			}		
		});
		
		$("#sendQR").on("click", function(){
			fncSendMail();
		})
		
		$("#sendSMS").on("click", function(){
			alert("send SMS clicked!");
			fncSendSMS();
		})
	
	});
	
	function fncSendSMS(){
		var phone = $("#email").val().trim();
		var bookingNo = "${booking.bookingNo}";
		alert("문자를 보낼 번호 : "+phone+", 예매번호 : "+bookingNo);//confirm으로 변경하기
		
		$.ajax(
				{
					url : "/booking/json/sendSMSQR?bookingNo="+bookingNo+"&phone="+phone,
					method : "GET" ,
					success : function(JSONData, status) {								
                       alert('이메일로  QR코드를 전송했습니다.');             
					}
			  });//end of ajax 

	}

	function fncSendMail() {
			
		var email = $("#email").val();	
		var bookingNo = "${booking.bookingNo}";
		if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) 
			 || email == ""){
	   		alert("이메일 형식이 아닙니다.");
	   		return;
	    }
		//alert("메일을 보냅니다. \n이메일주소 : "+email+"\n예매번호 : "+bookingNo);
		$('#sendingAdress').text(email);
		$('#myModal').modal('show');
		$.ajax(
				{
					url : "/booking/json/sendEmailQR?bookingNo="+bookingNo+"&userEmailAddr="+email+"",		
					method : "GET" ,
					success : function(JSONData, status) {
						modalOut();
                        alert('이메일로  QR코드를 전송했습니다.');             
					},
					error : function(jqXHR, status, error){
						modalOut();
						alert('이메일 발송에 실패했습니다. 관리자에게 문의해주세요.');
					}
			});//end of ajax			
		}
	
	
	function modalOut(){
		$('#myModal').modal('hide');	
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
	
	 
	 .contact-info {
	  text-align: left;
	}
	.contact-info .contact-info__field {
	  position: relative;
	  width: 100%;
	  display: inline-block;
	  margin-right: 3px;
	}
	.contact-info .contact-info__field .form__mail {
	  padding-left: 60px;
	}
	.contact-info .contact-info__field:before {
	  content: '';
	  width:70px; /* 39px; */ 
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
	  font: 13px;
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
		margin-left : -10px;
		color:white;
	}
	
</style>
</head>
		
<body>
 <!-- Banner -->
         	<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>
		<header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
		</header>
   		<br><br><br>
	<div class="container">
	            <!-- Promo boxes -->
            <div class="content-wrapper">
                  
                
<!--                 <div class="col-sm-3">
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
                 -->
                
                <aside class="col-sm-3">
                        <div class="sitebar first-banner--left">
                        	<div class="banner-wrap first-banner--left">
                                <img alt='banner' src="../images/booking/onSale.jpg">
                            </div>
                            
                            <div class="banner-wrap first-banner--left">
                                <img alt='banner' src="../images/uploadFiles/${bestProductList[0].prodImage}">
                            </div>

                             <div class="banner-wrap">
                                <img alt='banner' src="../images/uploadFiles/${bestProductList[1].prodImage}">
                            </div>

                             <div class="banner-wrap banner-wrap--last">
                                <img alt='banner' src="../images/uploadFiles/${bestProductList[2].prodImage}">
                            </div>

                            <div class="promo marginb-sm">
                              <div class="promo__head">AMC app</div>
                              <div class="promo__describe">in AndroidPhone<br> You can receive push alarm!</div>
                              <div class="promo__content">
                                  <ul>
                                  	  <li class="store-variant"><a href="#"><img alt='' src="../images/google-play.svg"></a></li>
                                  </ul>
                              </div>
                          </div>
    
                        </div>
                    </aside>
                
                
                
                
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
                          <p class="content__text">
                          	${booking.screenContent.previewTitle}&nbsp;영화제목 : ${booking.movie.movieNm}&nbsp;&nbsp;&nbsp;&nbsp;
                          	&nbsp;&nbsp;상영일자 : ${booking.screenContent.screenOpenTime}&nbsp;&nbsp;&nbsp;&nbsp;<br>
                          	&nbsp;예매번호 : ${booking.bookingNo}&nbsp;&nbsp;&nbsp;&nbsp;
                          	예매일시 : ${booking.bookingRegDate}&nbsp;&nbsp;&nbsp;&nbsp;
                          	예매가격 : ${booking.totalTicketPrice}원&nbsp;&nbsp;&nbsp;&nbsp;
                          	좌석번호 : ${booking.bookingSeatNo}&nbsp;&nbsp;&nbsp;&nbsp;	
                          	<br>
                          </p>
                                            
                      </div>
                      
                     
                     
						<form id='contact-info' method='post' novalidate="" class="form contact-info">
			                   <div class="contact-info__field row"  style="width:100%">
			                   	<div class="col-sm-7" >
			                        <input type='text' id="email" name='user-mail' value="" placeholder='QR코드를 받을 이메일주소' 
			                        class="form__mail abc" style="width:100%" autofocus autocomplete="off" required >
			                    </div><div class="col-sm-5">		                     
			                        <a href="#" id="sendQR" class="btn btn-md btn--warning btn-wider btn--shine abc">이메일 QR전송</a>
							   </div>
			                    </div> 	
			                     <div class="contact-info__field row"  style="width:100%">
			                   	<div class="col-sm-7" >
			                        <input type='text' id="SMS" name='user-mail' value="" placeholder='회원이신 경우 회원가입시에 입력하신 번호로 보내드립니다.' 
			                        class="form__mail abc" style="width:100%" autofocus autocomplete="off" required >
			                    </div><div class="col-sm-5">		                     
			                         <a href="#" id="sendSMS" class="btn btn-md btn--warning btn-wider btn--shine abc">문자&nbsp;&nbsp;&nbsp;&nbsp;QR전송</a>						   
							   </div>
			                    </div>
			                   <div class="row" style="margin-left:2.3px; margin-top:5px; algin:right;">	
			                    <a href="#" id="deleteBooking" class="btn btn-md btn--warning btn-wider btn--follow abc">예매 취소하기</a>	                                                              
		                	  </div>
		                </form>
                	
                	
                  </div>
                </div>
                
                <!--  모달 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
								<h4 class="modal-title abc" id="myModalLabel"><span id="sendingAdress"></span>로 QR코드를 발송중입니다.</h4>
							</div>
						</div>
					</div>
				</div>
                <!-- 모달 -->
                
                
                
            </div>
		<!--  end of promo box -->
	
	<!--  yena made -->
	<input type="hidden" name="bookingNo" value="${booking.bookingNo}">
	<!--  yena made -->

		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

</div>

</body>
	<!--  for modal -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!--  end -->
	
	<!-- JavaScript-->
	<script src="/js/external/modernizr.custom.js"></script>
	
	<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>

    <!-- jQuery UI -->
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <!-- Bootstrap 3--> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

    <!-- Mobile menu -->
    <script src="/js/jquery.mobile.menu.js"></script>
     <!-- Select -->
    <script src="/js/external/jquery.selectbox-0.2.min.js"></script>

    <!-- Custom -->
    <script src="/js/custom.js"></script>
	<script type="text/javascript">
      $(document).ready(function() {
           if($('html').height() < window.outerHeight){
          	$('html').css('height', '100%');
          } 
      });
</script>



<style type="text/css">
 html{
  height: auto;
} 
.abc{
	  font-family: 'Hanna', sans-serif; 
	 }
</style>
</html>

