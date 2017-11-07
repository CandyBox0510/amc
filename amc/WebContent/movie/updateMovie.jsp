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


<html lang="ko">
	
<head>

  
	
</head>
<body>

<form id="updateMovie" enctype="multipart/form-data" method="POST">  
<input type="hidden" name="movieNo" value="${movie.movieNo}"/>

 		 <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
	  

<div class="container">

		<br/> <br/>
	
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
	  		<input 	type="date" value="${movie.openDt}" name="openDt" class="ct_input_g" 
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
		
	<!-- 	<div class="row">
	  		<div class="col-md-2 text-left ">
	  			<button type="button" id="updateMoviebtn"  class="btn btn-primary">����</button>
	  			
	  		</div>
	  		<div class="col-md-2 text-left ">
	  			<button type="button" id="deleteMoviebtn"   class="btn btn-primary">����</button>
	  		</div>
		</div> -->
		
		   <div class="btn-demo">
		   	<div class="col-md-2 text-left ">
                <a href="#" id="updateMoviebtn" class="btn btn-md btn--info">����</a>
           	</div>
           </div>
           <div class="btn-demo">
       	   	<div class="col-md-2 text-left ">
                <a href="#" class="btn btn-md btn--danger">����</a>
           	</div>
           </div>      
        
		
		<br/>
		
 	</div>
 </div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
 	     
	<div class="bottom low ">
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />     
		<!-- ToolBar End /////////////////////////////////////-->
	</div>

</form>

		<script src="/js/custom.js"></script>

</body>

   
  <!--  ///////////////////////// JavaScript ////////////////////////// -->   
     	
   	<script type="text/javascript">
	
   	
	   	function openHistory(){
	   		popWin = window.open("../openHistory.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	   	}
	   	
	   	function unifiedSearch(){
	   		//POST�� �ٲ����
	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").submit();
	   		/* $(self.location).attr("href","/cinema/unifiedSearch"); */
	   	}
   	
	
	</script>  



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

      html{
 	     height: auto;
      }
      
</style>	   

<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( ".btn.btn-md.btn--info" ).on("click" , function() {
			 	//alert("���� ��ư Ŭ�� Ȯ��");
				//Debug..
				// <!-- <a href="javascript:history.go(-1)"></a> -->
				fncUpdateMovie()
		});
	});	



	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( ".btn.btn-md.btn--danger" ).on("click" , function() {
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

</html>

