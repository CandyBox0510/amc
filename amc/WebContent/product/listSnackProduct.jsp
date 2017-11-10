<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> --%>
     <%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="org.springframework.util.StringUtils" %> --%>
<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>스낵 상품 목록</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
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
        <link href="../css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="../css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="../css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="../js/external/modernizr.custom.js"></script>

</head>

<body>
	<div class="wrapper">
    	<!-- Banner -->
        <div class="banner-top">
        	<img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>  
    
	<div class="container" id="body">
		<input type="hidden" name="menu" value="${param.menu}"/>
		<input type="hidden" name="maxPage" value="${resultPage.maxPage}"/>
		<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
		<%-- <input type="text" name="userId" value="${sessionScope.user.role}"/> --%>
		
	   	<!-- Main content -->
        <section class="container">
        	<!-- Search bar -->
        	<div class="col-sm-12">
            	<h2 class="page-heading">${param.menu eq 'search'? "상품 목록조회" : "상품관리" }</h2>
                	<div class="tags-area tags-area--thin">
                    	<div class="container container--add">
                   			<div class="col-sm-6 text-left">
                   				<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
                   			</div>
		                   	
	                   		<c:if test="${param.menu=='manage'}">
		       					<button type="button" class="btn btn-primary pull-right"  
		       						onclick="location.href='/product/addProduct'">상 품 등 록
		       					</button>&emsp;
		       					<button type="button" class="btn btn-primary pull-right"  
		       						onclick="location.href='/product/getSnackList?menu=manage&searchKeyword=S'">스낵 상 품 관 리
		       					</button>&emsp;
		       					<button type="button" class="btn btn-primary pull-right"  
		       						 onclick="location.href='/product/getGoodsList?menu=manage&searchKeyword=G'">굿즈 상 품 관 리
		       					</button>		
		      				</c:if> 
		      				
<%-- 			            	<div class="col-sm-6 text-right">
				            	<form id='search-form' method='get' class="search">
				                	<input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword">
					                	<select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
					                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>
					                    </select>
				                    <button type='button' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
				                    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
				                    <input type="text" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
				                </form>
				            </div>
 --%>				            
				            
			            </div>
			        </div>
		
	              	<div class="tags-area tags-area--thin" style="height : 50px">
	                	<p>Welcome to Snack bar!</p>
	
<!-- 	                    	<div class="tags tags--unmarked tags--aside">
	                    		<span class="tags__label">Sorted by:</span>
	                            	<ul>
	                                	<li class="item-wrap"><a href="#" class="tags__item item-active" data-filter='all'>all</a></li>
	                                	<li class="item-wrap"><a href="#" class="tags__item" data-filter='name'>name</a></li>
	                                	<li class="item-wrap"><a href="#" class="tags__item" data-filter='popularity'>popularity</a></li>
	                            	</ul>
	                    	</div>
 -->	              	</div>
		
					<%-- <input type = "text" value="${list }"> --%>
					<div class="cinema-wrap">
				    	<div class="row">
							<c:set var="i" value="0" />
			                 <c:forEach var="product" items="${list }">
			                 	<c:set var="i" value="${i+1 }" />
				                 
				                	<div class="col-xs-6 col-sm-3 cinema-item">
				                    	<div class="cinema">
				                        	<a href="/product/getSnackProduct?prodNo=${product.prodNo}&menu=${param.menu}" class="cinema__images">
				                            	<img id="poster"alt='' src="../images/uploadFiles/${product.prodImage }" >
				                            	<input type="hidden" id="prodNo" value="${product.prodNo}"/> 
				                            </a>
				                            <a href="/product/getGoodsProduct?prodNo=${product.prodNo}&menu=${param.menu}" class="movieNm">${product.prodName }</a>
				                            <p><strong>가격</strong>  ${product.prodPrice }<br><strong>판매시작일</strong>${product.salesOpenDate}<br><strong>판매마감일</strong>  ${product.salesEndDate }</p>	     
							                    <div class="progress">
								                      <p class="progress__info">현재 판매달성률 ${product.salesStock}%</p>
								                      <div class="progress__bar" role="progressbar" data-level="${product.salesStock}">
								                          <div class="progress__current" style="width: 0%;"></div>
								                      </div>
							                    </div><br/><br/><br/>
				                        </div>
				                    </div>
				                   		        
			                 </c:forEach>
						</div>
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
 			</section>
 		</div>
		
		<div class="clearfix"></div>
	</div>
		 
		 <jsp:include page="/layout/bottomToolbar.jsp" />
		 <jsp:include page="/layout/loginModal.jsp" />

	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="../js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script> 
        <!-- Inview -->
        <!-- <script src="js/external/jquery.inview.js"></script> -->
        <script src="../js/external/jquery.waypoints.min.js"></script>
        <script src="../js/external/inview.min.js"></script>

        <!-- Mobile menu -->
        <script src="../js/jquery.mobile.menu.js"></script>
        <!-- Select -->
        <script src="../js/external/jquery.selectbox-0.2.min.js"></script>

        <!-- Form element -->
        <script src="../js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="../js/form.js"></script>

        <!-- Custom -->
        <script src="../js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() { 
                init_Elements();
            });
		</script>

</body>

<script type="text/javascript">
			   
	function fncGetPageList(currentPage) {
	    $("#currentPage").val(currentPage)		  
	  	alert($("#currentPage").val(currentPage));
	    $("form").attr("method", "POST").attr("action", "/product/getGoodsList?menu=search&searchKeyword=G").submit();
	    $("input[name='searchKeyword']").val(searchKeyword);
	}
	
	
	
	$(document).ready(function() {
	   
	    $("button[name='search']").on("click", function() {
	    	
	    	fncGetPageList(1);
	    });
	    
	    $(".pagination__next").on("click", function() {		
	    	alert("여기들어오니?");
	    	/* searchKeyword = $("input[name='searchKeyword']").val(); */
	   
	        var currentPage = $("#currentPage").val()
	        alert($("#currentPage").val());
	        currentPage = parseInt(currentPage)+1
	        alert(currentPage);
	        fncGetPageList(currentPage);
	    });
	    
	    $(".pagination__prev").on("click", function() {
	    	 var currentPage = $("#currentPage").val()
	         currentPage = parseInt(currentPage)-1
		   	 
	        fncGetPageList(currentPage);
	    });
	});

</script>



<style type="text/css">
 	#body{ padding-top: 100px; }
 	.countPage {
	  	font-size: 13px;
	   	margin-top: 10px;
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

	html{
       	  height: auto;
  	}
	
</style>

</html>