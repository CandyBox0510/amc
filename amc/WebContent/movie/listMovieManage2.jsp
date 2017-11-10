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
			        $("#currentPage").val(currentPage)
			        
			        $("form").attr("method", "POST").attr("action", "/movie/getMovieList?menu=manage").submit(); 
			    }
			    
			    $('.boxshadow').css("box-shadow","0 0 0px rgba(0, 0, 0, 0)")
			    $(function() {
			        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			        $("button[name='search']").on("click", function() {
			            fncGetPageList(1);
			        });
	      
			    });

			    $(".pagination__next").on("click", function() {
		            searchKeyword = $("input[name='searchKeyword']").val();

		            var currentPage = $("#currentPage").val()
		 
		            currentPage = parseInt(currentPage) + 1
		          
		            fncGetPageList(currentPage);
		        });

		        $(".pagination__prev").on("click", function() {
		            var currentPage = $("#currentPage").val()
		      
		            currentPage = parseInt(currentPage) - 1
		            
		            fncGetPageList(currentPage);

		        
		        });
 
			    
	            $(document).ready(function() {
	                init_CinemaList();
	              /*   
	                if($('html').height() < window.outerHeight){
	                	$('html').css('height', '100%');
	                } */
	                
	                $("#movie-search-sort").css("width","200px");
	            });
	            
	            
	        //============= "영화등록"  Event  처리 =============	
	   		 $(function() {
	   			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	   			$( "button.btn.btn-register" ).on("click" , function() {
	   				 self.location = "/movie/addMovie.jsp";
	   			});
	   			
	   		 });
	            
	            
		</script>
		

    
</head>

<body>

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
        <section class="container">
        
                <!-- Search bar -->
 			<div class="col-sm-12">
 			
                <h2 class="page-heading"> 영화관리</h2>                
					 &nbsp; &nbsp; &nbsp; &nbsp; <button type="button" class="btn btn-register">영화등록</button>
                	<div class="tags-area tags-area--thin">
			             <div class="container container--add">
			                <div class="col-sm-6 text-left">
			            		 <p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
			            	</div>
			            	<div class="col-sm-6 text-right">
				                <form id='search-form' method='get' class="search">
				                    <input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword">
				                    <select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
				                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>영화제목</option>
				                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>감독명</option>
				                    </select>
				                    <button type='submit' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
				                    <input type="hidden" id="currentPage" name="currentPage" value="0" />
				                </form>
				             </div>
			             </div>
			        </div>
			        
        
      <!--           <div class="tags-area tags-area--thin" style="height : 50px">
   
                    <div class="tags tags--unmarked tags--aside">
                        <span class="tags__label">Sorted by:</span>
                            <ul>
                                <li class="item-wrap"><a href="#" class="tags__item item-active" data-filter='all'>all</a></li>
                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='name'>name</a></li>
                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='popularity'>popularity</a></li>
                            </ul>
                    </div>
                </div> -->
                
                <div class="cinema-wrap">
	            	<div class="row">
				 		<c:set var="i" value="0" />
                		 <c:forEach var="movie" items="${list }">
                		 <c:set var="i" value="${i+1 }" />
	                 
	                            <div class="col-xs-6 col-sm-3 cinema-item">
	                                <div class="cinema">
	                                    <a href='/movie/getMovie?movieNo=${movie.movieNo}&menu=manage' class="cinema__images">
	                                        <img id="poster"alt='' src="${movie.postUrl }" >                                        
	                                    </a>
	                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=manage" class="movieNm">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${movie.movieNm }</a>
	                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>개봉일</strong>&nbsp;${movie.openDt }<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>장르 </strong>${movie.genres }<br>
	                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>감독 </strong> ${movie.director }
	                                    <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>등록일 </strong>${movie.movieRegDate } 
	                                    </p>	     
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
          
            
        </section>

        <div class="clearfix"></div>
        
             
        <div class="bottom low ">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/bottomToolbar.jsp" />
			<jsp:include page="/layout/loginModal.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
  		</div>

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

	<!--  ///////////////////////// CSS ////////////////////////// -->

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
		
		.page-heading {
			margin-top: 100px
		}
		
		body {
			padding-top: 80px;
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

	
      html{
 	     height: auto;
      }
      
</style>	

</html>
