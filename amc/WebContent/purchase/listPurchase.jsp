<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>


<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMC ���Ÿ��</title>
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
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
        <!-- Swiper slider -->
        <link href="/css/external/idangerous.swiper.css" rel="stylesheet" />
    
        <!-- Custom -->
        <!-- <link href="/css/style.css?v=1" rel="stylesheet" /> -->

        <!-- Modernizr --> 
        <!-- <script src="/js/external/modernizr.custom.js"></script> -->
    
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
        <!--   Sweetalert2 CDN  -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
   
        <!--   semantic UI  -->
        <link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
        <script
        src="https://code.jquery.com/jquery-3.1.1.min.js"
        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
        crossorigin="anonymous"></script>
        <script src="../semantic/semantic.min.js"></script></head>

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
			<div class="page-header text-info">
		       <h3>�����̷���ȸ</h3>
		    </div>
		    <!-- table ���� �˻� Start /////////////////////////////////////-->
		    <div class="row">
				<div class="col-md-6 text-left">
			    	<p class="text-primary">
			    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
			    	</p>
			    </div>
			    <div class="col-md-6 text-right">
			    	<form>
			    		<input type="hidden" id="searchCondition" name="searchCondition" value="${sessionScope.user.userId}">
			    		<input type="hidden" id="searchKeyword" name="searchKeyword" value="purchaseList">
			    		<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
			    	</form>
			    </div>
			</div>
			<!-- table ���� �˻� Start /////////////////////////////////////-->
			
		    <!--  table Start /////////////////////////////////////-->
			<table class="table table-hover table-striped" >
				<thead>
					<tr>
						<th align="center">No</th>
						<th align="left" >���Ź�ǰ</th>
						<th align="left">�����</th>
						<th align="left">��ȭ��ȣ</th>
						<th align="left">�����Ȳ</th>
						<th align="left">��������</th>
					</tr>
				</thead>
	       
				<tbody>
					<c:set var="i" value="${resultPage.totalCount- (resultPage.currentPage-1)*resultPage.pageSize + 1}" />
					<c:forEach var="purchase" items="${list}">
						<c:set var="i" value="${ i-1 }" />
						<tr>
							<td>${ i }</td>
							<td>
								<button type="button" class="btn btn-link" name="${purchase.impId}" >${purchase.purchaseProd.prodName}&nbsp;&nbsp;(���� : ${purchase.orderStock})</button>
								<div class="modal fade" id="${purchase.impId}" tabindex="-1" role="dialog" aria-labelledby="${purchase.purchaseProd.prodName}" aria-hidden="true"></div>
							</td>
							<td>${purchase.addrDlvy} ${purchase.addrDlvyDetail}</td>
							<td>${purchase.receiverPhone1} ${purchase.receiverPhone2} ${purchase.receiverPhone3}</td>
							<td>
								<c:choose>
									<c:when test="${purchase.tranCode=='1'}">
										���ſϷ�
									</c:when>
									<c:when test="${purchase.tranCode=='2'}">
										�����
									</c:when>
									<c:when test="${purchase.tranCode=='3'}">
										��ۿϷ�
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:if test="${purchase.tranCode=='2'}">
									<input type="hidden" name="impId" value="${purchase.impId}"/>
									<a href="#" class="btn btn-link text-success" >���ǵ���</a>
								</c:if>
							</td>
						</tr>
			        </c:forEach>
		        </tbody>
	      	</table>
		 	<!--  table End /////////////////////////////////////-->
	 	</div>
	 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	 	
	 	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator.jsp"/>
		<!-- PageNavigation End... -->
	</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/js/external/jquery-3.1.1.min.js"><\/script>')</script>
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
        <!-- Swiper slider -->
        <script src="/js/external/idangerous.swiper.min.js"></script>

        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>

</body>
	<script type="text/javascript">
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "getPurchaseList").submit();
		}

		
		$(function(){
			
 			$('button.btn.btn-link').bind('click',function(){
				$('#'+$(this).attr('name')).modal({
					backdrop : false,
					keyboard : false
				}).bind('hide.bs.modal',function(){
					location.reload();
				}).load('getPurchase?impId='+$(this).attr('name'));
				
 			});
 			
 			$('td:nth-child(6) a:contains("���ǵ���")').bind('click',function(){
 				var anchor = $(this);
 				if(confirm("���� �����Ͽ����ϱ�? (�����Ұ�)")){
	 				$.ajax({
	 					url : 'json/updateTranCode/'+$(this).parent().find('input:hidden').val()+'/3',
	 					method : 'get',
	 					success : function(data){
	 						$(anchor.parent().parent().find('td')[4]).text("��ۿϷ�");
	 						anchor.remove();
	 					}
	 				})
 				}
 			});
 		
		});
		
	</script>
<style>
#body{ padding-top: 100px; }
label {
	display: inline-block;
	width: 10em;
}
html{
	height: auto;
}
</style>
</html>