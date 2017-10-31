<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
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
        <link href="/css/style.css?v=4" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
    
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
  <script type="text/javascript">
var ticketOpenDate="";

    function dpTime(){
    	
    	
    	console.log("open : "+ticketOpenDate);
    	var templist = ticketOpenDate.split('.');
    	console.log("오픈시간 : "+templist[0]);
    	
    	var now = new Date();
    	var screenTime = new Date(templist[0]);
 	   //var screenTime = new Date('17/10/22 12:00:00');
 	  	console.log("now : "+now);  //mon oct 16 2017 10:51:31 GMT+0900
 	  	console.log("now.getTime() : "+now.getTime()); //1508118721142
 	 
 	  	var _second = 1000;
 	  	var _minute = _second * 60;
 	  	var _hour = _minute * 60;
 	  	var _day = _hour * 24;
 	  	var timer;

 	   var diff = (screenTime.getTime() - now.getTime());
 	  	
 	  	var days = Math.floor(diff / _day);
 	  	var hours = Math.floor((diff % _day) / _hour);
 	  	var minutes = Math.floor((diff % _hour) / _minute);
 	  	var seconds = Math.floor((diff % _minute) / _second);
 	  	
 	  	
        if(diff<1){
        	$("button[name='selectSeat']").removeAttr("disabled");
        	$("button[name='selectRandomSeat']").removeAttr("disabled");
        	$("#dpTime").html("허허");
        } 
		
 	 	 if (days < 1){
	         days = "";
	     }
        
        if (hours < 10){
            hours = "0" + hours;
        }
        
        if (minutes < 10){
            minutes = "0" + minutes;
        }
        
        if (seconds < 10){
            seconds = "0" + seconds;
        }
       
        if(diff<1){
        	
        }else{
			document.getElementById("dpTime").innerHTML =days+ "일 " + hours + ":" + minutes + ":" + seconds;
        }
    }

    //////////////////////////////////////////////////
    //1. 영화제목 클릭시
		$( function() {
			
			$(".movieName").on("click" , function() {
				
				var movieNo =  $($(this).find("input[name='movieNo']")).val();
				var flag = $("input:hidden[name='flag']").val();
				var movieName =  $($(this).find("input[name='movieName']")).val();
				$(".item").eq(0).text(movieName);
				
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
		                            	  str+= 	'<div class="screenDay">'+this+'일'
		                            	  str+=     '<input type="hidden" name="day" value='+this+'>'
		                            	  str+=	'</div>';
				                      });//end of each fnc                            
			                        }//end of if문
			                        $(".col-md-4").eq(1).find(".screenDay").remove();
			                        $(".col-md-4").eq(2).find(".screenTime").remove();
			                        $(".col-md-4").eq(1).find(".head").after(str);

							}
					});//end of ajax
			});

		});
		
		
		//2. 날짜 클릭시
		$(document).on("click", ".screenDay",  function(){
			alert("날짜를 선택하셨습니다.");

			var date =  $($(this).find("input[name='day']")).val();
			$(".item").eq(1).text(date);
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
	                            	   str+= '<div class="screenTime">시간 : '+this.screenOpenTime
	                            	   +     ', 상영번호 : '+this.screenContentNo+'  티켓오픈시간은 : '+this.ticketOpenDate
	                            	   +'<input type="hidden" name="contNo" value="'+this.screenContentNo+'">'
	                            	   +'<input type="hidden" name="ticketOpenDate" value="'+this.ticketOpenDate+'">'
	                            	   +'<input type="hidden" name="screenTime" value="'+this.screenOpenTime+'">'
	                            	   +'</div>' ;				
	                            	   
	                               }//end of function
	                             );
	                        }//end of if문
	                        
	                        $(".col-md-4").eq(2).find(".screenTime").remove();
	                        $(".col-md-4").eq(2).find(".head").after(str);
						}
				});//end of ajax
		});
		
		//3. 시간클릭시
		$(document).on("click", ".screenTime",  function(){
			
			var contNo = $($(this).find("input[name='contNo']")).val();
			ticketOpenDate = $($(this).find("input[name='ticketOpenDate']")).val();
			var screenTime = $($(this).find("input[name='screenTime']")).val();
			$(".item").eq(2).text(screenTime);
			
			alert("티켓오픈시간 :"+ticketOpenDate);
			
			$("#display").text(contNo);	
			
			setInterval("dpTime();",1000);
			
		});
			

	$( function(){	

    	$("button[name='selectSeat']").on("click", function(){
    		var screeContentNo = $("#display").text();
	    	self.location="/booking/selectSeat?screenContentNo="+"10000";
	    });
    	$("button[name='tempSelectSeat']").on("click", function(){
    		var screeContentNo = $("#display").text();
    		self.location="/booking/selectSeat?screenContentNo="+"10000";
	    });
    	$("button[name='selectRandomSeat']").on("click", function(){
    		var screeContentNo = $("#display").text();
    		var headCount = $("input:radio[name=headCount]:checked").val();
    		if( $("input:radio[name=headCount]:checked").length<1){
    			alert("인원수를 먼저 선택해주세요.");
    		}else{
    			alert("랜덤좌석을 "+headCount+"석 신청합니다.");
    			//self.location="/booking/selectRandomSeat?screenContentNo="+screeContentNo+"&headCount="+headCount;	
        		self.location="/booking/selectRandomSeat?screenContentNo=10172&headCount="+headCount+"";
    		}
    		
	    });
    
    })
