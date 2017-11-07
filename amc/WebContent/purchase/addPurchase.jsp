<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMC ����ȭ��</title>
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
	
		<!--������Ʈ CDN -->
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

		<div class="container" id="body">
			<div class="page-header col-sm-offset-2 col-sm-10">
				<h1>��ǰ ����</h1>
			</div>
			<form class="add-product form-horizontal">
				<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo }" />
				<input type="hidden" name="purchaseProd.prodName" value="${product.prodName }"/>
				<input type="hidden" name="buyer.userId" value="${user.userId }"/>
				<input type="hidden" name="tranCode" value="1"/>
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<input type="hidden" name="prodType" value="${product.prodType}"/>
							<div class="col-xs-4">
								<c:if test="${!empty product.prodImage}">
									<img src="../images/uploadFiles/${product.prodImage}" class="img-responsive"/>
								</c:if>
								<c:if test="${empty product.prodImage}">
									<img src="../images/uploadFiles/empty<%=index%>.GIF" class="img-responsive"/>
								</c:if>
							</div>
							
							<div class="col-xs-8">
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
									<dt>������</dt>
									<dd>${product.prodDetail}</dd>
								</dl>
								<dl class="dl-horizontal">
									<dt>��ǰ��������</dt>
									<dd>${product.prodSetInfo}</dd>
								</dl>
							</div>
						</div>
					</div>
		
					<div class="col-md-6">
						<div class="form-group">
							<div class="row">
								<label for="inputPaymentOption" class="col-sm-3 control-label">�������</label>
								<div class="col-sm-3">
									<select class="form-control" id="inputPaymentOption" name="paymentOption">
										<option value="1">īī������</option>								
									</select>
								</div>
								<span class="col-sm-6"></span>
							</div>
							<br/>
							
							<div class="row">
								<label for="inputPurchaseCount" class="col-sm-3 control-label">���ż���</label>
								<div class="col-sm-3">
									<select class="form-control" id="inputPurchaseCount" name="orderStock" onchange="calc(this.form.prodPrice, this.form.orderStock, this.form.totalProdPrice)">
										<c:forEach var="i" begin="1" end="${product.stock>10? 10 : product.stock}">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>							
								</div>
								<span class="col-sm-6"></span>
							</div>
							<br/>
							
							<div class="row">
								<label for="inputReceiverName" class="col-sm-3 control-label">�޴»��</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="inputReceiverName" name="receiverName" value="${user.userName}">
								</div>
								<span class="col-sm-6"></span>
							</div>
							<br/>
							
							<div class="form-group">
								<label for="phone" class=" col-sm-3 control-label">�޴� �� ����ó</label>
							    <div class="col-sm-2">
							    	<select class="form-control" name="receiverPhone1" id="receiverPhone1" value="${user.phone1}">
										<option value="010" >010</option>
										<option value="011" >011</option>
										<option value="016" >016</option>
										<option value="018" >018</option>
										<option value="019" >019</option>
									</select>
							     </div>
						   
							     <div class="col-sm-2">
							     	<input type="text" class="form-control" id="receiverPhone2" name="receiverPhone2" placeholder="��ȣ" value="${user.phone2}">
							     </div>
							    
							     <div class="col-sm-2">
							     	<input type="text" class="form-control" id="receiverPhone3" name="receiverPhone3" placeholder="��ȣ" value="${user.phone3}">
							     </div>	
						    	 <span class="col-sm-6"></span>			    	
						 	 </div>
							
							 <div class="row">
							 	<label for="inputDlvyAddr" class="col-sm-3 control-label">�����</label>
							 	<div class="col-sm-3">
									<input type="text" class="form-control" id="inputDlvyAddr" name="addrDlvy" value="${user.addr}" >
								</div>
								<span class="col-sm-6"></span>
							 </div>
							 <br/>
							
							 <div class="row">
							 	<label for="inputDlvyAddr" class="col-sm-3 control-label">���ּ�</label>
							 	<div class="col-sm-3">
							 		<input type="text" class="form-control" id="inputDlvyAddr" name="addrDlvyDetail" value="${user.addrDetail}" >
							 	</div>
							 	<span class="col-sm-6"></span>
							 </div>
							 <br/>
							
							 <div class="row">
							 	<label for="inputDlvyAddr" class="col-sm-3 control-label">�� ���� ����</label>
							 	<div class="col-sm-3">
							 		<input type="text" class="form-control" id="inputtotalProdPrice" name="totalProdPrice" value="${product.prodPrice}" readonly>
							 		<input type=hidden name="prodPrice" value="${product.prodPrice}"> 
							 	</div>
							 	<span class="col-sm-6"></span>
							 </div>
							 <br/>
							 
							 <div class="row">
							 	<div class="add-purchase col-sm-offset-3 col-sm-9">
									<button type="button" class="btn btn-success">
										����
									</button>
									<button type="button" class="btn btn-info">
										���
									</button>
								</div>
							 </div>
						 </div>
					 </div>
				 </div>
			 </form>
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

