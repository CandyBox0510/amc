<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMC 회원가입 페이지</title>
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
         <!-- Semantic checkbox -->
        <link href="/semantic/components/checkbox.css" rel="stylesheet" />
    
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
	
		<!-- 카카오 API -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		
		<!-- 다음 주소 CDN -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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

		<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" id="body">
			<div class="page-header text-center" >
	       		<h3 class="text-info" >회 원 가 입</h3>
		    </div><br/><br/>
			<!-- form Start /////////////////////////////////////-->
			<form id="form" class="form row" method='post' novalidate="">
				<div class="row">
			    	<label for="userId" class="col-sm-offset-1 col-sm-3 control-label"><strong>아 이 디</strong></label>
			    	<div class="col-sm-3" style="display:inline">
			   			<input type="text" class="inputtype" value="${email}" id="userId" name="userId" placeholder="ID입력" aria-describedby="helpBlock" readonly/>
			    	</div>	
			    	<span id="helpBlock" class="help-block col-sm-6"></span>		    
			  	</div>
			  	
			  	<div class="row">
			    	<label for="password" class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호</strong></label>
			    	<div class="col-sm-3" style="display:inline">
			      		<input type="password" class="inputtype" id="password" name="password" placeholder="비밀번호">
			    	</div>
			  	</div>
			  
				<div class="row">
					<label for="password2" class="col-sm-offset-1 col-sm-3 control-label"><strong>비밀번호 확인</strong></label>
					<div class="col-sm-3" style="display:inline">
						<input type="password" class="inputtype" id="password2" name="password2" placeholder="비밀번호 확인" aria-describedby="helpBlock2" >
					</div>
					<div class="col-sm-3" style="display:inline">
						<span id="helpBlock2" class="help-block2 col-sm-6"></span>
					</div>
				</div>
			  
				<div class="row">
					<label for="userName" class="col-sm-offset-1 col-sm-3 control-label"><strong>이름</strong></label>
					<div class="col-sm-4" style="display:inline">
						<input type="text" class="inputtype" id="userName" name="userName" placeholder="회원이름">
					</div>
				</div>
			 
						  
					<div class="row">
						<label for="birth" class="col-sm-offset-1 col-sm-3 control-label"><strong>생 년 월 일</strong></label>
							<div class="col-sm-4" style="display:inline">
								<input type="date" class="inputtype" name="birth" id="birth" placeholder="생년월일" >
							</div>
					</div>
					
					<div class="row">
						<label for="calendarType" class="col-sm-offset-1 col-sm-3 control-label"><strong>양력음력 구분</strong></label>
							<div class="col-sm-4" style="display:inline">		
								<select class="search-sort" name="calendarType" id="gender">
									<option value="S" >양력</option>
									<option value="L" >음력</option>
								</select>			  		
							</div>
					</div>
					 
					<div class="row">
						<label for="gender" class="col-sm-offset-1 col-sm-3 control-label"><strong>성 별</strong></label>
							<div class="col-sm-4" style="display:inline">			  		
								<select class="search-sort" name="gender" id="gender">
									<option value="M" >남자</option>
									<option value="F" >여자</option>
								</select>
							</div> 
					</div>
				
			  
				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>우편번호</strong></label>
						<div class="col-sm-4" style="display:inline">		      
							<input type="text" class="inputtype" id="postcode" placeholder="우편번호" readonly>
						</div>
				
						<div class="col-sm-2" >
							<input type="button" class="btn btn-md btn--info" onclick="execDaumPostcode()" value="우편번호 찾기" readonly="readonly" >
						</div>
				</div>	
							
				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>주소</strong></label>
						<div class="col-sm-4" style="display:inline">
							<input type="text" name='addr' class="inputtype" id="address" placeholder="주소">
						</div>
				</div>
					
				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>상세주소</strong></label>
						<div class="col-sm-4" style="display:inline">			
							<input type="text" name='addrDetail' class="inputtype" id="address_detail" placeholder="상세주소">
						</div>
				</div>	
  		  
				<div class="row">
					<label for="phone" class="col-sm-offset-1 col-sm-3 control-label"><strong>휴대전화번호</strong></label>
						<div class="col-sm-2" style="display:inline">
							<select class="search-sort" name="phone1" id="phone1">
								<option value="010" >010</option>
								<option value="011" >011</option>
								<option value="016" >016</option>
								<option value="018" >018</option>
								<option value="019" >019</option>
							</select>
						</div>
 
						<div class="col-sm-2">
							<input type="text" class="inputtype" id="phone2" name="phone2" placeholder="번호">
						</div>
						  
						<div class="col-sm-2">
							<input type="text" class="inputtype" id="phone3" name="phone3" placeholder="번호">
						</div>
				</div>
		  
				<div class="row">
					<div class="col-sm-offset-4  col-sm-4 text-center">
						<button id="addUser" type="button" class="btn btn-md btn--info"  >가 &nbsp;입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
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
		var check = false;
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addUser" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
/* 		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
 */		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var birth=$("input[name='birth']").val();
			var check=true
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				/* return check=false; */
				return;
			}
			if(id != null && (id.indexOf('@') < 1 || id.indexOf('.') == -1) ){
				alert("이메일형식이아닙니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				/* return check=false; */
				return; 
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				/* return check=false; */
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				/* return check=false; */
				return;
			}
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				/* return check=false; */
				return;
			}			
			if( birth == null || birth.length <1 ) {				
				alert("생년월일은 반드시 입력해야합니다..");				
				/* return check=false; */
				return;
			}
			
				
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			/* $("input:hidden[name='phone']").val( value ); */
			
			if(check == true){
				alert('회원가입을 축하합니다.');
				$("#form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
			}
			
			/* $("form").attr("method" , "POST").attr("action" , "/user/addUser").submit(); */
		}
		
 
