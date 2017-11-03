<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<title>AMC 판매 목록</title>
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
			<div class="row">
				<h1 class="page-header">인기품목</h1>
				<div class="row">
					<div class="col-xs-12 col-sm-3 popular">
						<h4><span class="badge"></span></h4>
						<img src="../images/user/ajax_loader4.gif" class="img-responsive img-circle" style="width:200px; height:200px;">
					</div>
					<div class="col-xs-12 col-sm-3 popular">
						<h4><span class="badge"></span></h4>
						<img src="../images/user/ajax_loader4.gif" class="img-responsive img-circle" style="width:150px; height:150px;">
					</div>
					<div class="col-xs-12 col-sm-3 popular">
						<h4><span class="badge"></span></h4>
						<img src="../images/user/ajax_loader4.gif" class="img-responsive img-circle" style="width:100px; height:100px;">
					</div>
					<div class="col-xs-12 col-sm-3 popular">
						<h4><span class="badge"></span></h4>
						<img src="../images/user/ajax_loader4.gif" class="img-responsive img-circle" style="width:80px; height:80px;">
					</div>
				</div>
			</div>
			<hr/>
			
			<div class="text-info">
				<h3>판매목록조회</h3>
		    </div>
	
			<input type="hidden" name="maxPage" value="${resultPage.maxPage}"/>
			
			<table class="table table-hover table-striped" >
				<thead>
					<tr>
						<th>No</th>
						<th>상품명</th>
						<th>구매자 ID</th>
						<th>배송 희망일</th>
						<th>현재상태</th>
						<th>배송현황</th>
					</tr>
				</thead>
	      	</table>
		</div>
	</div>
</body>
	<script type="text/javascript">
		var currentPage = 0,
			searchKeyword = 'saleList';
		
		function init(){

			$('td:nth-child(1)')
				.bind('click',function(){
					self.location = 'getPurchase?impId='+$(this).find('input:hidden').val();
				});
			
			$('td:nth-child(2)')
				.bind('click',function(){
					self.location = '../product/getProduct?prodNo='+$(this).find('input:hidden').val()+'&menu=manage';
				});
			
			$('td:nth-child(3)')
				.bind('click',function(){
					self.location = '../user/getUser?userId='+$(this).text().trim();
				});
			
			$('td:nth-child(6):contains("배송하기")')
				.bind('click',function(){
					self.location = 'updateTranCode?impId='+$(this).find('input:hidden').val()+'&tranCode=2&menu=manage';
				});
		}
		
		function fncNextList(){
			currentPage++;
			$.ajax({
				url : 'json/listPurchase',
				method : 'post',
				async : false,
				dataType : 'json',
				data : JSON.stringify({
					currentPage : currentPage,
					searchKeyword : searchKeyword
				}),
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				success : function(JSON){
					var i = JSON.resultPage.totalCount - (JSON.resultPage.currentPage-1)*JSON.resultPage.pageSize + 1;
					for( x in JSON.list){
						i--;
						var sale = JSON.list[x];
						var list = '<tr>';
						list += '<td><input type="hidden" name="impId" value="'+sale.impId+'">'+i+'</td>';
						list += '<td><input type="hidden" name="prodNo" value="'+sale.purchaseProd.prodNo+'">'+sale.purchaseProd.prodName+' (수량 : '+sale.orderStock+')</td>';
						list += '<td>'+sale.buyer.userId+'</td>';
						list += '<td>'+sale.orderRegDate+'</td>';
						list += '<td>'
						if(sale.tranCode == '1'){
							list += '구매완료';
						}else if(sale.tranCode == '2'){
							list += '배송중';
						}else if(sale.tranCode == '3'){
							list += '배송완료';
						}
						list += '</td>';
						list += '<td>';
						if(sale.tranCode == '1'){
							list += '<input type="hidden" name="impId" value="'+sale.impId+'">배송하기';
						}
						list += '</td>';
						list += '</tr>';
						
						$('tbody').html($('tbody').html() + list);
					}
					init();
				}
			});
		}
		
		$(function(){
			init();
			while($(document).height() == $(window).height() && currentPage < $('input:hidden[name="maxPage"]').val()){
				fncNextList();
			}
		});

		$(function(){
			
			$.ajax({
				url : '../product/json/getIndexProductList',
				method : 'get',
				dataType : 'json',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				success : function(data){
					alert("여긴드어옴?");
					var i;
					for(i=0; i<4 ; i++){
						$($('.popular')[i]).find('img').attr('src','../images/uploadFiles/'+(data.HP[i].prodImage!=null ? data.HP[i].prodImage : 'empty'+Math.floor(3*Math.random())+'.GIF'));
						$($('.popular')[i]).find('span').text(data.HP[i].stock);
						$($('.popular')[i]).find('h4').append(data.HP[i].prodName);
					}
				}
			});
		});
		$(window).scroll(function(event){
			if(currentPage < $('input:hidden[name="maxPage"]').val()){
				if(pageYOffset == ($(document).height()-$(window).height())){
					window.scrollTo(0,$(document).height()-$(window).height()-1);
					fncNextList();
				}
			}
		});
		
	</script>
	<style>
		#body{ padding-top: 100px; }
	</style>
</html>