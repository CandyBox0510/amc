<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>


<!DOCTYPE html>

<html>
<head>
	<title>AMC</title>
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
			<div class="page-header text-info">
		       <h3>구매이력조회</h3>
		    </div>
		    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
		    <div class="row">
				<div class="col-md-6 text-left">
			    	<p class="text-primary">
			    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
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
			<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			
		    <!--  table Start /////////////////////////////////////-->
			<table class="table table-hover table-striped" >
				<thead>
					<tr>
						<th align="center">No</th>
						<th align="left" >구매물품</th>
						<th align="left">배송지</th>
						<th align="left">전화번호</th>
						<th align="left">배송현황</th>
						<th align="left">정보수정</th>
					</tr>
				</thead>
	       
				<tbody>
					<c:set var="i" value="${resultPage.totalCount- (resultPage.currentPage-1)*resultPage.pageSize + 1}" />
					<c:forEach var="purchase" items="${list}">
						<c:set var="i" value="${ i-1 }" />
						<tr>
							<td>${ i }</td>
							<td>
								<button type="button" class="btn btn-link" name="${purchase.impId}" >${purchase.purchaseProd.prodName}&nbsp;&nbsp;(수량 : ${purchase.orderStock})</button>
								<div class="modal fade" id="${purchase.impId}" tabindex="-1" role="dialog" aria-labelledby="${purchase.purchaseProd.prodName}" aria-hidden="true"></div>
							</td>
							<td>${purchase.addrDlvy} ${purchase.addrDlvyDetail}</td>
							<td>${purchase.receiverPhone1} ${purchase.receiverPhone2} ${purchase.receiverPhone3}</td>
							<td>
								<c:choose>
									<c:when test="${purchase.tranCode=='1'}">
										구매완료
									</c:when>
									<c:when test="${purchase.tranCode=='2'}">
										배송중
									</c:when>
									<c:when test="${purchase.tranCode=='3'}">
										배송완료
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:if test="${purchase.tranCode=='2'}">
									<input type="hidden" name="impId" value="${purchase.impId}"/>
									<a href="#" class="btn btn-link text-success" >물건도착</a>
								</c:if>
							</td>
						</tr>
			        </c:forEach>
		        </tbody>
	      	</table>
		 	<!--  table End /////////////////////////////////////-->
	 	</div>
	 	<!--  화면구성 div End /////////////////////////////////////-->
	 	
	 	<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator.jsp"/>
		<!-- PageNavigation End... -->
	</div>

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
 			
 			$('td:nth-child(6) a:contains("물건도착")').bind('click',function(){
 				var anchor = $(this);
 				if(confirm("정말 도착하였습니까? (수정불가)")){
	 				$.ajax({
	 					url : 'json/updateTranCode/'+$(this).parent().find('input:hidden').val()+'/3',
	 					method : 'get',
	 					success : function(data){
	 						$(anchor.parent().parent().find('td')[4]).text("배송완료");
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
	</style>
</html>