<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>

<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.amc.service.domain.User"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%--   <%
	User user = new User();
	user.setUserId("testAdmin");
	user.setRole("admin");
	session.setAttribute("user", user);
%> 
 --%> 
<html lang="ko">
	
<head>

   <meta charset="EUC-KR">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ���Ⱑ �ٸ� jsp �������� �ִ� cdn ��/////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  
    
	
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       <!-- �����η� ����  -->
		<a class="navbar-brand" href="/index.jsp">
			<img src="/images/common/AMC_Logo.png" width="80px" height="30px"/>
		</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!-- ��ȭ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>��ȭ</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">���� �󿵿�ȭ</a></li>
	                         <li><a href="#">�� ������ȭ</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">�û�ȸ</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- ���� DrowDown  -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span>����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">��ȭ ����</a></li>
		                         <li><a href="#">�û�ȸ ����</a></li>
		                     </ul>
		                </li>
		                
	              <!-- ��ȭ��  -->
					  <li><a href="#">��ȭ��</a></li>
				
				  <!-- Ŀ�´�Ƽ  -->  
					  <li><a href="#">Ŀ�´�Ƽ</a></li>
		                
	              <!-- ����� DrowDown  -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span>�����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">����</a></li>
		                         <li><a href="#">������</a></li>
		                     </ul>
		                </li>
	                 
	             <!-- �����ڸ޴� DrowDown  -->
	             
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >[������ �޴�]</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">ȸ������</a></li>
		                         <li><a href="#">��ǰ����</a></li>
		                         <li><a href="#">�ǸŰ���</a></li>
		                         <li><a href="#">��ȭ����</a></li>
		                         <li><a href="#">�󿵰���</a></li>
		                         <li><a href="#">���Ű���</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	             </ul>
	             
	             
	             
	             <ul class="nav navbar-nav navbar-right">
	             <!-- ������ �α��� ������ �� -->
<%-- 	             	<c:if test="${sessionScope.user ne null }">
		             	<li title="Click : �������� ����"><a href="#">ID : [${sessionScope.user.userId }]</a></li>
		             	<li><a href="#">�α׾ƿ�</a></li>
		             	<li><a href="#">����������</a></li>
	             	</c:if>
 --%>	             	
	             <!-- ������ ��α��� ������ �� -->	
