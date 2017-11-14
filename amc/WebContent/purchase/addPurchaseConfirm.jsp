<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMC �����Ϸ�</title>
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
	
		<!-- ��� �������� ������ �κ� �ΰǰ� -->
		<div class="ui thin info modal"> 
		  <i class="close icon"></i>
		    <div class="content" >
		    </div>
		</div>  

<div class="modal-header"  align="right">
	<button type="button" class="close" data-dismiss="modal" >
 		<i class="close icon"></i>
 	</button>
</div>

<div class="modal-body">
		<div class="container" id="body">	
			<div class="page-header col-sm-offset-2 col-sm-10">
				<h1>�ֹ��� �Ϸ�Ǿ����ϴ�.</h1>
			</div>
		<div align="center">	
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
			<div class="btn-group" role="group" algin="right">
				<a href="#" class="add btn btn-success" role="button">Ȯ��</a>
			</div>
			</div>
		</div>
	</div>
</div>

<div class="modal-footer"  align="right">
<br/><br/><br/>
</div>
	
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

        <!-- Custom -->
        <script src="/js/custom.js"></script>
	
</body>
	<script type="text/javascript">
		$(function(){
			$('a.btn-success:contains("Ȯ��")').bind('click',function(){
				self.location.href='getPurchaseList?searchKeyword=purchaseList&searchCondition=${sessionScope.user.userId}';
			});
		});
	</script>
	<style type="text/css">
	 	#body{ padding-top: 100px; }
		html{
	        height: auto;
	  	} 
		 
	</style>
		

</html>