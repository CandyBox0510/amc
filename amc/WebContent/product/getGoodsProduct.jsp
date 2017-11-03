<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
	<title>Model2 MVC Shop</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
 -->	

	
	<script type="text/javascript">
	
		$(function(){
			
			
			
/* 			$('a.add:contains("확인")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=manage';
			});
			
			$('a.add:contains("추가등록")').bind('click',function(){
				self.location.href = 'addProduct';
			}); */
			
			$('a.btn-default:contains("목록으로")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=${param.menu}'+'&searchKeyword=G';
			});

			$('a.btn-success:contains("구매하러가기")').bind('click',function(){
				
				if("${param.menu=='search' && !empty user}"){
					
					self.location.href = '/purchase/addPurchase?prodNo='+$('input:hidden[name="prodNo"]').val();
										
				}else{
					alert("여기들어옴2");
					/* $('#login').onclick */	
				}
				
			});

		});

	</script>
</head>

<body bgcolor="#ffffff" text="#000000">
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

	
	<div class="container" id="body">
		<div class="col-md-9" role="main">
			<div id="tabs">
			<ul>
					<li>
							<c:if test="${param.menu=='search'}">
								상품상세정보
							</c:if>
							<c:if test="${param.menu=='manage'}">
								수정된 정보
							</c:if>
					</li>
				</ul>
			
			<div class="row" id="tabs-1">
				<input type="hidden" name="prodType" value="${product.prodType}"/>
				<input type="hidden" name="prodNo" value="${product.prodNo}"/>
				<div class="col-xs-5">				
					<c:if test="${!empty product.prodImage}">
						<img src="../images/uploadFiles/${product.prodImage}" class="img-responsive"/>
					</c:if>
					<c:if test="${empty product.prodImage}">
						<img src="../images/uploadFiles/empty<%=index%>.GIF" class="img-responsive"/>
					</c:if>
				</div>
				<div class="col-xs-7">
					<dl class="dl-horizontal">
						<dt>상품명</dt>
						<dd>${product.prodName}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>총 수량</dt>
						<dd>${product.totalStock} 개</dd>						
					</dl>
					<dl class="dl-horizontal">
						<dt>현재 재고수량</dt>
						<dd>${product.stock} 개</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>판매시작일</dt>
						<dd>${product.salesOpenDate}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>판매종료일</dt>
						<dd>${product.salesEndDate}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>가격</dt>
						<dd>${product.prodPrice} 원</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>상품상세정보</dt>
						<dd>${product.prodDetail}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>상품구성정보</dt>
						<dd>${product.prodSetInfo}</dd>
					</dl>
					<div class="btn-group" role="group">
						<a href="#" class="btn btn-success" role="button">구매하러가기</a>
						<%-- <c:if test="${param.menu=='search' && !empty user}">
							<a href="#" class="btn btn-success" role="button">구매하러가기</a>
						</c:if> --%>
						<a href="#" class="btn btn-default" role="button">목록으로</a>
					</div>
					
				</div>
			</div>
		
		
		</div>
		</div>
	
	</div>
	<jsp:include page="/layout/loginModal.jsp" />

</div>
</body>

<style type="text/css">
 	#body{ padding-top: 100px; }
 	.countPage {
	  	font-size: 13px;
	   	margin-top: 10px;
	}
	 
 	.search{
		margin-right : 30px;
	} 
	
 	section{
	margin-bottom : 30px
	}
	
	.movieNm {
		  font-size: 16px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 5px;
		  margin-top: 5px;
		  
	} 
/* 	
 	body {
		padding-top: 80px;
	}  */
	
/* 	html{
        		height: auto;
  		}
	  */
</style>

</html>
