<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page contentType="text/html; charset=EUC-KR" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

<head> 

    
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />
        
        <!--  얘네 쓰면 글씨크기 이상해짐(원래 우리가 가지고있던 css) -->
       <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
		<!--  -----------------------------------------------------------------------  -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
		
		<!-- 우리가 가지고 있던 javaScript (현재 별문제 안됨)-->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        
        
        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>
        
        <!--  ///////////////////////// CSS ////////////////////////// -->
		<style>
		 body {
	            padding-top: 70px;
	            }
	            .thumbnail {
	            width: 300px;
	            height: 250px;
	            overflow: auto;
	      }	
	      
	      #searchIcon
	       {    color: #fff;       		
	    		text-shadow: 1px 1px 1px #ccc;
	    		font-size: 1.5em;
	       }
	       
	     #voidSearchIcon
	       {    color: #fff;       		
	    		text-shadow: 1px 1px 1px #ccc;
	    		font-size: 1.5em;
	       }
	      
	    </style>
        
    
  <!--  ///////////////////////// JavaScript ////////////////////////// -->   
   
    <script type="text/javascript">
			    function fncGetPageList(currentPage) {
			    	
			    	alert("222")
			        $("#currentPage").val(currentPage)
			        $("form").attr("method","POST").attr("action", "/movie/getMovieList?menu=commingsoon").submit();
			    }
			    
			     //============= "검색"  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "button.btn.btn-default" ).on("click" , function() {
						fncGetPageList(1);
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
			     
				
				//============= "검색 Icon"  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "#searchIcon").on("click" , function() {
						
						alert("searchbutton called")
						fncGetPageList(1);
					});
					
				 });
			    
					//============= "음성 검색 Icon"  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "#voidSearchIcon").on("click" , function() {
						self.location = "/movie/getMovieList?menu=voiceRegniiton";
					});
					
				 });
				
				//============= "WishList(찜) Event 처리" AddWish Event  처리 =============	
					$(function() {
						 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 
						// $("span:contains('찜하기')" ).on("click" , function() {
					/* 	$(".glyphicon.glyphicon-heart-empty").on("click" , function() {	
							
							 //var movieNo = $(this).next().val();		
							 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
			
							var movieNo = $(this).find('#scMovieNo').val();		
							var userId = $(this).find('#userId').val();			
							
							alert("movieNo: " + movieNo); 					
							alert("userId: " + userId); 
							
							//$(this).toggleClass('glyphicon glyphicon-heart-empty').toggleClass(".glyphicon glyphicon-heart");
						
							
							//$(this).switchClass('glyphicon glyphicon-heart-empty','glyphicon glyphicon-heart');
						    $(this).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');
						    
						    //$(this).replaceClass('.glyphicon glyphicon-heart-empty','.glyphicon glyphicon-heart');
							
						    //$(this).addClass('glyphicon glyphicon-heart');
							
							
							 if (userId != null && userId.length !=0) {
								alert("userId: " + userId);
							} else {
								alert('로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?');
								location.href="/user/loginUser.jsp";
							} 
							
							
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
						});	 */
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
								
								//$(this).toggleClass('glyphicon glyphicon-heart-empty').toggleClass(".glyphicon glyphicon-heart");
							
								
								//$(this).switchClass('glyphicon glyphicon-heart-empty','glyphicon glyphicon-heart');
							    $(this).removeClass('fa fa-heart-o').addClass('fa fa-heart');
							    
							    //$(this).replaceClass('.glyphicon glyphicon-heart-empty','.glyphicon glyphicon-heart');
								
							    //$(this).addClass('glyphicon glyphicon-heart');
								
								
								/* if (userId != null && userId.length !=0) {
									alert("userId: " + userId);
								} else {
									alert('로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?');
									location.href="/user/loginUser.jsp";
								} */
								
								
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
	                $("#movie-search-sort").css("width","200px");
	            });
	            
		</script>
		
		<style type="text/css">

		
	
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
		
		body {
			padding-top: 80px;
		}

		
		</style>
    
</head>

<body>
<jsp:include page="/layout/topToolbar.jsp" />
    <div class="container">
        

        
        <!-- Main content -->
        <section class="container">
        
                <!-- Search bar -->
 			<div class="col-sm-12">
 			
                <h2 class="page-heading"> 상영 예정 영화<</h2>                
				
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
				  
				  <hr/>   
	  
				  <div class="widget" align="center">	
					  <button type="button" class="btn btn-thumnail">썸네일로 보기</button>
					  <button type="button" class="btn btn-calendar">캘린더로 보기</button>
					 
					  <!-- <input type="submit" value="캘린더로">   -->
					
				  </div>
              
             
                <div class="cinema-wrap">
	            	<div class="row">
				 		<c:set var="i" value="0" />
                		 <c:forEach var="movie" items="${list }">
                		 <c:set var="i" value="${i+1 }" />
                		 
	                            <div class="col-xs-6 col-sm-3 cinema-item">
	                                <div class="cinema">
	                                    <a href='/movie/getMovie?movieNo=${movie.movieNo}&menu=search' class="cinema__images">
	                                        <img id="poster"alt='' src="${movie.postUrl }" >                                        
	                                    </a>
	                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=search" class="movieNm">${movie.movieNm }</a>
	                                    <style>P{margin-top:0px;margin-bottom:0px;}</style>
	                                    <p ><strong>개봉일 :${movie.openDt } </strong> </p>
	                                    
	                    	    <div style="text-align: left;">
    						    
    						    </div>								
    							 
    							 <input type='hidden' name='test${movie.movieNo }'  value='${movie.movieNo }'>
     						
							    <span style="line-height:0%">
							    <c:set var="name" value="${movie.wishList.wishNo}"/>
	 								<c:if test="${name eq '0'}">
									     <i class='fa fa-heart-o' id="${movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;"> 
									     	<input type='hidden' id='scMovieNo' 	 value="${movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	
									     </i> 						
								    </c:if>	
								    
								    <c:if test="${name ne '0'}">
									    <i class='fa fa-heart' id="${movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;">
									    	<input type='hidden' id='scMovieNo' 	 value="${movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	 
									    </i> 						
									</c:if>	
							   </span>                                                   

	                             &nbsp;&nbsp;

	                            <span style="line-height:0%">
	                             
	                            <input type='hidden' name='screenMovieNo'  value='"+val.movieNo+"'>	                                                  
	                            <i class='fa fa-phone' id='reserve-ticket' style="color:#FB1D04; text-align : center; margin:0 auto;">예매 </i>   
	                            </span>
	                         
	                                    
	                                    	     
	                                </div>
	                            </div>                      
	                    		
                		 </c:forEach>
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
    

    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                   

            </section>
        </div>



		<!--  Select Mobile menu  둘다있어야지 search가능함!!! 하단에 있어야지 생김 (이유모름)-->
        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
		
		
        <!-- Custom 이게있어야지 스크롤내릴시top버튼있음!!!!!!!!!!! -->
        <script src="/js/custom.js"></script>
		<!-- ------------------------------------  -->
		
		
		

</body>
</html>
