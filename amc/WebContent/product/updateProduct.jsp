<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema UpdateProduct</title>
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
			<div class="page-header col-sm-offset-2 col-sm-10">
				<h1>��ǰ ���� ����</h1>
			</div>
			<form class="update-product form-horizontal">
				<div class="form-group">
					<input type="hidden" name="prodNo" value="${product.prodNo }"/>
					
					<div class="row">
						<label for="prodType" class="col-sm-3 control-label">��ǰ ����</label>
				 		<div class="col-sm-3">			  		
				  	  		<input type='radio' name='prodType' value='G' checked="checked">����&emsp;&emsp;&emsp;&emsp;
							<input type='radio' name='prodType' value='S'>������
				  		</div>
				  	</div>
					<br/>
					
					<div class="row">
						<label for="inputProdName" class="col-sm-3 control-label">��ǰ��</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="inputProdName" name="prodName" value="${product.prodName}" placeholder="��ǰ��">
						</div>
						<span class="col-sm-6"></span>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputProdDetail" class="col-sm-3 control-label">��ǰ������</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="inputProdDetail" name="prodDetail" value="${product.prodDetail}" placeholder="��ǰ������">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputProdSetInfo" class="col-sm-3 control-label">��ǰ��������</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="inputProdSetInfo" name="prodSetInfo" value="${product.prodSetInfo}" placeholder="��ǰ��������">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputStock" class="col-sm-3 control-label">�߰�����</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="inputStock" name="stock" >
						</div>
						<span class="col-sm-6">(���� ���� : ${product.stock})</span>
					</div>
					<br/>
					
					<div class="row">
						<label for="salesOpenDate" class="col-sm-3 control-label">�ǸŽ�����</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="salesOpenDate" name="salesOpenDate" value="${product.salesOpenDate}">
						</div>
						<label for="salesEndDate" class="col-sm-3 control-label">�Ǹ�������</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="salesEndDate" name="salesEndDate" value="${product.salesEndDate}">
						</div>
						<span class="col-sm-6"></span>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputPrice" class="col-sm-3 control-label">����</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="inputPrice" name="prodPrice" value="${product.prodPrice}">
						</div>
						<span class="col-sm-6"></span>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputFile" class="col-sm-3 control-label">��ǰ�̹���</label>
						<div class="col-sm-6">
							<input type="file" class="form-control" id="inputFile" name="file">
						</div>
						<span class="col-sm-3"></span>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputCurrent" class="col-sm-3 control-label">���� �̹���</label>
						<div class="col-sm-6">
							<c:if test="${!empty product.prodImage}">
								<img src="../images/uploadFiles/${product.prodImage}" style="height: 200px; width: 100%;"/>
							</c:if>
							<c:if test="${empty product.prodImage}">
								��ϵ� ������ �����ϴ�.
							</c:if>
						</div>
						<span class="col-sm-3"></span>
					</div>
					<br/>
					
					<div class="row">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="button" id="update" class="btn btn-success">
								�����ϱ�
							</button>
							<button type="button" id="delete" class="btn btn-success">
								�����ϱ�
							</button>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
											<h4 class="modal-title" id="myModalLabel">��ǰ ���� ���� ���Դϴ�..</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div><!-- //container �� -->
	</div><!-- //wrapper �� -->
		
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
		function fncUpdateProduct(){
			//Form ��ȿ�� ����
/* ��ǰ���� */			var Type = $('input[name="prodType"]').val();
/* ��ǰ��*/			var name = $('input[name="prodName"]').val(); 
/* ��ǰ������ */		var detail = $('input[name="prodDetail"]').val();
/* ��ǰ�������� */		var SetInfo = $('input[name="prodSetInfo"]').val();
/* �߰����� */			var stock = $('input[name="stock"]').val();
/* �ǸŽ����� */		var OpenDate = $('input[name="salesOpenDate"]').val();
/* �Ǹ������� */		var EndDate = $('input[name="salesEndDate"]').val();
/* ���� */			var price = $('input[name="prodPrice"]').val();
/* ��ǰ�̹��� */		var formData = new FormData();
			
			
			
			formData.append('file',$('input[name="file"]')[0].files[0]);
			
			if(name == null || name.length<1){
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(SetInfo == null || SetInfo.length<1){
				alert("��ǰ���������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(stock == null || stock == ''){
				stock = 0;
				$('input[name="stock"]').val(0);
			}
			if(stock != ''){
				if(!$.isNumeric(stock)){
					alert('������ ���ڷ� �����ּ���.');
					return;
				}
			}
			if(OpenDate == null || OpenDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(EndDate == null || EndDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(!$.isNumeric(price)){
				alert('������ ���ڷ� �����ּ���.');
				return;
			}

			$('#myModal').modal('show');
			if($('input[name="file"]')[0].files[0] != null){
				$.ajax({
					url : 'json/uploadFile',
					method : 'post',
					data : formData,
					contentType:false,
					processData:false,
					success : function(){
						window.setTimeout(modalOut,5000);
						window.setTimeout(sendForm,5000);
					},
					error : function(jqXHR, status, error){
						modalOut();
						alert('��Ͽ� �����߽��ϴ�. ��� �� �ٽ� �õ��� �ּ���..');
					},
					statusCode : {
						404 : function(){
							alert('404��');
						},
						405 : function(){
							alert('405��');
						},
						400 : function(){
							alert('400��');
						},
						415 : function(){
							alert('415��');
						}
					}
	
				});
			}else{
				modalOut();
				sendForm();
			}
			
		}
	
	
		$(function(){
			$('button:contains("�����ϱ�")').bind('click',function(){
				fncUpdateProduct();
			});
			
			$('button:contains("�����ϱ�")').bind('click',function(){
				alert("${product.prodNo }�� ���� �����Ͻðڽ��ϱ�?");
				/* $('form.update-product').attr('method','post').attr('action','deleteProduct').submit(); */
				self.location.href = '/product/deleteProduct?prodNo='+$('input:hidden[name="prodNo"]').val()+"&menu=manage";
			});
 

			$('#salesOpenDate').datepicker({
				dateFormat : 'yy-mm-dd',
				defaultDate: "+1w",
				changeMonth: true,
					 onClose: function( selectedDate ) {
					  $("#salesEndDate").datepicker( "option", "minDate", selectedDate );
				}
			})//datepicker cdn
			
			//����. �����Ϻ��ٴ� ���� �ǰԲ�
			$( "#salesEndDate" ).datepicker({
			 dateFormat: "yy-mm-dd",
			 defaultDate: "+1w",
			 changeMonth: true,
			 	onClose: function( selectedDate ) {
			 	 $("#salesOpenDate").datepicker( "option", "maxDate", selectedDate );
			 }
			});
			
		})
		
		function modalOut(){
			$('#myModal').modal('hide');
		}
		
		function sendForm(){
			$('form.update-product').attr('method','post').attr('action','updateProduct').attr('enctype','multipart/form-data').submit();
		}

	</script>
	<style type="text/css">
	 	#body{ padding-top: 100px; }
 		html{
        height: auto;
  		}
	</style>
	
</html>