<%-- 	             	<c:if test="${sessionScope.user eq null }">
		             	<li>
		             		<input type="text" name="userId" placeholder="���̵�" width="300px">
		             		<input type="text" name="password" placeholder="��й�ȣ" width="300px">
		             	</li>
		             	<input type="button" value="�α���">
	             	</c:if>
 --%>	            </ul>
	           	 <!-- ������ ��α��� ������ �� -->	
	 			<c:if test="${empty user}">		
	 				<li>			
						<form class="navbar-form navbar-right">
						<!-- <a data-toggle="modal" href="../user/loginUser" data-target="#modal-testNew" role="button" data-backdrop="static"> -->
						<a data-toggle="modal" href="/user/loginUser" data-target="#modal-testNew" role="button" data-backdrop="static">
							<button type="button" class="btn btn-primary">Log in</button>
						</a >
							<a href="/user/authForm.jsp"><button type="button" class="btn btn-primary">Sign in</button></a>
						</form>
					</li>	
				</c:if>	
				
				<c:if test="${!empty user}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" class="user-info">${sessionScope.user.userName}</a>
						<li><a href="#">����������</a></li>
						<li><a href="#">�α׾ƿ�</a></li>
					</ul>
				</c:if> 
				<form>
					<input type="text" name="searchKeyword" placeholder="���հ˻�">
					<input type="button" value="�˻�!" onClick="javascript:unifiedSearch()">
				</form>          
		</div>
		<!-- dropdown hover END -->	       
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
   	
	   	function openHistory(){
	   		popWin = window.open("../openHistory.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	   	}
	   	
	   	function unifiedSearch(){
	   		//POST�� �ٲ����
	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").submit();
	   		/* $(self.location).attr("href","/cinema/unifiedSearch"); */
	   	}
   	
		
		//============= ��ȭ Event  ó�� =============	
		/*  $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('��ȭ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/movie/getMovieList"
			}); 
		 }); */
		
		//=============  ���� �󿵿�ȭ Event  ó�� =============	
	 	$( "a:contains('���� �󿵿�ȭ'),a:contains('ID')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/movie/getMovieList?menu=movie");
		});
		
		
	 	//=============  �� ������ȭ Event  ó�� =============	
	 	$( "a:contains('�� ������ȭ')" ).on("click" , function() {
			$(self.location).attr("href","/movie/getMovieList?menu=commingsoon");
		});
	 	
	 	//=============  �û�ȸ Event  ó�� =============	
	 	$( "a:contains('�û�ȸ')" ).on("click" , function() {
			$(self.location).attr("href","/movie/getMovieList?menu=preview");
		});
	 	
	 	//=============  ���� Event  ó�� =============	
	 	$( "a:contains('����')" ).on("click" , function() {
			$(self.location).attr("href","/booking/getScreenMovieList");
		});
	 	
	 	//=============  ��ȭ ���� Event  ó�� =============	
	 	$( "a:contains('��ȭ ����')" ).on("click" , function() {
			$(self.location).attr("href","/booking/getScreenMovieList");
		});
	 	
	 	//=============  �û�ȸ ���� Event  ó�� =============	
	 	$( "a:contains('�û�ȸ ����')" ).on("click" , function() {
			$(self.location).attr("href","/booking/getScreenPreviewList");
		});
		
	 	//=============  ��ȭ�� Event  ó�� =============	
	 	$( "a:contains('��ȭ��')" ).on("click" , function() {
			$(self.location).attr("href","/cinema/theaterInfo");
		});
	 	
	 	//=============  Ŀ�´�Ƽ Event ó�� =============	
	 	$( "a:contains('Ŀ�´�Ƽ')" ).on("click" , function() {
			$(self.location).attr("href","/community/getFreeBoardList");
		});
	 	
	 	//============= ����� Event ó�� =============	
	 	$( "a:contains('�����')" ).on("click" , function() {
			$(self.location).attr("href","/product/getGoodsList?menu=search");
		});
	 	
	 	//=============  ���� Event ó�� =============	
	 	$( "a:contains('����')" ).on("click" , function() {
			$(self.location).attr("href","/product/getGoodsList?menu=search");
		});
	 	
	 	//=============  ������ Event ó�� =============	
	 	$( "a:contains('������')" ).on("click" , function() {
			$(self.location).attr("href","/product/getSnackList?menu=search");
		});
	 	
	 	//=============  ȸ������ Event  ó�� =============	
	 	$( "a:contains('ȸ������')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUserList");
		});
	 	
	 	//=============  ��ǰ���� Event  ó�� =============	
	 	$( "a:contains('��ǰ����')" ).on("click" , function() {
			$(self.location).attr("href","/product/getGoodsList?menu=manage");
		});
	 	
	 	//=============  �ǸŰ��� Event  ó�� =============	
	 	$( "a:contains('�ǸŰ���')" ).on("click" , function() {
			$(self.location).attr("href","/purchase/getSaleList");
		});
	 	
	 	//=============  ��ȭ���� Event  ó�� =============	
	 	$( "a:contains('��ȭ����')" ).on("click" , function() {
			$(self.location).attr("href","/movie/getMovieList?menu=manage");
		});
	 	
	 	//=============  �󿵰��� Event  ó�� =============	
	 	$( "a:contains('�󿵰���')" ).on("click" , function() {
			$(self.location).attr("href","/screen/getScreenList");
		});
	 	
	 	//=============  ���Ű��� Event  ó�� =============	
	 	$( "a:contains('���Ű���')" ).on("click" , function() {ss
			$(self.location).attr("href","/booking/getAdminBookingList");
		});
	 	
	 	
/* 	 	//============= login Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("input:contains('�α���')").on("click" , function() {
				$(self.location).attr("href","/user/loginUser");
			}); 
		 });
 */	 	
	 	//============= logout Event  ó�� =============	
