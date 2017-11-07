<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>ȸ�� ��������</title>
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

<body>
	<div class="wrapper">
    	<!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container" id="body">
			<div class="page-header text-center">
	       		<h3 class=" text-info">ȸ����������</h3>
		       	<h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
		    </div>
			<form class="form-horizontal">
		  		<div class="form-group">
			    	<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
				    	<div class="col-sm-4">
				      		<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
				       		<span id="helpBlock" class="help-block">
				      			<strong class="text-danger">���̵�� �����Ұ�</strong>
				      		</span>
				    	</div>
		  		</div>
		  		<div class="form-group">
		    		<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    		<div class="col-sm-3">
		      			<input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    		<div class="col-sm-3">
		      			<input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    		</div>
		     		<span id="helpBlock2" class="help-block2 col-sm-6"></span>
		  		</div>
		  		<div class="form-group">
		    		<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>		
		    		<div class="col-sm-4">
		      			<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    		<div class="col-sm-4">
		      			<input type="text" class="form-control" id="addr" name="addr"  value="${user.addr}" placeholder="�����ּ�">
		    		</div>
		  		</div>
	  	  		<div class="form-group">
		    		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label">���ּ�</label>
		    		<div class="col-sm-4">
		      			<input type="text" class="form-control" id="addr" name="addr"  value="${user.addrDetail}" placeholder="�����ּ�">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label">������</label>
		    		<div class="col-sm-4">
		      			<input type="text" class="form-control" id="userRegDate" name="userRegDate"  value="${user.userRegDate}" readonly>
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		     		<div class="col-sm-2">
				      	<select class="form-control" name="phone1" id="phone1">
						  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
							<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
							<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
							<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
							<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
						</select>
		    		</div>
		    		<div class="col-sm-2">
		      			<input type="text" class="form-control" id="phone2" name="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}"  placeholder="�����ȣ">
		    		</div>
		    		<div class="col-sm-2">
		      			<input type="text" class="form-control" id="phone3" name="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}"   placeholder="�����ȣ">
		    		</div>
	  			</div>
			  	<div class="form-group">
			    	<div class="col-sm-offset-4  col-sm-4 text-center">
			      		<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
				  		<a class="btn btn-primary btn" id="back" role="button">�� &nbsp;��</a>
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
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#back").on("click" , function() {
				alert("������ ����Ͻðڽ��ϱ�?");
				  history.back();
			});
		});	
		
		//=============�̸���" ��ȿ��Check  Event ó�� =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
	
		$(function(){
			$('#password2').bind('keyup',function(){
				if( $('#password').val() != $(this).val()){
					$('span.help-block2').text("��й�ȣ�� �ٸ��ϴ�.").css('color','red');
				}else{
					$('span.help-block2').text("Ȯ��").css('color','blue');
				}
			});
		});
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				/* return check=false; */
				return; 
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				/* return check=false; */
				return;
			}
				
			var value = "";	
			if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			
			//Debug...
			//alert("phone : "+value);
			$("input:hidden[name='phone']").val( value );
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
<style type="text/css">
 	#body{ padding-top: 100px; }
</style>
</html>