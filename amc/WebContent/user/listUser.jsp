<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="EUC-KR">
        <title>회원 목록조회</title>
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
</head>

<body>
	<div class="wrapper">
    	<c:set var="who" value=""/>
    	<c:if test="${sessionScope.user.role ne 'admin'}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user.role eq 'admin'}">
    		<c:set var="who" value="admin"/>	
    	</c:if>
		<!-- Banner -->
		<div class="banner-top">
    		<img alt='top banner' src="../images/banners/space.jpg">
		</div> 
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>
		<div class="container" >
            <div class="clearfix"></div>
 			<section class="container">
            <div class="col-md-12">
                <h2 class="page-heading"> 회원 목록 조회</h2>
                	<div class="col-md-12 tags-area tags-area--thin">
			             <div class="col-md-12 container container--add">
			                <div class="col-sm-6 text-left">
			    				<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
			    			</div>
							<div class="search-wrapper">   						
				            	<div class="col-sm-6 text-right">
					                <form id='search-form' class="search ">
					                    <input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword"
					                		    value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						                    <select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
						                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
						                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
						                        <option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>작성자</option>	                     
						                    </select>
						                    <button type='button' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
						                    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
					                </form>
					             </div>				            
							</div>		
			             </div>
			        </div>
						
	      	<table class="table table-hover table-striped " >
	        	<thead class="listTitle">
	          		<tr class="listTitle">
		            	<th align="center">No</th>
		            	<th align="left" >회원 ID</th>
			            <th align="left">회원명</th>
			            <th align="left">주소</th>
			            <th align="left">계정구분</th>
		            <!-- <th align="left">간략정보</th> -->
		          	</tr>
        		</thead>
        		

        		
        		
				<tbody>
			  		<c:set var="i" value="0" />
				  	<c:forEach var="user" items="${list}">
						<c:set var="i" value="${ i+1 }" />
							<tr>
							  <td align="center">${ i }</td>
							  <td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
							  <td align="left">${user.userName}</td>
							  <td align="left">${user.addr}</td>
							  <td align="left">${user.role}</td> 
							  <td align="left"></td>
					  	<%-- <i class="glyphicon glyphicon-ok" id= "${user.userId}"></i> --%>
						<%-- <input type="hidden" value="${user.userId}"> --%>
							</tr>
	          		</c:forEach>
	        
	        	</tbody>
	      	</table>
	 	</div>
	</section>
	</div>
        <div class="clearfix"></div>
        
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
</div>
   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
        <script>window.jQuery || document.write('<script src="/js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

		<script src="/js/external/modernizr.custom.js"></script> 

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>


        <!-- Custom -->
        <script src="/js/custom.js"></script>
	
</body>

<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/getUserList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					/* var userId = $(this).next().val(); */
					var userId = $(this).next().val().trim();
					var tempId = userId.split(".");
					console.log("tempId :: " + tempId);
					$.ajax( 
							{
								url : "/user/json/getUser/"+tempId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
 																+"주소 : "+JSONData.addr+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue); 
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	<style type="text/css">
	 	#body{ padding-top: 100px; }
	 	
	 	.listTitle {
			font-size: 10px;
			font-weight: bold;
			height: 40px;
			vertical-align: middle;
			padding-top: 5px;
			color: #FFFFFF;
			background-color: #4C4145;
		}
		
html{
  height: auto;
}
			
    
section{
	margin-bottom : 30px
}
.page-heading{
	margin-top : 100px
}

.search .search__field {
  display: inline-block;
  width: 400px;
  padding: 9px 30px 9px 19px;
  margin-top: 14px;
  line-height: 18px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  border: solid 1px #dbdee1;
  background-color: #fff;
  color: #4c4145;
  font-size: 13px;
}
.search .search__sort {
  opacity: 0;
}
.search .search__button {
  position: absolute;
  top: 14px;
  right: 0;
  z-index: 3;
}
.search .sbHolder {
  display: inline-block;
  position: absolute;
  top: 15px;
  right: 100px;
  width: 100px;
  height: 35px;
  border: none;
  border-left: 1px solid #dbdee1;
  background-color: #fff;
}

.search .sbHolder .sbSelector {
	display: block;
	height: 30px;
	left: 0;
	line-height: 30px;
	outline: none;
	overflow: hidden;
	position: absolute;
	text-indent: 10px;
	top: 0;
	width: 100px;
	
  margin-top: 4px;
  margin-right: 150px;
  color: #4c4145;
  font-size: 13px;
}
.search .sbHolder .sbOptions {
  width: 140px;
  top: 37px !important;
  border: none;
  padding: 14px 7px;
  z-index: 23;
  background-color: #4c4145;
  -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.16);
  -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.16);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.16);
}

.search .sbHolder .sbToggle {
  top: 10px;
  right: 50px;
}
.search .sbHolder .sbToggle:before {
  content: "\f078";
  color: #4c4145;
  font-family: "FontAwesome";
  font-size: 12px;
  position: absolute;
  top: 0px;
  left: 0px;
}
.search .sbHolder .sbToggleOpen:before {
  content: "\f077";
}
.sbHolder {
  outline: none;
}


.search-wrapper {
  background-color: #ffffff;
  height: 50px;
}
    	  #writeButton {
			font-size: 13px;
			 text-align : center;
  			margin-top: 10px;
  			margin-bottom: 10px;
  		margin-right: 20px;
  			color : #4C4145;
  			padding : 10px 10px 10px 10px;
			}
    .countPage {
		  font-size: 13px;
		   margin-top: 10px;
		}
		.search{
			margin-right : 30px;
		}
		
		.freeBoardField{

			font-size : 15px;
			font-weight: bold;
			height:40px;	
			vertical-align : middle;
			padding-top : 10px;
			color:#FFFFFF;
			background-color : #4C4145;
		}
		.freeBoardRecord{
			font-size : 13px;
			height:50px;
		
			vertical-align : middle;
			padding-top : 5px;
			color:#4C4145;
		}


	.freeBoardRecord>td{
   	border-bottom : 1px solid #969b9f;
   	padding : 15px;
	}
 
.title {
  font-size: 13px;
  font-weight: bold;
}
.title:hover {
  color: #fe505a;
}
/* 	input, select {
		margin-bottom: 10px;
		height: 100%;
		width: 100%;
		border: none;
		box-shadow: none;
		border: 1px solid #dbdee1;
		-webkit-border-radius: 3px;
		-moz-border-radius: 3px;
		border-radius: 3px;
		font-size: 13px;
		color: #000000;
		padding: 9px 18px 10px !important;
	} */
		
	</style>
	

</html>