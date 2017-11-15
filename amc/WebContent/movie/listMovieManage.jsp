<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<!-- Header section -->
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>

		<div class="container">

			<!-- Main content -->
			<section class="container">

				<!-- Search bar -->
				<div class="col-sm-12">

					<h2 class="page-heading">영화관리</h2>
					 &nbsp; &nbsp; &nbsp; &nbsp; <button type="button" class="btn btn-register">영화등록</button>
					<div class="tags-area tags-area--thin">
						<div class="container container--add">
							<div class="col-sm-6 text-left">
								<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
							</div>
							<div class="col-sm-6 text-right">
								<form id='search-form' class="search ">
										<input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
										<select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
											<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>영화제목</option>
										<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>감독명</option>
									</select>
									<button type='submit' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
									<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
								</form>
							</div>
						</div>
					</div>



					<div class="cinema-wrap">
						<div class="row">
							<c:set var="i" value="0" />
							<c:forEach var="movie" items="${list }">
								<c:set var="i" value="${i+1 }" />

								<div class="col-xs-6 col-sm-3 cinema-item">
									<div class="cinema">
										<a href='/movie/getMovie?movieNo=${movie.movieNo}&menu=manage' class="cinema__images"> 
											<img id="poster" alt='' src="${movie.postUrl }"> 
										</a> 
										<a href="/movie/getMovieList/${movie.movieNo}" class="movieNm">${movie.movieNm }</a>
										<p><strong>개봉일</strong>${movie.openDt }<br><strong>장르 </strong>${movie.genres }<br> 
										   <strong>감독</strong> ${movie.director }<br><strong>등록일 </strong>${movie.movieRegDate } 
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

		</div>


		<div>
			<jsp:include page="/layout/bottomToolbar.jsp" />
			<jsp:include page="/layout/loginModal.jsp" />
		</div>
	</div>


	<!-- Custom 이게있어야지 스크롤내릴시top버튼있음!!!!!!!!!!! -->
	<script src="/js/custom.js"></script>
	<!-- ------------------------------------  -->


<script type="text/javascript">

function fncGetPageList(currentPage) {

	
	
    $("#currentPage").val(currentPage)  
    $("#search-form").attr("method", "POST").attr("action", "/movie/getMovieList?menu=manage").submit();
    $("input[name='searchKeyword']").val(searchKeyword);
}


    $('.boxshadow').css("box-shadow","0 0 0px rgba(0, 0, 0, 0)")
    $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("button[name='search']").on("click", function() {
            fncGetPageList(1);
        });

        $(".pagination__next").on("click", function() {
        	
        	//alert("next")
        	
            searchKeyword = $("input[name='searchKeyword']").val();

            var currentPage = $("#currentPage").val()
 
            currentPage = parseInt(currentPage) + 1
            
            // alert("currentPage :: " + currentPage)
          
            fncGetPageList(currentPage);
        });

        $(".pagination__prev").on("click", function() {
            var currentPage = $("#currentPage").val()
      
            //alert("prev")
            currentPage = parseInt(currentPage) - 1
            
            fncGetPageList(currentPage);

          
        });
        
        //============= "영화등록"  Event  처리 =============	
  		$(function() {
  			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
  			$( "button.btn.btn-register" ).on("click" , function() {
  				 self.location = "/movie/addMovie.jsp";
  			});
  			
  		});
           

        

    });

    $(document).ready(function() {
        init_CinemaList();
        
        if($('html').height() < window.outerHeight){
        	$('html').css('height', '100%');
        }
        
        
        $("#movie-search-sort").css("width", "200px");
    });
</script>


</body>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.countPage {
	font-size: 13px;
	margin-top: 10px;
}

.search {
	margin-right: 30px;
}


.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 100px
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.movieNm {
	font-size: 16px;
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	margin-top: 5px;
}

#poster {
	height: calc(50vh - 100px);
	width: auto;
	height: 260px;
	margin-left: auto;
	margin-right: auto;
	display: table;
}
.page-heading {
	margin-top: 100px
}

.cinema .cinema__images:before {
	    content: '';
	    width: 100%;
	    height: 100%;
	    background-color: rgba(76, 65, 69, 0); 
	    /*   background-color: rgba(255, 255, 255, 0.5); */

	    position: absolute;
	    top: 0;
	    left: 0;
	    opacity: 3;
	    -webkit-transition: 0.5s;
	    -o-transition: 0.5s;
	    transition: 0.5s;
	   }
	   
html{
 	     height: auto;
      }
      

</style>

</html>
