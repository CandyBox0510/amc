<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@page import="com.amc.service.domain.User"%>
<%@page import="java.util.Enumeration"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- <%
	 User user = new User();	
	 out.println("userID" + ((User)session.getAttribute("user")).getUserId() + "<br/>");
	 
%>   --%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!--  <link rel="stylesheet" href="/resources/demos/style.css">  -->
	<!-- <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"   rel="stylesheet">  -->
	<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet"> -->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   	<link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
   
    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	 body {
            padding-top: 70px;
            }
            .thumbnail {
            width: 300px;
            height: 250px;
            overflow: auto;
      }	
      
      #searchIcon
       {    color: #fff;       		
    		text-shadow: 1px 1px 1px #ccc;
    		font-size: 1.5em;
       }
       
     #voidSearchIcon
       {    color: #fff;       		
    		text-shadow: 1px 1px 1px #ccc;
    		font-size: 1.5em;
       }
      
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	 /* jsp ȭ�� �ε��� ó���� �� WishList ������ �����´�. */	 
	
		/* $(document).ready(function() {
			
			
			//alert("111");
			$.ajax( 
					{
						url : "/movie/json/wishList/s@s.s",	
						method : "post" ,
						dataType : "json" ,					
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
					
						
						success : function(response) {
							
							var wishListLength =  response.wishList.length;
							var wishNo = response.wishList[0].wishNo;
							var movieNo = response.wishList[0].movieNo; 
							
							var wishListLength = response.wishList.length;
							var wishNo = '';
							var movieNo = '';
							var test2 = '';
							
							displayValue =''
							display =''
							
							for(var idx=0; idx < response.wishList.length; idx++) {
								 wishNo += response.wishList[idx].wishNo + ",";
								 movieNo += response.wishList[idx].movieNo + ",";
								 
								 movieNo = response.wishList[idx].movieNo ;
								 var len = response.wishList.length;
								 alert(movieNo)
								 
								 alert("length :" + len);
								 
								 test = $("input[name='test"+movieNo+"']").val();
								 
								 alert("test movieNo ::" + test )

								if(movieNo == test){
									
								    alert("test movieNo ::" + test )
								
									display += "<p>ddddddddd</p>"
									
									 $("input[name='test"+movieNo+"']").after(display); 
								}
								
								alert("length : " + wishListLength + "wishNo " + response.wishList[idx].wishNo + " movieNo" + response.wishList[idx].movieNo); 
							
							}
							
							alert("test MovieNo" + test2);
							displayValue += wishNo + movieNo;
							
							
							
							alert("displayValue" + displayValue);						
							
							
							movieNo2 =  $("#scMovieNo",$(this)).val();
							
							alert(movieNo2);
							
							
							alert("length : " + wishListLength + " wishNo =" + wishNo + " movieNo =" + movieNo); 

							
						}
				});	
		});	
		 */


		
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetPageList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action", "/movie/getMovieList?menu=search").submit();
			//$("form").attr("method","POST").attr("action", "/movie/getMovieList").submit();
			
		}
			
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetPageList(1);
			});
			
		 });
		
		//============= "�˻� Icon"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#searchIcon").on("click" , function() {
				fncGetPageList(1);
			});
			
		 });
		
		//============= "���� �˻� Icon"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#voidSearchIcon").on("click" , function() {
				self.location = "/movie/getMovieList?menu=voiceRegniiton";
			});
			
		 });
		
		//============= "WishList(��) Event ó��" AddWish Event  ó�� =============	
			$(function() {
				 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 
				// $("span:contains('���ϱ�')" ).on("click" , function() {
			/* 	$(".glyphicon.glyphicon-heart-empty").on("click" , function() {	
					
					 //var movieNo = $(this).next().val();		
					 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
	
					var movieNo = $(this).find('#scMovieNo').val();		
					var userId = $(this).find('#userId').val();			
					
					alert("movieNo: " + movieNo); 					
					alert("userId: " + userId); 
					
					//$(this).toggleClass('glyphicon glyphicon-heart-empty').toggleClass(".glyphicon glyphicon-heart");
				
					
					//$(this).switchClass('glyphicon glyphicon-heart-empty','glyphicon glyphicon-heart');
				    $(this).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');
				    
				    //$(this).replaceClass('.glyphicon glyphicon-heart-empty','.glyphicon glyphicon-heart');
					
				    //$(this).addClass('glyphicon glyphicon-heart');
					
					
					 if (userId != null && userId.length !=0) {
						alert("userId: " + userId);
					} else {
						alert('�α����� �ʿ��� �����Դϴ�.\n�α��� �������� �̵��Ͻðڽ��ϱ�?');
						location.href="/user/loginUser.jsp";
					} 
					
					
					if(userId == null || userId == ''){
						alert("�α��� �� �̿� �����մϴ�.");
						return;
					}
					
								
					$.ajax( 
							{
								url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=movie",									
								type : "GET" ,							
							}).done(function(data) {
						//���� ����� ���
						if (data == 'add') {
							var msg = '���ϱ� ��û';
							alert(msg);
						} else {
							alert("���ϱ� ���");
						}
					});
				});	 */
			});
		
		
			//============= "WishList(��) Event ó��" DeleteWish Event  ó�� =============	
			$(function() {
				 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 
				  $(document).on("click", ".glyphicon.glyphicon-heart-empty", function () {

						
						 //var movieNo = $(this).next().val();		
						 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
		
						var movieNo = $(this).find('#scMovieNo').val();		
						var userId = $(this).find('#userId').val();			
						
						alert("movieNo: " + movieNo); 					
						alert("userId: " + userId); 
						
						//$(this).toggleClass('glyphicon glyphicon-heart-empty').toggleClass(".glyphicon glyphicon-heart");
					
						
						//$(this).switchClass('glyphicon glyphicon-heart-empty','glyphicon glyphicon-heart');
					    $(this).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');
					    
					    //$(this).replaceClass('.glyphicon glyphicon-heart-empty','.glyphicon glyphicon-heart');
						
					    //$(this).addClass('glyphicon glyphicon-heart');
						
						
						/* if (userId != null && userId.length !=0) {
							alert("userId: " + userId);
						} else {
							alert('�α����� �ʿ��� �����Դϴ�.\n�α��� �������� �̵��Ͻðڽ��ϱ�?');
							location.href="/user/loginUser.jsp";
						} */
						
						
						if(userId == null || userId == ''){
							alert("�α��� �� �̿� �����մϴ�.");
							return;
						}
						
									
						$.ajax( 
								{
									url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=movie",									
									type : "GET" ,							
								}).done(function(data) {
							//���� ����� ���
							if (data == 'add') {
								var msg = '���ϱ� ��û';
								alert(msg);
							} else {
								alert("���ϱ� ���");
							}
						});
					
				})
				 
				 $(document).on("click", ".glyphicon.glyphicon-heart", function () {
						
						
					 //var movieNo = $(this).next().val();		
					 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
	
					var movieNo = $(this).find('#scMovieNo').val();		
					var userId = $(this).find('#userId').val();			
					
					alert("movieNo: " + movieNo); 					
					alert("userId: " + userId); 
					
				
					//$(this).toggleClass($(this).find(".glyphicon glyphicon-heart-empty"));						
					//$(this).replaceClass('.glyphicon glyphicon-heart','.glyphicon glyphicon-heart-empty');
					//$(this).toggleClass('glyphicon glyphicon-heart').toggleClass(".glyphicon glyphicon-heart-empty");
					
					
					$(this).removeClass('glyphicon glyphicon-heart').addClass('glyphicon glyphicon-heart-empty');
					//$(this).addClass('glyphicon glyphicon-heart-empty');
					
				
					/* if (userId != null && userId.length !=0) {
						alert("userId: " + userId);
					} else {
						alert('�α����� �ʿ��� �����Դϴ�.\n�α��� �������� �̵��Ͻðڽ��ϱ�?');
						location.href="/user/loginUser.jsp";
					} */
					
					
					if(userId == null || userId == ''){
						alert("�α��� �� �̿� �����մϴ�.");
						return;
					}
					
								
					$.ajax( 
							{
								url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=movie",									
								type : "GET" ,							
							}).done(function(data) {
						//���� ����� ���
						if (data == 'add') {
							var msg = '���ϱ� ��û';
							alert(msg);
						} else {
							alert("���ϱ� ���");
						}
					});
				})
				 
				 
				 /* �񵿱� ��Ŀ��� heart Ŭ���� �� �������� �ʴ� �ڵ� 
				 
				// $("span:contains('���ϱ�')" ).on("click" , function() {
				$(".glyphicon.glyphicon-heart").on("click" , function() {	
					
					 //var movieNo = $(this).next().val();		
					 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
	
					var movieNo = $(this).find('#scMovieNo').val();		
					var userId = $(this).find('#userId').val();			
					
					alert("movieNo: " + movieNo); 					
					alert("userId: " + userId); 
					
				
					//$(this).toggleClass($(this).find(".glyphicon glyphicon-heart-empty"));
					
					
					//$(this).replaceClass('.glyphicon glyphicon-heart','.glyphicon glyphicon-heart-empty');
					//$(this).toggleClass('glyphicon glyphicon-heart').toggleClass(".glyphicon glyphicon-heart-empty");
					
					
					$(this).removeClass('glyphicon glyphicon-heart').addClass('glyphicon glyphicon-heart-empty');
					//$(this).addClass('glyphicon glyphicon-heart-empty');
					
				
					 if (userId != null && userId.length !=0) {
						alert("userId: " + userId);
					} else {
						alert('�α����� �ʿ��� �����Դϴ�.\n�α��� �������� �̵��Ͻðڽ��ϱ�?');
						location.href="/user/loginUser.jsp";
					} 
					
					
					if(userId == null || userId == ''){
						alert("�α��� �� �̿� �����մϴ�.");
						return;
					}
					
								
					$.ajax( 
							{
								url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=movie",									
								type : "GET" ,							
							}).done(function(data) {
						//���� ����� ���
						if (data == 'add') {
							var msg = '���ϱ� ��û';
							alert(msg);
						} else {
							alert("���ϱ� ���");
						}
					});
				});	 */
			});
				 
	
				 
		//============= "����  Event ó��"  Event  ó�� =============	
		$(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("span:contains('����')" ).on("click" , function() {
				 self.location = "/booking/getScreenMovieList";	
			});	
		});
			
		
		//============= movieNo �� ��ȭ��������  Event  ó��(Click) =============	
		 $(function() {
					
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)").on("click" , function() {
				
 				 //alert( $(this).text().trim());
				 //var prodNoVal=	$("#prodNoValue").val();
				 //var movieNo=$(this).find("input[name='movieNo']").val();
				 //alert(movieNo);
				 self.location = "/movie/getMovie?movieNo="+$($(this).find('input')).val()+"&menu=managed";

			});
		
		 });

	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/topToolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���� �� ��ȭ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start //////F///////////////////////////////-->
	    <div class="row">
	    
	      <%--    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div> --%>
		    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		
		    	</p>
		    </div> 
	    
	       <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				 <%--   <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ȭ����</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>
					</select>
				  </div> --%>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				   		
				  <i class='glyphicon glyphicon-search' id="searchIcon" style="color:grey"></i>  &nbsp; 	
				  <i class='glyphicon glyphicon-volume-up' id="voidSearchIcon" style="color:grey"></i>	  
				
		
				  
				<!--   <button type="button" class="btn btn-default">�˻�</button> -->
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
    
  		<!-- 		
            <div class="container">
            <div class="container-fluid full-width">
                <div class="row-fluid">                   
                    
                    <span class="input-group-btn pull-right"><button class="btn btn-default pull-right" type="button">�˻�</button></span>
                    <input type="text" class="pull-right form-control" placeholder="�˻���" style="width:200px;" />
                    
                </div>
                </div>
            </div>	    	
		</div> -->
	
	  <br/>   <br/>   <br/>
	
	 <div>
		<div class="row">
		
			<c:set var="i" value="0"/>
				<c:forEach var="movie" items="${list}">
					<c:set var="i" value="${i+1 }"/>
						<div class="col-xs-6 col-md-4" >
						<a class='thumbnail' href="/movie/getMovie?movieNo=${movie.movieNo}&menu=search" style="text-decoration:none;">
							<img src="${movie.postUrl }">
						</a>
						
						<hr/>
								
								<span><strong>${movie.movieNm }</strong></span>
							    <span><li> ������ : ${movie.openDt } </li></span>	
							        
							    <div style="text-align: left;">
    						    
    						    </div>								
    							 
    							 <input type='hidden' name='test${movie.movieNo }'  value='${movie.movieNo }'>
    							
    							${movie.wishList.wishNo}
							    <span>
							    <c:set var="name" value="${movie.wishList.wishNo}"/>
	 								<c:if test="${name eq '0'}">
									     <i class='glyphicon glyphicon-heart-empty' id="${movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;"> 
									     	<input type='hidden' id='scMovieNo' 	 value="${movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	
									     </i> 						
								    </c:if>	
								    
								    <c:if test="${name ne '0'}">
									    <i class='glyphicon glyphicon-heart' id="${movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;">
									    	<input type='hidden' id='scMovieNo' 	 value="${movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	 
									    </i> 						
									</c:if>	
							   </span>                                                   

	                             &nbsp;&nbsp;

	                            <span>
	                            <input type='hidden' name='screenMovieNo'  value='"+val.movieNo+"'>	                                                  
	                            <i class='glyphicon glyphicon-phone-alt' id='reserve-ticket' style="color:#FB1D04; text-align : center; margin:0 auto;">���� </i>   
	                            </span>
	                         
	                             
                             <hr/>       
      
    						
					
						</div>					
				</c:forEach>
		
	</div>

	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	<!-- PageNavigation End... -->
	
</body>


</html>