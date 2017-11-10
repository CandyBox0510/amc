
<%@ page language="java" contentType="text/html;"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html class="no-js" lang="ko">

<head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
</head>

<body>

    <div class="wrapper">
   		
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
    <div class="container" id="body">
                
        <div class="col-sm-12">
 			
                <h1 class="page-heading"> 시사회 영화 </h1>   
                
                   <div class="col-md-2 text-right">          
                    <form class="form-inline" name="detailForm">
                 
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  	 </form>
				   </div>
				   		
				  <i class='fa fa-search' id="searchIcon" style="color:grey"></i>  &nbsp; 	
				  <i class='fa fa-microphone' id="voidSearchIcon" style="color:grey"></i>	     
        		  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <!-- Login Common PlugIn -->
				  <jsp:include page="/layout/loginModal.jsp" />   
				  
			  <hr/>   
				  
				  <div class="widget" align="center">	
					  <button type="button" class="btn btn-thumnail">썸네일로 보기</button>
					  <button type="button" class="btn btn-calendar">캘린더로 보기</button>
					 
					  <!-- <input type="submit" value="캘린더로">   -->
					
				  </div>
       
        
                <div class="cinema-wrap">
	            	<div class="row">
				 		<c:set var="i" value="0" />
                		 <c:forEach var="preview" items="${list }">
                		 <c:set var="i" value="${i+1 }" />
                		 
	                            <div class="col-xs-6 col-sm-3 cinema-item">
	                                <div class="cinema">
	                                    <a href='/movie/getMovie?movieNo=${preview.movie.movieNo}&menu=preview' class="cinema__images">
	                                        <img id="poster"alt='' src="${preview.movie.postUrl}" >                                        
	                                    </a>
	                                    <a href="/movie/getMovie?movieNo=${preview.movie.movieNo}&menu=preview" class="movieNm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${preview.movie.movieNm}</a>
	                                    <style>P{margin-top:0px;margin-bottom:0px;}</style>
	                                    <p ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;감독 :${preview.movie.directors} </strong> </p>
	                                    <p ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오픈날짜 :${preview. ticketOpenDate} </strong> </p>
	                                    <p ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상영날짜 :${preview.screenOpenTime} </strong> </p>
	                    	     		<p ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격  :${preview. ticketPrice} </strong> </p>
	                    	    <div style="text-align: left;">
    						    
    						    </div>								
    							 
    							 <input type='hidden' name='test${movie.movieNo }'  value='${movie.movieNo }'>
     						
							    <span style="line-height:0%">
							    <c:set var="name" value="${movie.wishList.wishNo}"/>
	 								<c:if test="${name eq '0'}">
									      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fa fa-heart-o' id="${movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;"> 
									     	<input type='hidden' id='scMovieNo' 	 value="${movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	
									     </i> 						
								    </c:if>	
								    
								    <c:if test="${name ne '0'}">
									     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fa fa-heart' id="${movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;">
									    	<input type='hidden' id='scMovieNo' 	 value="${movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	 
									    </i> 						
									</c:if>	
							   </span>                                                   

	                             &nbsp;&nbsp;

	                            <span style="line-height:0%">
	                             
	                            <input type='hidden' name='screenMovieNo'  value='"+val.movieNo+"'>	                                                  
	                            <i class='fa fa-bell' id='reserve-ticket' style="color:#FB1D04; text-align : center; margin:0 auto;">예매 </i>   
	                            </span>
	                         
	                                    
	                                    	     
	                                </div>
	                            </div>                      
	                    		
                		 </c:forEach>
					</div>
	           </div>     
       
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
			

        
        <div class="clearfix"></div>

		<jsp:include page="/layout/bottomToolbar.jsp" />
	
        
    </div> <!--컨테이너 끝 -->

  
		    <script src="/js/custom.js"></script>
		    
		    
	<!--  Semantic UI modal windows pop-up 용  -->
		<div class="ui mini modal" >
		<!-- <div class="center"> -->	
		<div style="border: 1px dashed #BDBDBD; background-color: #FBFCFC;   margin-left: auto;
 		 margin-right: auto; padding: 5px; text-align: center; line-height: 30px; vertical-align:middle;">
		 <div class="header">영화 음성 검색 중....</div>
		  <div class="content" >
		   	<p>
		   		<form id="webspeech"  method="POST">  
		   		   <div class="image content">
		   				 <img class="image">
						       <img src="../images/movie/speechListening2.gif"> 
						         <div class="description">
						            
						            <div class="ui loading search">
									  <div class="ui icon input">
									     <input type="text" class="prompt" name="abc" id="speech-transcript" placeholder="Search...">
									     <i class="search icon"></i>
									  </div>
									  <div class="results"></div>
									</div>
						            
						             
						            <input type="button" value="클릭후 말해주세요 " id="speech-btn" class="positive ui button">  
						            
						            <br/><br/>
						        
						        	<div class="actions">
						        		   <i class='fa fa-check fa-3x' id="voidSearchOk" style="color:#3498DB"></i>  &nbsp;	
     								 
						        	  <div class="ui red deny button">
									              나가기 
							     	 </div>
						           </div>
						             
						         	<div class="form-group">    
							    	<input type="hidden" class="form-control" id="searchCondition" name="searchCondition"  value="1" > 
							        <input type="hidden" class="form-control" id="voiceSearchKeyword" name="searchKeyword" value="" > 
    			
      							 </div>
      							 </div>
						 </div>
		   		</form>
		  </div>
	</div>
