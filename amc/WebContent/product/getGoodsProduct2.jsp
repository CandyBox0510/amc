<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>���� ��ǰ����</title>
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
    
   		<!-- Stylesheets -->
        <!-- jQuery UI -->
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />
        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
	
	
	
	
	
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
								<dt>���� �������</dt>
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
							<%--  <c:if test="${param.menu=='search' && !empty user}">
								<a href="#" class="btn btn-success" role="button">�����Ϸ�����</a>
							</c:if> --%> 
								<a href="#" class="btn btn-default" role="button">�������</a>
							</div>
						</div>
					</div><!-- ���� ��ǰ���� -->
		
					
					  <!-- Progress bar -->
	            <div class="content-wrapper">
	              <h2 class="heading heading--outcontainer">�Ǹ� ��Ȳ</h2>
	
	                <div class="col-sm-4">
	                    <div class="progress">
	                      <p class="progress__info">���� �Ǹŷ�</p>
	                      <div class="progress__bar" role="progressbar" data-level="75">
	                          <div class="progress__current" style="width: 0%;"></div>
	                      </div>
	                    </div>
	                </div>
	            </div>
	            <div class="devider-wrapper">
	                <div class="devider"></div>
	            </div>
	            
	            
	            
	            
	            
	            
	            
	            
	            
	            
			</div>
		</div>
	</div>
	
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="../layout/loginModal.jsp"/>
	
	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script> 
        <!-- Inview -->
        <!-- <script src="js/external/jquery.inview.js"></script> -->
        <script src="js/external/jquery.waypoints.min.js"></script>
        <script src="js/external/inview.min.js"></script>

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
        <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() { 
                init_Elements();
            });
		</script>
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
				if('${sessionScope.user.userId}'== null){
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					self.location.href = '/purchase/addPurchase?prodNo='+$('input:hidden[name="prodNo"]').val();
				} 
			});
		});

    	//6. Progressbar
  		//Count function for progressbar
  		function init_progressBar(duration) {
             $('.progress').each(function() {
                 var value = $(this).find('.progress__bar').attr('data-level');
                 var result = value + '%';
                 if(duration) {
                     $(this).find('.progress__current').animate({width : value + '%'}, duration);
                 }
                 else {
                     $(this).find('.progress__current').css({'width' : value + '%'});
                 }
                 
             });
          }

//           inview progress bars
//            $('.progress').one('inview', function (event, visible) {
//                if (visible == true) {
                     
//                }
//            });

          var inview = new Waypoint.Inview({
            element: $('.progress')[0],
            enter: function(direction) {
              init_progressBar(2000);
            }
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
		html{
	        height: auto;
	  	}  
</style>


</html>