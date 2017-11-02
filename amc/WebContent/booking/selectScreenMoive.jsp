<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie - Booking step 1</title>
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
  
  <script type="text/javascript">
   $( function() {
		
		$("li[name='movieName']").on("click" , function() {
			
			var movieNo =  $($(this).find("input[name='movieNo']")).val();
			var movieName =  $($(this).find("input[name='movieName']")).val();
			$(".item").eq(2).html("");
			$(".item").eq(1).html("");
			$(".item").eq(0).html("&nbsp;&nbsp;"+movieName);
			alert('movie title clicked! : '+movieNo);
			var flag = $("input:hidden[name='flag']").val();
			
			$.ajax(
					{
						url : "/booking/json/getScreenDate/"+movieNo+"/"+flag,						
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							console.log('히히 : '+JSONData);								
	                        var str = "";
	                        if(JSONData != ""){
	                            $(JSONData).each(
	                               function(){	
	                            	   
	                            	   str+=  '<li class="time-select__item" name="screenDay">'+this.substring(3,5)+'일'
	                            	   str+=    '<input type="hidden" name="day" value='+this.substring(3,5)+'>'	
									   str+=  '</li>';
	                               });//end of each fnc                            
	                        }//end of if문
	                       
	                        $(".col-sm-6.items-wrap").eq(1).find(".time-select__item").remove();
	                        $(".col-sm-6.items-wrap").eq(2).find(".time-select__item").remove();
	                        $(".col-sm-6.items-wrap").eq(1).html(str);
	                        
						}
				});//end of ajax
		});

	});
   
	//2. 날짜 클릭시
	$(document).on("click", "li[name='screenDay']",  function(){
		alert("날짜를 선택하셨습니다.");
		
		var date =  $($(this).find("input[name='day']")).val();
		$(".item").eq(2).html("");
		$(".item").eq(1).html("&nbsp;&nbsp;"+date+"일");
		$.ajax(
				{
					url : "/booking/json/getScreenTime/"+date,						
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, 
					async : false,
					success : function(JSONData, status) {
						console.log('screenTime 받아옴 : '+JSONData);								
                       var str = "";
                       if(JSONData != ""){
                           $(JSONData).each(
                              function(){
                            	  
                           	   str+= '<li class="time-select__item" name="screenTime">시간 : '+this.screenOpenTime
                           	   +     ', 상영번호 : '+this.screenContentNo+''
                           	   +'<input type="hidden" name="contNo" value="'+this.screenContentNo+'">'
                           	   +'<input type="hidden" name="screenTime" value="'+this.screenOpenTime+'">'
                           	   +'</li>' ;				

                              }//end of function
                            );
                       }//end of if문
                       
                      
                       
                       $(".col-sm-6.items-wrap").eq(2).find(".time-select__item").remove();
                       $(".col-sm-6.items-wrap").eq(2).html(str);

					}
			});//end of ajax
	});
	
	//3. 시간클릭시
	$(document).on("click", "li[name='screenTime']",  function(){
		
		var screenTime = $($(this).find("input[name='screenTime']")).val();
		var contNo = $($(this).find("input[name='contNo']")).val();
		alert("시간을 선택하셨습니다  상영번호는 : "+contNo);
		$(".item").eq(2).html("&nbsp;&nbsp;"+screenTime);
		$(".item").eq(3).text(contNo);

	});
		
	$(document).on("click", "#gotoSeat",  function(){
		
		//로그인 여부 체크
		if(${sessionScope.user==null}){
			
			alert('로그인 후 이용해 주세요');
			//로그인 창 모달로 띄우기
			self.location= "/";
			
		}else{
			
			var screenContentNo = $(".item").eq(3).text();	
			self.location = "/booking/selectSeat?screenContentNo="+screenContentNo;
		}
	
	});
   </script> 