/*		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logoutUser");
			}); 
		 });
 */	 	
 
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('�α׾ƿ�')").on("click" , function() {
			alert("īī���α׾ƿ�");
			logoutWithKakao();
			
		}); 
	});
 
		function logoutWithKakao() {
			Kakao.init('fc5658887af25f840e94144f6722b228');
			Kakao.Auth.logout(function(){
				setTimeout(function(){
					location.href="/user/logoutUser/"
				},300);
				});
		}

		//=============  �ֱ� �� ��ǰ  ó�� =============	
		 	$( "a:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {
		 		openHistory();
			});
	 	
	</script>  
 	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 	  body {
            padding-top: 70px;
            }
            .thumbnail {
            width: 150px;
            height: 200px;
            overflow: auto;
      }	
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#updateMoviebtn" ).on("click" , function() {
			 	//alert("���� ��ư Ŭ�� Ȯ��");
				//Debug..
				// <!-- <a href="javascript:history.go(-1)"></a> -->
				fncUpdateMovie()
		});
	});	



	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#deleteMoviebtn" ).on("click" , function() {
				//Debug..
				// <!-- <a href="javascript:history.go(-1)"></a> -->
				fncDeleteMovie()
			 	
		});
	});	
	
	
	function fncUpdateMovie() {
		// document.fncAddProduct.submit();
		
		var movieNm=$("input[name='movieNm']").val();
		
		var directors=$("input[name='directors']").val();	
		var actors=$("input[name='actors']").val();
		var genres=$("input[name='genres']").val();
		var watchGradeNm=$("input[name='watchGradeNm']").val();
		var openDt=$("input[name='openDt']").val();
		var showTm=$("input[name='showTm']").val();
		var endDt=$("input[name='endDt']").val();
		var synopsis=$("input[name='synopsis']").val();
		var trailer=$("input[name='trailer']").val();	
		
		//alert(directors+actors+genres+watchGradeNm)
	
		
	
		if(directors == null || directors.length<1){
			alert("�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(actors == null || actors.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(genres == null || genres.length<1){
			alert("�帣���� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(watchGradeNm == null || watchGradeNm.length<1){
			alert("��������� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(openDt == null || openDt.length<1){
			alert("������¥��  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(showTm == null || showTm.length<1){
			alert("����Ÿ����  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(endDt == null || endDt.length<1){
			alert("�󿵸�����  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
	
	
		$("form").attr("method","POST").attr("action","/movie/updateMovie").submit();
	}	
	
	
	 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	function fncDeleteMovie() {		
		 
		var movieNo=$("input[name='movieNo']").val();
		alert("movieNo" + movieNo );
		 
		$("form").attr("method","POST").attr("action","/movie/deleteMovie?movieNo="+movieNo).submit();
	}	
	 
	 </script>
	
</head>
<body>

<form id="updateMovie" enctype="multipart/form-data" method="POST">  
<input type="hidden" name="movieNo" value="${movie.movieNo}"/>


	<!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/topToolbar.jsp" />  --%>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">${movie.movieNm}</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<input type="text" name="directors" value="${movie.directors}" disabled  			
				   class="ct_input_g" 	     style="width: 160px; 
				   height: 20px" 		     maxLength="30"/>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���</strong></div>
			<input type="text" name="actors" 	
				   value="${movie.actors}"
				   disabled
				   class="ct_input_g" 
				   style="width: 160px;      height: 20px" maxLength="30"/>
	
		</div>
		
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�帣</strong></div>
			<input type="text" name="genres" 	
				   class="ct_input_g"    value="${movie.genres}"
				   disabled
				   style="width: 160px;  height: 20px" maxLength="30" />
	
		</div>
		
		<div class="row">
  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
		<input type="text" name="watchGradeNm" 	
			   class="ct_input_g"    value="${movie.watchGradeNm}"
			   style="width: 160px;  height: 20px" maxLength="30" />
	
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������¥ </strong></div>
			<input 	type="date" name="openDt" class="ct_input_g" 
							value="${movie.openDt}" 	
							style="width: 160px; height: 20px" maxLength="30"/>					
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����Ÿ��</strong></div>
			<input type="text" name="showTm" 	
				   class="ct_input_g"    value="${movie.showTm}" 
				   style="width: 160px;  height: 20px" maxLength="30" /> &nbsp;��
		
		</div>


		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�󿵸��� </strong></div>
			<input 	type="date" name="endDt" class="ct_input_g" 
							value="${movie.endDt}" 	
							style="width: 160px; height: 20px" maxLength="30"/>		
		</div>		
	
					
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������</strong></div>
	  		<img src="${movie.postUrl}" width="160px" height="180px" align="left"/>
	  		
		</div>
		
		<hr/>
		
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ٰŸ�</strong></div>	  	
	    <textarea name="synopsis" cols="90" rows="8" >${movie.synopsis} </textarea> 	
	    </div>
		
		<hr/>
	
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ƿ��</strong></div>
	  		<!-- <a class='thumbnail' style="text-decoration:none;"> -->
	  		<!-- <img src="file:C:/amcPoster/${movie.steelCut1}" width="160px" height="180px" align="left"/>  -->
	  		<img src="../images/movie/${movie.steelCut1}" width="220px" height="180px" align="left"/>
	  		<img src="../images/movie/${movie.steelCut2}" width="220px" height="180px" align="left"/>
	  		<img src="../images/movie/${movie.steelCut3}" width="220px" height="180px" align="left"/>
	  		</a>
	  	</div>
	 
	  	
	    <hr/>
	    
		<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file1" name="file" required="required" /></div>
		<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>
		<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>   
				
		<hr/>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>Ʈ���Ϸ� URL</strong></div>	  	
	    <textarea name="trailer" cols="90" rows="2" >${movie.trailer} </textarea> 	

		<hr/>
		<div class="row">
	  		<div class="col-md-2 text-left ">
	  			<button type="button" id="updateMoviebtn"  class="btn btn-primary">����</button>
	  		</div>
	  		<div class="col-md-2 text-left ">
	  			<button type="button" id="deleteMoviebtn"   class="btn btn-primary">����</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 </div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</form>
</body>
</html>

