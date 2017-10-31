<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>

<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.amc.service.domain.User"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%--   <%
	User user = new User();
	user.setUserId("testAdmin");
	user.setRole("admin");
	session.setAttribute("user", user);
%> 
 --%> 
<html lang="ko">
	
<head>

   <meta charset="EUC-KR">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- 여기가 다른 jsp 페이지에 있는 cdn 끝/////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  
    
	
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       <!-- 절대경로로 변경  -->
		<a class="navbar-brand" href="/index.jsp">
			<img src="/images/common/AMC_Logo.png" width="80px" height="30px"/>
		</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!-- 영화 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>영화</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">현재 상영영화</a></li>
	                         <li><a href="#">상영 예정영화</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">시사회</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- 예매 DrowDown  -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span>예매</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">영화 예매</a></li>
		                         <li><a href="#">시사회 예매</a></li>
		                     </ul>
		                </li>
		                
	              <!-- 영화관  -->
					  <li><a href="#">영화관</a></li>
				
				  <!-- 커뮤니티  -->  
					  <li><a href="#">커뮤니티</a></li>
		                
	              <!-- 스토어 DrowDown  -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span>스토어</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">굿즈</a></li>
		                         <li><a href="#">스낵바</a></li>
		                     </ul>
		                </li>
	                 
	             <!-- 관리자메뉴 DrowDown  -->
	             
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >[관리자 메뉴]</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">회원관리</a></li>
		                         <li><a href="#">상품관리</a></li>
		                         <li><a href="#">판매관리</a></li>
		                         <li><a href="#">영화관리</a></li>
		                         <li><a href="#">상영관리</a></li>
		                         <li><a href="#">예매관리</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	             </ul>
	             
	             
	             
	             <ul class="nav navbar-nav navbar-right">
	             <!-- 유저가 로그인 상태일 시 -->
<%-- 	             	<c:if test="${sessionScope.user ne null }">
		             	<li title="Click : 개인정보 수정"><a href="#">ID : [${sessionScope.user.userId }]</a></li>
		             	<li><a href="#">로그아웃</a></li>
		             	<li><a href="#">마이페이지</a></li>
	             	</c:if>
 --%>	             	
	             <!-- 유저가 비로그인 상태일 시 -->	
