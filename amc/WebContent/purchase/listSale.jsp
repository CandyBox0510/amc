<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMC 판매목록</title>
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
        <script src="../semantic/semantic.min.js"></script>
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
				<thead> </thead>
				    <tbody>
					<tr>
						<th>No</th>
						<th>상품명</th>
						<th>구매자 ID</th>
						<th>배송 희망일</th>
						<th>현재상태</th>
						<th>배송현황</th>
					</tr>
					</tbody>
			
	      	</table>
		</div>
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
        
  	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
        
	
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
					self.location = '/product/getProduct?prodNo='+$(this).find('input:hidden').val()+'&menu=manage';
				});
			
			$('td:nth-child(3)')
				.bind('click',function(){
					self.location = '/user/getUser?userId='+$(this).text().trim();
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
					
					//alert("var value :: " + i);
					for( x in JSON.list){
						i--;
						var sale = JSON.list[x];
						
						/* alert("sale " + sale.impId);
						alert("prodName " + sale.purchaseProd.prodName);
						alert("userId " + sale.buyer.userId);
						alert("orderRegDate " + sale.orderRegDate);
						alert("tranCode " + sale.tranCode);
						 */
						
						
						
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
						
						//alert("list all" + list);
						
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
				url : '/product/json/getIndexProductList',
				method : 'get',
				dataType : 'json',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				success : function(data){
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
html{
     height: auto;
}
label {
	display: inline-block;
	width: 10em;
}
</style>
</html>