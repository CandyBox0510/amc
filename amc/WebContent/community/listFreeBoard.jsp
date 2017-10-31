<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page contentType="text/html; charset=EUC-KR" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
                <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">


    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 

		  <!-- Swiper slider -->
        <link href="/css/external/idangerous.swiper.css" rel="stylesheet" />
        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />
        
        <!-- 우리가 가지고 있던 javaScript (현재 별문제 안됨)-->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

		
         <script src="/js/external/modernizr.custom.js"></script> 
        <script type="text/javascript">
            $(document).ready(function() {
                init_MovieList();
            });
		</script>
    
    
</head>

<body> 
    <div class="wrapper">

        
        <jsp:include page="/layout/topToolbar.jsp" />
        
        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading"> 자유게시판</h2>
                	<div class="tags-area tags-area--thin">
			             <div class="container container--add">
			                <div class="col-sm-6 text-left">
			            		 <p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
			            	</div>
			            	<div class="col-sm-6 text-right">
				                <form id='search-form' method='get' class="search">
				                    <input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword">
				                    <select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
				                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
				                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
				                        <option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>작성자</option>	                     
				                    </select>
				                    <button type='submit' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
				                </form>
				             </div>
			             </div>
			        </div>
              
                <!-- Movie preview item -->
                <div class="movie movie--preview movie--full release">
                     <div class="col-sm-3 col-md-2 col-lg-2">
                            <div class="movie__images">
                                <img alt='' src="images/movie/movie-sample1.jpg">
                            </div>
                            <div class="movie__feature">
                                <a href="#" class="movie__feature-item movie__feature--comment">123</a>
                                <a href="#" class="movie__feature-item movie__feature--video">7</a>
                                <a href="#" class="movie__feature-item movie__feature--photo">352</a>
                            </div>
                    </div>

                    <div class="col-sm-9 col-md-10 col-lg-10 movie__about">
                            <a href='movie-page-full.html' class="movie__title link--huge">Last Vegas (2013)</a>

                            <p class="movie__time">105 min</p>

                            <p class="movie__option"><strong>Country: </strong><a href="#">USA</a></p>
                            <p class="movie__option"><strong>Category: </strong><a href="#">Comady</a></p>
                            <p class="movie__option"><strong>Release date: </strong>November 1, 2013</p>
                            <p class="movie__option"><strong>Director: </strong><a href="#">Jon Turteltaub</a></p>
                            <p class="movie__option"><strong>Actors: </strong><a href="#">Robert De Niro</a>, <a href="#">Michael Douglas</a>, <a href="#">Morgan Freeman</a>, <a href="#">Kevin Kline</a>, <a href="#">Mary Steenburgen</a>, <a href="#">Jerry Ferrara</a>, <a href="#">Romany Malco</a> <a href="#">...</a></p>
                            <p class="movie__option"><strong>Age restriction: </strong><a href="#">13</a></p>

                    </div>

                    <div class="clearfix"></div>
                    
                <div class="coloum-wrapper">
                    <div class="pagination paginatioon--full">
                            <a href='#' class="pagination__prev">prev</a>
                            <a href='#' class="pagination__next">next</a>
                    </div>
                </div>

            </div>
            </div>

        </section>
        
        <div class="clearfix"></div>
        
          <div>
      							<c:set var="i" value="0" />
                                <c:forEach var="freeBoard" items="${list }">
                                    <c:set var="i" value="${i+1 }" />
                                    

                                    ${ freeBoard.freeBoardNo}
                                    ${ freeBoard.freeBoardTitle}
                                    ${ freeBoard.freeBoardRegDate}
                                    ${ freeBoard.freeBoardContent}
                                    ${ freeBoard.freeBoardViews}
                                    ${ freeBoard.freeBoardImage}
                                    ${ freeBoard.user.userId}
                                    
                                    
                                    </c:forEach>
                </div>
                
                

        
    </div>

    

	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
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

        <!-- Stars rate -->
        <script src="/js/external/jquery.raty.js"></script>

        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>
		
		
</body>
</html>