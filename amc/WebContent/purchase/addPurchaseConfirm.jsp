<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
	<title>AMC 결제 완료</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

		<div class="container">	
			<div class="page-header col-sm-offset-2 col-sm-10">
				<h1>주문이 완료되었습니다.</h1>
			</div>
			<dl class="dl-horizontal">
				<dt>상품명</dt>
				<dd>${purchase.purchaseProd.prodName}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>구매 수량</dt>
				<dd>${purchase.orderStock} 개</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>가격</dt>
				<dd>${purchase.totalProdPrice} 원</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>결제 방법</dt>
				<dd>${purchase.paymentOption=='1'? '현금구매':'신용구매'}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>받으실 분</dt>
				<dd>${purchase.receiverName}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>연락처</dt>
				<dd>${purchase.receiverPhone1}&emsp;${purchase.receiverPhone2}&emsp;${purchase.receiverPhone3}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>배송지</dt>
				<dd>${purchase.addrDlvy}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>상세주소</dt>
				<dd>${purchase.addrDlvyDetail}</dd>
			</dl>
			<div class="btn-group" role="group" >
				<a href="#" class="add btn btn-success" role="button">확인</a>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		$(function(){
			$('a.btn-success:contains("확인")').bind('click',function(){
				self.location.href='getPurchaseList?searchKeyword=purchaseList&searchCondition=${sessionScope.user.userId}';
			});
		});
	</script>

</html>