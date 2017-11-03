<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
	<title>Americode Cinema Goods</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
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
			<div class="col-md-9" role="main">
				<ul>	
					<li>
						<c:if test="${param.menu=='search'}">
							��ǰ������
						</c:if>
						<c:if test="${param.menu=='manage'}">
							������ ����
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
								<dt>��ǰ��</dt>
								<dd>${product.prodName}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>�� ����</dt>
								<dd>${product.totalStock} ��</dd>						
							</dl>
							<dl class="dl-horizontal">
								<dt>���� ������</dt>
								<dd>${product.stock} ��</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>�ǸŽ�����</dt>
								<dd>${product.salesOpenDate}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>�Ǹ�������</dt>
								<dd>${product.salesEndDate}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>����</dt>
								<dd>${product.prodPrice} ��</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>��ǰ������</dt>
								<dd>${product.prodDetail}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>��ǰ��������</dt>
								<dd>${product.prodSetInfo}</dd>
							</dl>
							<div class="btn-group" role="group">
								<a href="#" class="btn btn-success" role="button">�����Ϸ�����</a>
							<%-- <c:if test="${param.menu=='search' && !empty user}">
								<a href="#" class="btn btn-success" role="button">�����Ϸ�����</a>
							</c:if> --%>
								<a href="#" class="btn btn-default" role="button">�������</a>
							</div>
						</div>
				</div><!-- ���� ��ǰ���� -->
			</div>
		</div>
		<jsp:include page="/layout/loginModal.jsp"/>
	</div>
</body>

	<script type="text/javascript">
	
		$(function(){
			
/* 			$('a.add:contains("Ȯ��")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=manage';
			});
			
			$('a.add:contains("�߰����")').bind('click',function(){
				self.location.href = 'addProduct';
			}); */
			
			$('a.btn-default:contains("�������")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=${param.menu}'+'&searchKeyword=G';
			});

 			$('a.btn-success:contains("�����Ϸ�����")').bind('click',function(){
 				self.location.href = '/purchase/addPurchase?prodNo='+$('input:hidden[name="prodNo"]').val();
 				
				/* if("${param.menu=='search' && !empty user}"){
					
					self.location.href = '/purchase/addPurchase?prodNo='+$('input:hidden[name="prodNo"]').val();
										
				}else{
					alert("�������2");
						
				} */
				
			});
 
		});

	</script>


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
</style>

</html>
