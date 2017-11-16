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
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<style>
		body{
			padding-top : 70px;
		}
		.dropdown:hover > .dropdown-menu{
			display : block;
		}
		
		.rightMenu{
			position:absolute;
			float:right;
			top:0;
			left:158px;
		}
	</style>
	
	<script type="text/javascript">
		
		function init(){
			
			console.log($('div.modal-body').html());
			
			$('.form-group .form-control').addClass('hidden');
			
			$('.btn-primary:contains("정보수정")').attr('disabled','disabled');
			
			$('div.form-group[title="수정하려면 클릭하세요"] p').removeClass('hidden').unbind('click').bind('click',function(){
				if($('input:hidden[name="tranCode"]').val() == '1'){
					$(this).addClass('hidden');
					$(this).parent().find('.form-control').removeClass('hidden');
					if($('.btn-primary:contains("정보수정")').attr('disabled')=='disabled'){
						$('.btn-primary:contains("정보수정")').removeAttr('disabled');
					}
				}else if($('input:hidden[name="tranCode"]').val() == '2'){
					alert('배송 중인 상품은 정보를 수정할 수 없습니다!');
				}else{
					alert('이미 배송 완료된 상품입니다!');
				}
				$(this).unbind('click');
			});
			
		}
	
	
		$(function(){
			
			init();
			
			$('.btn-primary:contains("정보수정")').bind('click',function(){
				$.ajax({
					url : '/purchase/json/updatePurchase',
					method : 'post',
					dataType : 'json',
					data : JSON.stringify({
						impId : $('input[name="impId"]').val(),
						paymentOption : $('select[name="paymentOption"]').val(),
						orderStock : $('select[name="orderStock"]').val(),
						receiverName : $('input[name="receiverName"]').val(),
						receiverPhone : $('input[name="receiverPhone"]').val(),
						dlvyAddr : $('input[name="dlvyAddr"]').val(),
						dlvyDate : $('input[name="dlvyDate"]').val(),
						dlvyRequest : $('input[name="dlvyRequest"]').val()
					}),
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					success : function(data){
						$($('.form-group[title="수정하려면 클릭하세요"] p')[0]).text(data.paymentOption.trim()=='1' ? '현금구매':'신용구매');
						$($('.form-group[title="수정하려면 클릭하세요"] p')[1]).text(data.orderStock);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[2]).text(data.receiverName);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[3]).text(data.receiverPhone);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[4]).text(data.dlvyAddr);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[5]).text(data.dlvyDate);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[6]).text(data.dlvyRequest);
						init();
					},
					error : function(){
						alert("정보수정실패");
					}
				});
			});
			
		});
	</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">구매 정보 확인/수정</h4>
		</div>
		<div class="modal-body">
			<form class="form-horizontal">
				<input type="hidden" name="tranCode" value="${purchase.tranCode}">
				<input type="hidden" name="impId" value="${purchase.impId}">
				<input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
				<div class="form-group">
					<label class="col-sm-2 control-label">물품명</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.purchaseProd.prodName}</p>
					</div>
				</div>
				<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">결제방법</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.paymentOption=='1  ' ? "카카오페이 구매" : "" }</p>
						<select class="form-control hidden" name="paymentOption">
							<option value="1" ${purchase.paymentOption=='1  ' ? "selected":""}>카카오페이 구매</option>							
						</select>
					</div>
				</div>
				<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">구매수량</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.orderStock}</p>
						<select class="form-control hidden" name="orderStock">
							<c:forEach var="i" begin="1" end="${purchase.purchaseProd.stock+purchase.orderStock>10? 10 : purchase.purchaseProd.stock+purchase.orderStock }">
								<option value="${i}" ${purchase.orderStock==i ? "selected":"" }>${i}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">받는사람</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.receiverName}</p>
						<input type="text" class="form-control hidden" name="receiverName" value="${purchase.receiverName}">
					</div>
				</div>
				<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">연락처</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.receiverPhone1}</p>
						<p class="form-control-static">${purchase.receiverPhone2}</p>
						<p class="form-control-static">${purchase.receiverPhone3}</p>
						<input type="text" class="form-control hidden" name="receiverPhone1" value="${purchase.receiverPhone1}">
						<input type="text" class="form-control hidden" name="receiverPhone2" value="${purchase.receiverPhone2}">
						<input type="text" class="form-control hidden" name="receiverPhone3" value="${purchase.receiverPhone3}">
					</div>
				</div>
				<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">배송지</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.addrDlvy}</p>
						<input type="text" class="form-control hidden" name="addrDlvy" value="${purchase.addrDlvy}">
					</div>
				</div>
						<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.addrDlvyDetail}</p>
						<input type="text" class="form-control hidden" name="addrDlvyDetail" value="${purchase.addrDlvyDetail}">
					</div>
				</div>
				<div class="form-group" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">배송 상세주소</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.addrDlvyDetail}</p>
						<input type="text" class="form-control hidden" name="addrDlvyDetail" value="${purchase.addrDlvyDetail}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">주문일</label>
					<div class="col-sm-10">
						<p class="form-control-static">${purchase.orderRegDate}</p>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			<c:if test="${purchase.tranCode == '1'}">
				<button type="button" class="btn btn-primary" >정보수정</button>
			</c:if>
		</div>
	</div>
</div>
</body>

<style type="text/css">
 	#body{ padding-top: 0px; }
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
		  font-size: 0px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 0px;
		  margin-top: 0px;
	}
		html{
	        height: auto;
	  	}
	  	
.ui.modal > .close {
  cursor: pointer;
  position: absolute;
  top: -2.5rem;
  right: -2.5rem;
  z-index: 1;
  opacity: 0.8;
  font-size: 1.25em;
  color: #FFFFFF;
  width: 2.25rem;
  height: 2.25rem;
  padding: 0.625rem 0rem 0rem 0rem;
}  	  


.ui.modal > .header {
  display: block;
  font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif;
  background: #FFFFFF;
  margin: 0em;
  padding: 1.25rem 1.5rem;
  box-shadow: none;
  color: rgba(0, 0, 0, 0.85);
  border-bottom: 1px solid rgba(34, 36, 38, 0.15);
}

button:-moz-focusring,
[type="button"]:-moz-focusring,
[type="reset"]:-moz-focusring,
[type="submit"]:-moz-focusring {
  outline: 0px dotted ButtonText;
}

.ui.modal {
  display: none;
  position: fixed;
  z-index: 1001;
  top: 00%;
  left: 50%;
  text-align: left;
  background: #000000;
  border: none;
  box-shadow: 1px 3px 3px 0px rgba(0, 0, 0, 0.2), 1px 3px 15px 2px rgba(0, 0, 0, 0.2);
  -webkit-transform-origin: 00% 25%;
  transform-origin: 50% 25%;
  border-radius: 0.28571429rem;
  -webkit-user-select: text;
  -moz-user-select: text;
  -ms-user-select: text;
  user-select: text;
  will-change: top, left, margin, transform, opacity;
}

.col-xs-7 {
  width: 58.33333333%;
  font-size: 15px;
}

</style>
</html>