/*  		$(function(){
 			$('#email_select').change(function(){
 				if($('#email_select').val() == "1"){
 					$('#last_email').val(""); //값 초기화
 					$('#last_email').prop("readonly",false); //활성화
 				} else if($('#email_select').val()==""){
 					$('#last_email').val(""); //값 초기화
 					$('#last_email').prop("readonly",true); //textBox 비활성화
 				} else {
 					$('#last_email').val($('#email_select').val()); //선택값 입력
 					$('#last_email').prop("readonly",true); //비활성화
 				}
 			});
 		});
 */ 	
 
 
		//==>""이메일" 유효성Check / ID중복확인" Event 처리 및 연결
		$(function(){					
			$('#userId').bind('keyup', function(){
				var userId = $(this).val().trim();
				var tempId = userId.split(".");
                console.log("userId :: " + userId);
                console.log("tempId :: " + tempId);
					$.ajax({
						url : 'json/checkDuplication/'+tempId,
						method : 'get',
						dataType : 'json', 
						 headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						}, 
						success : function(JSONData , status){
							/* alert("JSONData" + JSONData); */
							if(JSONData){
								$('span.help-block').html('사용가능한 아이디 입니다.').css('color','blue');
								check = true;
							}else{
								$('span.help-block').html('이미 존재하는 아이디 입니다.').css('color','red');
								check = false;
							}
						}
					});
				
					if(userId == ''){
						$('span.help-block').html('');
					}
			      
			});
		});
			
		
		$(function(){
			$('#password2').bind('keyup',function(){
				if( $('#password').val() != $(this).val()){
					$('span.help-block2').text("비밀번호가 다릅니다.").css('color','red');
				}else{
					$('span.help-block2').text("확인").css('color','blue');
				}
			});
		});
		
		
		
		
		////다음 주소 API////////////////////////////////////////////////////////////////////////////////////////////////
			function execDaumPostcode() {
				
		        new daum.Postcode({
		            oncomplete: function(data) {
		            	
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('address').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('address_detail').focus();
		            },
		        
		            theme: {
		    	 		bgColor: "#ECECEC", //바탕 배경색
		    	 		searchBgColor: "#0B65C8", //검색창 배경색
		    	 		contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결l과없음,첫화면,검색서제스트)
		    	 		pageBgColor: "#FAFAFA", //페이지 배경색
		    	 		textColor: "#333333", //기본 글자색
		    	 		queryTextColor: "#FFFFFF", //검색창 글자색
		    	 		postcodeTextColor: "#FA4256", //우편번호 글자색
		    	 		emphTextColor: "#008BD3", //강조 글자색
		    	 		outlineColor: "#E0E0E0" //테두리
		    		}   
	            
		        }).open();
		    }

	</script>	
	<style type="text/css">
	 	#body{ padding-top: 100px; }

		
		html{
	        height: auto;
	  	}
		 
		.inputtype{
		  margin-bottom: 10px;
		  width: 100%;
		  border: none;
		  box-shadow: none;
		  border: 1px solid #dbdee1;
		  -webkit-border-radius: 3px;
		  -moz-border-radius: 3px;
		  border-radius: 3px;
		  font-size: 13px;
		  color: #000000;
		  padding: 9px 18px 10px !important;
		  position: relative;
		} 
	
	input, select {
		margin-bottom: 10px;
		height: 100%;
		width: 100%;
		border: none;
		box-shadow: none;
		border: 1px solid #dbdee1;
		-webkit-border-radius: 3px;
		-moz-border-radius: 3px;
		border-radius: 3px;
		font-size: 13px;
		color: #000000;
		padding: 9px 18px 10px !important;
	}
	
	</style>
	
		

</html>