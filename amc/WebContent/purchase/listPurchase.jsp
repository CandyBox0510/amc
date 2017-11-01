<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>


<!DOCTYPE html>

<html>
<head>
	<title>AMC</title>
	<meta charset="EUC-KR">

	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 	<link rel="stylesheet" href="/resources/demos/style.css"> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
		body{
			padding-top : 70px;
		}
		label {
			display: inline-block;
			width: 10em;
		}
	</style>
	
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

</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="../layout/topToolbar.jsp">
		<jsp:param name="uri" value="../"/>
	</jsp:include>

	<div class="container">
	
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
						<div class="modal fade" id="${purchase.impId}" tabindex="-1" role="dialog" aria-labelledby="${purchase.purchaseProd.prodName}" aria-hidden="true">
						</div>
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


</body>
</html>