<style>
.time-select .time-select__item {
  position: relative;
  z-index: 10;
  display: inline-block;
  font-size: 12px;
  background-color: #ffd564;
  padding: 9px 15px 8px 14px;
  margin: 5px 16px 5px 0;
  cursor: pointer;
}
.time-select .time-select__item:hover {
  background-color: #fe505a;
}
.time-select .time-select__item:before {
  content: '';
  width: 95%;
  height: 28px;
  border: 1px solid #ffffff;
  position: absolute;
  top: 3px;
  left: 3px;
}
.time-select .time-select__item:after {
  content: '';
  width: 64px;
  height: 34px;
  background-image: url(../images/components/bg-time.png);
  background-repeat: no-repeat;
  -webkit-background-size: 64px 34px;
  background-size: 64px 34px;
  position: absolute;
  top: 0px;
  left: -2px;
  z-index: -1;
}
.time-select .time-select__item:hover:after {
  background-image: url(../images/components/bg-time-hover.png);
}
.time-select .time-select__item.active {
  background-color: #fe505a;
}
.time-select .time-select__item.active:after {
  background-image: url(../images/components/bg-time-hover.png);
}
.choose-indector {
  position: relative;
  z-index: 13;
  width: 100%;
  background-color: #4c4145;
  color: #ffffff;
  font-size: 18px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  padding: 12px 21px 12px;
  cursor: pointer;
  }
.choose-indector:before {
  content: "\f077";
  font: 18px "FontAwesome";
  color: #ffffff;
  position: absolute;
  top: 8px;
  right: 21px;

}

</style>
</head>

<body>
  <%--  <div class="banner-top">
      <img alt='top banner' src="../images/banners/space.jpg">
  </div>
  <header class="header-wrapper header-wrapper--home">
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/topToolbar_.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
   </header> --%>
   <!--  <div class="wrapper"> -->
 	
    <input type="hidden" name="flag" value="1"> 
        <!-- Main content -->

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
                   <div class="order-step first--step">1. What &amp; Where &amp; When</div>
               </div>
        </section>
        


        <section class="container">
            <div class="col-sm-12">
                
                <h2 class="page-heading">Movie</h2>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place">Cineworld</p>
                            </div>
                            
                            <ul class="col-sm-6 items-wrap">
                            <c:set var="i" value="0" />
							  <c:forEach var="movie" items="${movieList}">
								<c:set var="i" value="${ i+1 }" />										  
								  <li class="time-select__item" name="movieName">${movie.movieNm}
								  	<input type="hidden" name="movieNo" value="${movie.movieNo}">
								  	<input type="hidden" name="movieName" value="${movie.movieNm}">
								  </li>
					          </c:forEach> 
                            </ul>                        
                        </div>
                   </div>
               	
                <h2 class="page-heading">Date</h2>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place">Cineworld</p>
                            </div>
                            <ul class="col-sm-6 items-wrap">
                            </ul>
                        </div>
                   </div>

                <h2 class="page-heading">Pick time</h2>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place">Cineworld</p>
                            </div>
                            <ul class="col-sm-6 items-wrap">

                            </ul>
                        </div>
                    </div>

				<br><br>
                <div class="choose-indector choose-indector--time">
                    <strong>Choosen: </strong>
                    <span class="choosen-area">
                    	<span class="item"></span>
						<span class="item"></span>
						<span class="item"></span>
						<input type="hidden" class="item"></input>
					</span>
                </div>
            </div>

        </section>

        <div class="clearfix"></div>

        <form id='film-and-time' class="booking-form" method='get' action='book2.html'>
            <input type='text' name='choosen-movie' class="choosen-movie">

            <input type='text' name='choosen-city' class="choosen-city">
            <input type='text' name='choosen-date' class="choosen-date">
            
            <input type='text' name='choosen-cinema' class="choosen-cinema">
            <input type='text' name='choosen-time' class="choosen-time">
        

            <div class="booking-pagination">
                    <a href="#" class="booking-pagination__prev hide--arrow">
                        <span class="arrow__text arrow--prev"></span>
                        <span class="arrow__info"></span>
                    </a>
                    <a class="booking-pagination__next" id="gotoSeat">
                        <span class="arrow__text arrow--next" >next step</span>
                        <span class="arrow__info">choose a sit</span>
                    </a>
            </div>

        </form>
        
        <div class="clearfix"></div>

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
    <!-- </div> -->

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
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_BookingOne();
            });
		</script>

</body>
</html>