<%-- 	             	<c:if test="${sessionScope.user eq null }">
		             	<li>
		             		<input type="text" name="userId" placeholder="아이디" width="300px">
		             		<input type="text" name="password" placeholder="비밀번호" width="300px">
		             	</li>
		             	<input type="button" value="로그인">
	             	</c:if>
 --%>	            </ul>
	           	 <!-- 유저가 비로그인 상태일 시 -->	
	 			<c:if test="${empty user}">		
	 				<li>			
						<form class="navbar-form navbar-right">
						<!-- <a data-toggle="modal" href="../user/loginUser" data-target="#modal-testNew" role="button" data-backdrop="static"> -->
						<a data-toggle="modal" href="/user/loginUser" data-target="#modal-testNew" role="button" data-backdrop="static">
							<button type="button" class="btn btn-primary">Log in</button>
						</a >
							<a href="/user/authForm.jsp"><button type="button" class="btn btn-primary">Sign in</button></a>
						</form>
					</li>	
				</c:if>	
				
				<c:if test="${!empty user}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" class="user-info">${sessionScope.user.userName}</a>
						<li><a href="#">마이페이지</a></li>
						<li><a href="#">로그아웃</a></li>
					</ul>
				</c:if> 
				<form>
					<input type="text" name="searchKeyword" placeholder="통합검색">
					<input type="button" value="검색!" onClick="javascript:unifiedSearch()">
				</form>          
		</div>
		<!-- dropdown hover END -->	       
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
   	
	   	function openHistory(){
	   		popWin = window.open("../openHistory.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	   	}
	   	
	   	function unifiedSearch(){
	   		//POST로 바꿔야함
	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").submit();
	   		/* $(self.location).attr("href","/cinema/unifiedSearch"); */
	   	}
   	
		
		//============= 영화 Event  처리 =============	
		/*  $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('영화')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/movie/getMovieList"
			}); 
		 }); */
		
		//=============  현재 상영영화 Event  처리 =============	
	 	$( "a:contains('현재 상영영화'),a:contains('ID')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/movie/getMovieList?menu=movie");
		});
		
		
	 	//=============  상영 예정영화 Event  처리 =============	
	 	$( "a:contains('상영 예정영화')" ).on("click" , function() {
			$(self.location).attr("href","/movie/getMovieList?menu=commingsoon");
		});
	 	
	 	//=============  시사회 Event  처리 =============	
	 	$( "a:contains('시사회')" ).on("click" , function() {
			$(self.location).attr("href","/movie/getMovieList?menu=preview");
		});
	 	
	 	//=============  예매 Event  처리 =============	
	 	$( "a:contains('예매')" ).on("click" , function() {
			$(self.location).attr("href","/booking/getScreenMovieList");
		});
	 	
	 	//=============  영화 예매 Event  처리 =============	
	 	$( "a:contains('영화 예매')" ).on("click" , function() {
			$(self.location).attr("href","/booking/getScreenMovieList");
		});
	 	
	 	//=============  시사회 예매 Event  처리 =============	
	 	$( "a:contains('시사회 예매')" ).on("click" , function() {
			$(self.location).attr("href","/booking/getScreenPreviewList");
		});
		
	 	//=============  영화관 Event  처리 =============	
	 	$( "a:contains('영화관')" ).on("click" , function() {
			$(self.location).attr("href","/cinema/theaterInfo");
		});
	 	
	 	//=============  커뮤니티 Event 처리 =============	
	 	$( "a:contains('커뮤니티')" ).on("click" , function() {
			$(self.location).attr("href","/community/getFreeBoardList");
		});
	 	
	 	//============= 스토어 Event 처리 =============	
	 	$( "a:contains('스토어')" ).on("click" , function() {
			$(self.location).attr("href","/product/getGoodsList?menu=search");
		});
	 	
	 	//=============  굿즈 Event 처리 =============	
	 	$( "a:contains('굿즈')" ).on("click" , function() {
			$(self.location).attr("href","/product/getGoodsList?menu=search");
		});
	 	
	 	//=============  스낵바 Event 처리 =============	
	 	$( "a:contains('스낵바')" ).on("click" , function() {
			$(self.location).attr("href","/product/getSnackList?menu=search");
		});
	 	
	 	//=============  회원관리 Event  처리 =============	
	 	$( "a:contains('회원관리')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUserList");
		});
	 	
	 	//=============  상품관리 Event  처리 =============	
	 	$( "a:contains('상품관리')" ).on("click" , function() {
			$(self.location).attr("href","/product/getGoodsList?menu=manage");
		});
	 	
	 	//=============  판매관리 Event  처리 =============	
	 	$( "a:contains('판매관리')" ).on("click" , function() {
			$(self.location).attr("href","/purchase/getSaleList");
		});
	 	
	 	//=============  영화관리 Event  처리 =============	
	 	$( "a:contains('영화관리')" ).on("click" , function() {
			$(self.location).attr("href","/movie/getMovieList?menu=manage");
		});
	 	
	 	//=============  상영관리 Event  처리 =============	
	 	$( "a:contains('상영관리')" ).on("click" , function() {
			$(self.location).attr("href","/screen/getScreenList");
		});
	 	
	 	//=============  예매관리 Event  처리 =============	
	 	$( "a:contains('예매관리')" ).on("click" , function() {ss
			$(self.location).attr("href","/booking/getAdminBookingList");
		});
	 	
	 	
/* 	 	//============= login Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("input:contains('로그인')").on("click" , function() {
				$(self.location).attr("href","/user/loginUser");
			}); 
		 });
 */	 	
	 	//============= logout Event  처리 =============	
/*		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logoutUser");
			}); 
		 });
 */	 	
 
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('로그아웃')").on("click" , function() {
			alert("카카오로그아웃");
			logoutWithKakao();
			
		}); 
	});
 
		function logoutWithKakao() {
			Kakao.init('fc5658887af25f840e94144f6722b228');
			Kakao.Auth.logout(function(){
				setTimeout(function(){
					location.href="/user/logoutUser/"
				},300);
				});
		}

		//=============  최근 본 상품  처리 =============	
		 	$( "a:contains('최근 본 상품')" ).on("click" , function() {
		 		openHistory();
			});
	 	
	</script>  
 	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 	  body {
            padding-top: 70px;
            }
            .thumbnail {
            width: 150px;
            height: 200px;
            overflow: auto;
      }	
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "#updateMoviebtn" ).on("click" , function() {
			 	//alert("수정 버튼 클릭 확인");
				//Debug..
				// <!-- <a href="javascript:history.go(-1)"></a> -->
				fncUpdateMovie()
		});
	});	



	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "#deleteMoviebtn" ).on("click" , function() {
				//Debug..
				// <!-- <a href="javascript:history.go(-1)"></a> -->
				fncDeleteMovie()
			 	
		});
	});	
	
	
	function fncUpdateMovie() {
		// document.fncAddProduct.submit();
		
		var movieNm=$("input[name='movieNm']").val();
		
		var directors=$("input[name='directors']").val();	
		var actors=$("input[name='actors']").val();
		var genres=$("input[name='genres']").val();
		var watchGradeNm=$("input[name='watchGradeNm']").val();
		var openDt=$("input[name='openDt']").val();
		var showTm=$("input[name='showTm']").val();
		var endDt=$("input[name='endDt']").val();
		var synopsis=$("input[name='synopsis']").val();
		var trailer=$("input[name='trailer']").val();	
		
		//alert(directors+actors+genres+watchGradeNm)
	
		
	
		if(directors == null || directors.length<1){
			alert("감독명은 반드시 입력하여야 합니다.");
			return;
		}
		if(actors == null || actors.length<1){
			alert("배우명은 반드시 입력하여야 합니다.");
			return;
		}
		if(genres == null || genres.length<1){
			alert("장르명은 반드시 입력하셔야 합니다.");
			return;
		}
		if(watchGradeNm == null || watchGradeNm.length<1){
			alert("관람등급은 반드시 입력하셔야 합니다.");
			return;
		}
		if(openDt == null || openDt.length<1){
			alert("개봉날짜는  반드시 입력하셔야 합니다.");
			return;
		}
		if(showTm == null || showTm.length<1){
			alert("러닝타임은  반드시 입력하셔야 합니다.");
			return;
		}
		if(endDt == null || endDt.length<1){
			alert("상영마감은  반드시 입력하셔야 합니다.");
			return;
		}
	
	
		$("form").attr("method","POST").attr("action","/movie/updateMovie").submit();
	}	
	
	
	 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	function fncDeleteMovie() {		
		 
		var movieNo=$("input[name='movieNo']").val();
		alert("movieNo" + movieNo );
		 
		$("form").attr("method","POST").attr("action","/movie/deleteMovie?movieNo="+movieNo).submit();
	}	
	 
	 </script>
	
