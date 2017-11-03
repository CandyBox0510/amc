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
</head>

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
    	<!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
	
		<div class="container" id="body">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">등록상품보기</a></li>
				</ul>
				
				<div class="row" id="tabs-1">
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
							<dt>수량</dt>
							<dd>${product.totalStock} 개</dd>
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
							<dt>상세정보</dt>
							<dd>${product.prodDetail}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>구성정보</dt>
							<dd>${product.prodSetInfo}</dd>
						</dl>
						<div class="btn-group" role="group">
							<a href="#" class="add btn btn-success" role="button">확인</a>
							<a href="#" class="add btn btn-primary" role="button">추가등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

	<script type="text/javascript">
	
		$(function(){
			
			$('#tabs').tabs();
			
			$('a.add:contains("확인")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=manage';
			});
			
			$('a.add:contains("추가등록")').bind('click',function(){
				self.location.href = 'addProduct';
			});
		});

	</script>
	
	<style type="text/css">
	 	#body{ padding-top: 100px; }
	</style>
	
</html>