</script>
</head>
	<body>
	    <div class="wrapper wrapper-images">
        <div class="comming-wrapper">
        <div class="order-container">
               
        <section class="container">
         
         	<div class="order">
              <img class="order__images" alt='' src="/images/tickets.png">
              <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
              <div class="order__control">
                  <a href="#" class="order__control-btn active">Purchase</a>
                  <a href="#" class="order__control-btn">Reserve</a>
              </div>
            </div>
            
           
        
            <div class="couter">
                <div class="timer-wrap">
                    <div class="timer-bg"></div>
                    <span class="digits"></span>
                    <input class="knob day" data-min="0" data-max="100" data-bgColor="rgba(255,255,255,0.2)" data-fgColor="#ffd564" data-displayInput=false data-width="200" data-height="200" data-thickness=".11">
                    <div class="digits-label">days</div>
                </div>
                <div class="timer-wrap">
                    <div class="timer-bg"></div>
                    <span class="digits"></span>
                    <input class="knob hour" data-min="0" data-max="24" data-bgColor="rgba(255,255,255,0.2)" data-fgColor="#ffd564" data-displayInput=false data-width="200" data-height="200" data-thickness=".11">
                    <div class="digits-label">hours</div>
                </div>
                <div class="timer-wrap">
                    <div class="timer-bg"></div>
                    <span class="digits"></span>
                    <input class="knob minute" data-min="0" data-max="60" data-bgColor="rgba(255,255,255,0.2)" data-fgColor="#ffd564" data-displayInput=false data-width="200" data-height="200" data-thickness=".11">
                    <div class="digits-label">minutes</div>
                </div>
                <div class="timer-wrap">
                    <div class="timer-bg"></div>
                    <span class="digits"></span>
                    <input class="knob second" data-min="0" data-max="60" data-bgColor="rgba(255,255,255,0.2)" data-fgColor="#ffd564" data-displayInput=false data-width="200" data-height="200" data-thickness=".11">
                    <div class="digits-label">seconds</div>
                </div>
            </div>
          </section>
          </div> 
        </div>
    
    </div>
	
	
   <!--  <div class="wrapper"> -->
 	<div class="item">selected movie</div>
	<div class="item"></div>
	<div class="item"></div>
	<div class="item"></div>
    <input type="hidden" name="flag" value="1"> 
       <!-- Main content -->

        <section class="container">
        
         <div class="order-step-area">
                <div class="order-step first--step">1. What &amp; Where &amp; When</div>
         </div>
            <div class="col-sm-12">
                
                <h2 class="page-heading">Preview</h2>

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
                    <strong>Choosen: </strong><span class="choosen-area"></span>
                </div>
            </div>

        </section>
        
        

	<input type="hidden" name="flag" value="2">
	<input type="hidden" name="openTime" value="2017-10-27 12:00:00">

	<h3><span id ="timer">티켓 오픈까지 남은시간 : <span id="dpTime">현재시간 표시</span></span></h3>


	<button class="ui inverted green button" name="selectSeat" disabled="disabled">(시간되면 활성화) 좌석선택</button>
	<button class="ui inverted green button" name="tempSelectSeat">[테스트용] 좌석선택 </button>
	
	<p>
	
	<div class="ui form">
		<button class="ui inverted purple button" name="selectRandomSeat" disabled="disabled"> 랜덤좌석 선택하기 </button>
	
	  <div class="inline fields">
	    <label>&nbsp;랜덤좌석 홀딩을 위한 인원수를 선택해주세요</label>
	    <div class="field">
	      <div class="ui radio checkbox">
	        <input type="radio" name="headCount" value="1">
	        <label class="lb">1명</label>
	      </div>
	    </div>
	    <div class="field">
	      <div class="ui radio checkbox">
	        <input type="radio" name="headCount" value="2">
	        <label class="lb">2명</label>
	      </div>
	    </div>	        
	 </div>
	</div>



	 <input type="hidden" name="flag" value="1">
      <div class="row">
        <div class="col-md-4">
         <div class="head"><h3>시사회 제목</h3></div>
          <table>
	          <c:set var="i" value="0" />
			  <c:forEach var="screenContent" items="${screenContentList}">
				<c:set var="i" value="${ i+1 }" />
						  
				  <div align="left" class="movieName"><h5>${screenContent.previewTitle} </h5>
				  	<input type="hidden" name="movieNo" value="${screenContent.screenContentNo}">
				  	<input type="hidden" name="movieName" value="${screenContent.previewTitle}">
				  </div>
				
	          </c:forEach>        
          </table>
        </div>
		<div class="col-md-4" id="dayList">
			<div class="head"><h3>상영 날짜</h3></div>
	   	</div>
	   	<div class="col-md-4" id="dayList">
			<div class="head"><h3>상영 날짜</h3></div>
	   	</div>
      </div>
      
 

      <div id="display" ></div>
     
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
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Knob js -->
        <script src="/js/external/jquery.knob.js"></script>
        <!-- Count comimg soon -->
        <script src="/js/external/count.down.js"></script>

        <script>
            $(document).ready(function() {
                //CountDown
                var dateOfBeginning = "Jan 16, 2017", //type your date of the Beginnig
                    dateOfEnd = "Dec 25, 2017"; //type your date of the end

                countDown(dateOfBeginning, dateOfEnd);            
            });
        </script>
     
     
	</body>
</html>
