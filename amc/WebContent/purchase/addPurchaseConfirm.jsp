<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
	<title>AMC ���� �Ϸ�</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
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
				<h1>�ֹ��� �Ϸ�Ǿ����ϴ�.</h1>
			</div>
			<dl class="dl-horizontal">
				<dt>��ǰ��</dt>
				<dd>${purchase.purchaseProd.prodName}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>���� ����</dt>
				<dd>${purchase.orderStock} ��</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>����</dt>
				<dd>${purchase.totalProdPrice} ��</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>���� ���</dt>
				<dd>${purchase.paymentOption=='1'? '���ݱ���':'�ſ뱸��'}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>������ ��</dt>
				<dd>${purchase.receiverName}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>����ó</dt>
				<dd>${purchase.receiverPhone1}&emsp;${purchase.receiverPhone2}&emsp;${purchase.receiverPhone3}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>�����</dt>
				<dd>${purchase.addrDlvy}</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>���ּ�</dt>
				<dd>${purchase.addrDlvyDetail}</dd>
			</dl>
			<div class="btn-group" role="group" >
				<a href="#" class="add btn btn-success" role="button">Ȯ��</a>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		$(function(){
			$('a.btn-success:contains("Ȯ��")').bind('click',function(){
				self.location.href='getPurchaseList?searchKeyword=purchaseList&searchCondition=${sessionScope.user.userId}';
			});
		});
	</script>

</html>