</head>
<body>

<form id="updateMovie" enctype="multipart/form-data" method="POST">  
<input type="hidden" name="movieNo" value="${movie.movieNo}"/>


	<!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/topToolbar.jsp" />  --%>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->

<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">${movie.movieNm}</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>감독</strong></div>
			<input type="text" name="directors" value="${movie.directors}" disabled  			
				   class="ct_input_g" 	     style="width: 160px; 
				   height: 20px" 		     maxLength="30"/>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배우</strong></div>
			<input type="text" name="actors" 	
				   value="${movie.actors}"
				   disabled
				   class="ct_input_g" 
				   style="width: 160px;      height: 20px" maxLength="30"/>
	
		</div>
		
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>장르</strong></div>
			<input type="text" name="genres" 	
				   class="ct_input_g"    value="${movie.genres}"
				   disabled
				   style="width: 160px;  height: 20px" maxLength="30" />
	
		</div>
		
		<div class="row">
  		<div class="col-xs-4 col-md-2 "><strong>관람등급</strong></div>
		<input type="text" name="watchGradeNm" 	
			   class="ct_input_g"    value="${movie.watchGradeNm}"
			   style="width: 160px;  height: 20px" maxLength="30" />
	
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>개봉날짜 </strong></div>
			<input 	type="date" name="openDt" class="ct_input_g" 
							value="${movie.openDt}" 	
							style="width: 160px; height: 20px" maxLength="30"/>					
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>러닝타임</strong></div>
			<input type="text" name="showTm" 	
				   class="ct_input_g"    value="${movie.showTm}" 
				   style="width: 160px;  height: 20px" maxLength="30" /> &nbsp;분
		
		</div>


		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상영마감 </strong></div>
			<input 	type="date" name="endDt" class="ct_input_g" 
							value="${movie.endDt}" 	
							style="width: 160px; height: 20px" maxLength="30"/>		
		</div>		
	
					
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>포스터</strong></div>
	  		<img src="${movie.postUrl}" width="160px" height="180px" align="left"/>
	  		
		</div>
		
		<hr/>
		
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>줄거리</strong></div>	  	
	    <textarea name="synopsis" cols="90" rows="8" >${movie.synopsis} </textarea> 	
	    </div>
		
		<hr/>
	
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>스틸컷</strong></div>
	  		<!-- <a class='thumbnail' style="text-decoration:none;"> -->
	  		<!-- <img src="file:C:/amcPoster/${movie.steelCut1}" width="160px" height="180px" align="left"/>  -->
	  		<img src="../images/movie/${movie.steelCut1}" width="220px" height="180px" align="left"/>
	  		<img src="../images/movie/${movie.steelCut2}" width="220px" height="180px" align="left"/>
	  		<img src="../images/movie/${movie.steelCut3}" width="220px" height="180px" align="left"/>
	  		</a>
	  	</div>
	 
	  	
	    <hr/>
	    
		<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file1" name="file" required="required" /></div>
		<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>
		<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>   
				
		<hr/>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>트레일러 URL</strong></div>	  	
	    <textarea name="trailer" cols="90" rows="2" >${movie.trailer} </textarea> 	

		<hr/>
		<div class="row">
	  		<div class="col-md-2 text-left ">
	  			<button type="button" id="updateMoviebtn"  class="btn btn-primary">수정</button>
	  		</div>
	  		<div class="col-md-2 text-left ">
	  			<button type="button" id="deleteMoviebtn"   class="btn btn-primary">삭제</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 </div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</form>
</body>
</html>

