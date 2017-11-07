<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

<head>
   
</head>

<body>
    
   <div class="wrapper">
        <!-- Banner -->
         <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
          <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
		  </header>  
    <div class="container">
        
        <!-- Main content -->
        <!--  <section class="container"> -->
        
                <!-- Search bar -->
 			<div class="col-sm-12">
 			
                <h1 class="page-heading"> 상영 예정 영화 </h1>                
				
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
                		 <c:forEach var="movie" items="${list }">
                		 <c:set var="i" value="${i+1 }" />
                		 
	                            <div class="col-xs-6 col-sm-3 cinema-item">
	                                <div class="cinema">
	                                    <a href='/movie/getMovie?movieNo=${movie.movieNo}&menu=commingsoon' class="cinema__images">
	                                        <img id="poster"alt='' src="${movie.postUrl }" >                                        
	                                    </a>
	                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=commingsoon" class="movieNm">${movie.movieNm }</a>
	                                    <style>P{margin-top:0px;margin-bottom:0px;}</style>
	                                    <p ><strong>개봉일 :${movie.openDt } </strong> </p>
	                                    
	                    	    <div style="text-align: left;">
    						    
    						    </div>								
    							 
    							 <input type='hidden' name='test${movie.movieNo }'  value='${movie.movieNo }'>
     						
							    <span style="line-height:0%">
							    <c:set var="name" value="${movie.wishList.wishNo}"/>
	 								<c:if test="${name eq '0'}">
								<%-- bootstrap icon이 작동이 되질 않음      --%>
								<%-- <i class='glyphicon glyphicon-heart-empty' id="${movie.movieNo}" style="color:#FF5733;
										text-align : center; margin:0 auto;">   --%>	
								<i class='fa fa-heart-o' id="${movie.movieNo}" style="color:#FF5733;text-align : center; margin:0 auto;"> 	 
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
              
              
        
      
    </div>
    	 <div class="clearfix"></div>	
	
	</div>	
	
	   
        
	 
		<jsp:include page="/layout/bottomToolbar.jsp" />
		
		
        <!-- Custom 이게있어야지 스크롤내릴시top버튼있음!!!!!!!!!!! -->
       
		<!-- ------------------------------------  -->
		<script src="/js/custom.js"></script>
</body>
       
    
  <!--  ///////////////////////// JavaScript ////////////////////////// -->   
   
    <script type="text/javascript">
			    function fncGetPageList(currentPage) {
			    	
			    	//alert("222")
			        $("#currentPage").val(currentPage)
			        $(".form-inline").attr("method","POST").attr("action", "/movie/getMovieList?menu=commingsoon").submit();
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
						
						//alert("searchbutton called")
						fncGetPageList(1);
					});
					
				 });
				
				
				//============= "Banner Top Clieck "  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( ".banner-top").on("click" , function() {
						
						//alert("Banner Top Clieck ")
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
				
				

			    
					//============= "음성 검색 Icon"  Event  처리 =============	
				 $(function() {
					 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "#voidSearchIcon").on("click" , function() {
						self.location = "/movie/getMovieList?menu=voiceRegniiton";
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
								
								// alert("movieNo: " + movieNo); 					
								// alert("userId: " + userId);  
								
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
	            
		</script>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">

	 body {
           padding-top: 70px;
           }
           .thumbnail {
           width: 300px;
           height: 250px;
           overflow: auto;
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

</html>