</body>

	<script type="text/javascript">
	//imp�ʱ�ȭ�� ������ ù�ܿ� ���ִ°� ����
 	IMP.init('imp41659269');
	var things = "AMC : ";
	if( "${booking}"=="" ){
		things += "��ǰ"
	}else{
		things += "����"
	} 
	
	function kakaoPay(){
				IMP.request_pay({
				    pg : 'kakao',
				    pay_method : 'kapy',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : things,
				    amount : "${product.prodPrice}", /* ticket or product price */
				    buyer_email : "${user.userId}",
				    buyer_name : "${user.userName}",
				    buyer_tel : "${user.phone1}-${user.phone2}-${user.phone3}",
				    buyer_addr : "${user.addr}+${user.addrDetail}"
				}, function(rsp) {
				    if ( rsp.success ){
						
				    	alert("impuid : " + rsp.imp_uid); //�����Ǽ� ����� ��
				    	console.log("impuid : "+rsp.imp_uid);
				    	var impUid = rsp.imp_uid; 
				    	
				    	$.ajax({
				    		url: "/cinema/json/checkPay/"+impUid, //cross-domain error�� �߻����� �ʵ��� ������ ���������� ����
				    		type: 'GET',
				    	}).done(function(data) {
				    		alert("data : " + data);
				    		var payStatusCheck = (data.split(','))[0];
				    		var amountCheck = (data.split(','))[1];
				    		alert("payStatusCheck : "+payStatusCheck+"\n"+"amountCheck : "+amountCheck);
				    		
				    		//[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
				    		if (  payStatusCheck == 'paid' && amountCheck == '${product.prodPrice}') {
				    			var msg = '������ �Ϸ�Ǿ����ϴ�.';
				    			msg += '\n����ID : ' + rsp.imp_uid;
				    			msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
				    			msg += '\n���� �ݾ� : ' + rsp.paid_amount;
				    			msg += '\nī�� ���ι�ȣ : ' + rsp.apply_num;

				    			$("input[name='qrUrl']").val("https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl="+impUid);
				    			$("input[name='impId']").val(impUid);
				    			
				    			alert("AJAX �� �����Ϸ� �� "+"\n"+msg);
				    			
				    			addPurchase();
				    			
				    		} else {
				    			alert("AJAX �� ����\n ���� �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó�� �Ͽ����ϴ�");
				    			kakaoPayCancel(impUid);
				    			//[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
				    			//[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
				    		}
				    	});
				    	
				    } else {
				        var msg = '������ �����Ͽ����ϴ�.';
				        var errorMsg = '���л��� : ' + rsp.error_msg;
				        alert("AJAX �� ����"+"\n"+msg+"\n"+errorMsg);
				    }//end of rsp.success else 
				}); //end of Imp.request_pay
			}//end of kakaoPay function
			
	function kakaoPayCancel(impUid){
		$.ajax({
		    		url: "/cinema/json/cancelPay/"+impUid,
		    		type: 'GET',
		    	}).done(function(data) {
		    		alert("data : " + data);
		    		//[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
		    		if ( data == 'cancelled' ) {
		    			var msg = '��Ұ� ���������� ó���Ǿ����ϴ�.';
		    			/* msg += '\n����ID : ' + rsp.imp_uid;
		    			msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
		    			msg += '\n���� �ݾ� : ' + rsp.paid_amount;
		    			msg += '\nī�� ���ι�ȣ : ' + rsp.apply_num; */

		    			alert("���۽� ��� �� "+"\n"+msg);
		    			
		    			//location.href="/index.jsp"
		    			location.href="/#"
		    			
		    		} else {
		    			alert("��Ұ� �����Ͽ����ϴ�.");
		    			//[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
		    			//[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
		    		}
		    	});
	}//end of kakaoPayCancel function		
	
	function a(){
		$("input[name='qrUrl']").val("https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=123");
		alert($("input[name='qrUrl']").val());
	}

	function addPurchase(){
		
		$('form').attr('method','post').attr('action','addPurchase').submit();
		
	}

	
		$(function(){
			
/* 			$('.add-purchase .btn-success:contains("����")').bind('click',function(){
				kakaoPay();
			}); */
			
		 	$('.add-purchase .btn-success:contains("����")').bind('click',function(){
				/* $('form').attr('method','post').attr('action','addPurchase').submit(); */
				kakaoPay();
			}); 
			
			$('.add-purchase .btn-info:contains("���")').bind('click',function(){
				history.go(-1);
			});
			
			$('#inputDlvyDate').datepicker({
				dateFormat : 'yymmdd'
			})

		});
		
		
		/* count */
		function calc(item, count, sum){ 

		      if(count.value=="")    var count = 0; 
		      else                   var count = count.value; 

		      sum.value = eval(item.value) * eval(count) ; 
		  
		  } 

	</script>
	<style type="text/css">
	 	#body{ padding-top: 100px; }

 		html{
	        height: auto;
	  	} 
		 
	</style>
	
</html>