</div>
			    
	
</body>
  <!--  ///////////////////////// JavaScript ////////////////////////// -->   
   
    <script type="text/javascript">
			    function fncGetPageList(currentPage) {
			    	
			    	//alert("222")
			        $("#currentPage").val(currentPage)
			        $(".form-search").attr("method","POST").attr("action", "/movie/getMovieList?menu=commingsoon").submit();
			    }
			    
			     //============= "검색"  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "button.btn.btn-default" ).on("click" , function() {
						fncGetPageList(1);
					});
					
				 });
				
				//============= "검색 Icon"  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "#searchIcon").on("click" , function() {
						
						alert("searchbutton called")
						fncGetPageList(1);
					});
					
				 });
				
				
				//============= "Banner Top Clieck "  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( ".banner-top").on("click" , function() {
						
						alert("Banner Top Clieck ")
						self.location = "/index.jsp";
					});
					
				 });
				
				   
					//============= "캘린더로 보기"  Event  처리 =============	
					$(function() {
						 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
						$( "button.btn.btn-calendar" ).on("click" , function() {	
							 self.location = "/movie/getMovieList?menu=calendar";	
						});	
					});
					
					//============= "썸네일로 보기"  Event  처리 =============	
					$(function() {
						 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
						$( "button.btn.btn-thumnail" ).on("click" , function() {	
							 self.location = "/movie/getMovieList?menu=commingsoon";	
						});	
					});
				
				  //============= "음성 검색 실행 함수 " 처리 =============	
				   function fncWebSpeech() {
			    		// document.addPurchase.submit();
			    		// alert("speech post call...")
			    		$("#webspeech").attr("method","POST").attr("action","/movie/getMovieList?menu=movie").submit();
			    	}
			    	
			    	$(function() {
			    			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			    			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			    			 $( "#voidSearchOk" ).on("click" , function() {
			    					//Debug..
			    					// <!-- <a href="javascript:history.go(-1)"></a> -->
			    					//console.log("value : "+$("#voidSearchOk" ).val());
			    					fncWebSpeech()
			    			});
			    	});	
						
				
				
				
				//============= "WishList(찜) Event 처리" DeleteWish Event  처리 =============	
				$(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 
					  $(document).on("click", ".fa-heart-o", function () {

							
							//var movieNo = $(this).next().val();		
							//var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
			
							var movieNo = $(this).find('#scMovieNo').val();		
							var userId = $(this).find('#userId').val();			
							
							alert("movieNo: " + movieNo); 					
							alert("userId: " + userId); 
							
					 	    $(this).removeClass('fa fa-heart-o').addClass('fa fa-heart');
						    
								
							
							if(userId == null || userId == ''){
								alert("로그인 후 이용 가능합니다.");
								return;
							}
							
										
							$.ajax( 
									{
										url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=movie",									
										type : "GET" ,							
									}).done(function(data) {
								//정상 통신인 경우
								if (data == 'add') {
									var msg = '찜하기 신청';
									alert(msg);
								} else {
									alert("찜하기 취소");
								}
							});
						
					})
					 
					 $(document).on("click", ".fa-heart", function () {
							
							
						 //var movieNo = $(this).next().val();		
						 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
		
						var movieNo = $(this).find('#scMovieNo').val();		
						var userId = $(this).find('#userId').val();			
						
						alert("movieNo: " + movieNo); 					
						alert("userId: " + userId); 
						
						
						$(this).removeClass('fa fa-heart').addClass('fa fa-heart-o');
					
						if(userId == null || userId == ''){
							alert("로그인 후 이용 가능합니다.");
							return;
						}
						
									
						$.ajax( 
								{
									url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=movie",									
									type : "GET" ,							
								}).done(function(data) {
							//정상 통신인 경우
							if (data == 'add') {
								var msg = '찜하기 신청';
								alert(msg);
							} else {
								alert("찜하기 취소");
							}
						});
					})
			
			});
				
				 
			//============= "예약  Event 처리"  Event  처리 =============	
			$(function() {
				 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("span:contains('예매')" ).on("click" , function() {
					 self.location = "/booking/getScreenMovieList";	
				});	
			});
				
		    $(function() {
		        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		        $("button[name='search']").on("click", function() {
		        	alert("222")
		      
		            fncGetPageList(1);
		        });
      
		    });

            $(document).ready(function() {
                init_CinemaList();
                
                //alert($('html').height() )
                //alert(window.outerHeight)
                if($('html').height() < window.outerHeight){
                	$('html').css('height', '100%');
                }
                
                $("#movie-search-sort").css("width","200px");
            });
            
            
     	   (function (window, undefined) {
               "use strict";
               
               var document = window.document,
                   docElement = document.documentElement,
                   SpeechRecognition = window.webkitSpeechRecognition ||
                                       window.mozSpeechRecognition ||
                                       window.msSpeechRecognition ||
                                       window.oSpeechRecognition ||
                                       window.SpeechRecognition;
               function addClass(className) {
                   docElement.className = docElement.className + ' ' + className;
               }
               docElement.className = docElement.className.replace(/(^|\s)no-js(\s|$)/, '$1js$2');
               if ( SpeechRecognition !== undefined ) {
                   addClass('feature');
               } else {
                   addClass('no-feature');
               }
           })(window);
   	   
   	   
   	   var speech_text ="";   
   	    
          (function speechFunction(window, undefined) {
              "use strict";
              var speechBtn = document.getElementById('speech-btn'),
                  SpeechRecognition = window.webkitSpeechRecognition ||
                                      window.mozSpeechRecognition ||
                                      window.msSpeechRecognition ||
                                      window.oSpeechRecognition ||
                                      window.SpeechRecognition,
                  speechTranscript = document.getElementById('speech-transcript'),
                  
                 
                  sr;
              if ( SpeechRecognition !== undefined ) {
                  sr = new SpeechRecognition();
                  speechBtn.addEventListener('click', function () {
                      sr.start();
                  });
                  sr.onaudiostart = function () {
                      speechBtn.setAttribute('disabled', 'disabled');
                      speechBtn.value = "말해주세요!";                             
                      
                  };
                  sr.onspeechstart = function () {
                      speechBtn.value = "듣고 있습니다....";
                  };
                  sr.onspeechend = function () {
                      speechBtn.value = '...그리고 끝내주세요...';
                  };
                  sr.onend = function () {
                      speechBtn.value = '계속 하려면 여기를 클릭해주세요!';
                      speechBtn.removeAttribute('disabled');
                  };
                  sr.onresult = function (event) {
                      speechTranscript.value = event.results[0][0].transcript;
                     
                      console.log("speechTranscript :: " + speechTranscript.value);
                      $("#voidSearchOk").val(speechTranscript.value);
                      // alert("speeach2 : "+$("#voidSearchOk").val()); 
                      
                      var voiceSearch = $("#voidSearchOk").val();
                      $("#voiceSearchKeyword").val(voiceSearch);
                      //alert("speeach2"  + voiceSearch);                  
                      
                  };
              }
         })(window);
          
      	//============= "음성 검색 Icon"  Event  처리 =============	
		  $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#voidSearchIcon").on("click" , function() {
				//alert("modal start...")
				$('.ui.modal')  
				  .modal('show')
				;
				/* self.location = "/movie/getMovieList?menu=voiceRegniiton"; */
			});
			
		 }); 
	    	
	            
		</script>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">

   
	 #body {
           padding-top: 70px;
           }
           .thumbnail {
           width: 300px;
           height: 250px;
           overflow: auto;
     }	
     
     .cinema .cinema__images:before {
	    content: '';
	    width: 100%;
	    height: 100%;
	    background-color: rgba(76, 65, 69, 0);
	    position: absolute;
	    top: 0;
	    left: 0;
	    opacity: 1;
	    -webkit-transition: 0.5s;
	    -o-transition: 0.5s;
	    transition: 0.5s;
	   }
     
     
     #searchIcon
      {     color: #fff;       		
   			text-shadow: 1px 1px 1px #ccc;
   			font-size: 1.5em;
      }
      
    #voidSearchIcon
      {     color: #fff;       		
   			text-shadow: 1px 1px 1px #ccc;
   			font-size: 1.5em;
      }
     

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

    html{
     height: auto;
    }
      
</style>


 <!-- Semantic  UI Applied -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
	
</html>
