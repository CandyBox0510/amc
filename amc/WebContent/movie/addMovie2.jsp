<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="com.amc.service.domain.User"%>

<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%> 
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<html lang="UTF-8">
	

<head>
   <meta charset="UTF-8">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-/1.7.1/css/bootstrap-datepicker.css" />
    
     
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/css/ui.jqgrid.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/jquery.jqgrid.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
  
 

 
 </head>
 
   
 
 

   
 <script type="text/javascript">
 

 
        $(document).ready(function(){
         	
        	
        	function delButton (cellvalue, options, rowObject) {
        		   return '<input type="button" onclick="delete('+cellvalue+')" value="DEL"/>'; 
        	 };
        	 
        	 
        	function UploadImage(response, postdata) {
        		

        		    var data = $.parseJSON(response.responseText);

        		    console.log("UploadImage called");
        		    if (data.success == true) {
        		        if ($("#file").val() != "") {
        		            ajaxFileUpload(data.id);
        		        }
        		    }  

        		    return [data.success, data.message, data.id];

        	}
        	
        	
        	function Result_From_Server(resp, postdata)
			{
        		
        		alert("Update is succefully");
				// you should return from server OK in sucess, any other message on error
				if(resp.responseText == "OK")
				{
					console.log("test");
				alert("Update is succefully")
				return [true,"",""]
				}
				else {
					console.log("test2");
				alert("Update failed")
				return [true,"",""]
				}
			}
        	
        	
	   
        	function ajaxFileUpload(id) 	{
        	
        	 console.log("ajaxFileUpload called");
        	
        		    $("#loading")
        		    .ajaxStart(function () {
        		        $(this).show();
        		    })
        		    .ajaxComplete(function () {
        		        $(this).hide();
        		    });

        		    $.ajaxFileUpload
        		    (
        		        {
        		            url: '@Url.Action("UploadImage")',
        		            secureuri: false,
        		            fileElementId: 'file',
        		            dataType: 'json',
        		            data: { id: id },
        		            success: function (data, status) {

        		                if (typeof (data.success) != 'undefined') {
        		                    if (data.success == true) {
        		                        return;
        		                    } else {
        		                        alert(data.message);
        		                    }
        		                }
        		                else {
        		                    return alert('Failed to upload logo!');
        		                }
        		            },
        		            error: function (data, status, e) {
        		                return alert('Failed to upload logo!');
        		            }
        		        }
        		    )          }     
        	 
        	
        	function setClickRowColor(gridNm, rowId){
	    	    var ids = $('#'+gridNm).getDataIDs();

        	    $.each(ids, function(idx){
        	        idx+=1;
        	        if(idx==rowId){
        	            $('#'+gridNm).setRowData(idx, false, {background:'#DDFFFF'});
        	        }else{
        	            $('#'+gridNm).setRowData(idx, false, {background:'#FFFFFF'});
        	        }
        	    });
        	}
       	 
        	function formatImage(cellValue, options, rowObject) {

        		
        		 alert("cellValue" + cellValue)
                 //var imageHtml = "<img src='images/" + cellValue + "' originalValue='" + cellValue + "' />";
                 //var imageHtml = "<img src='cellValue'/>";
                 
                 //var imageHtml = "<img src='../images/movie/tax1.jpg' originalValue='tax1.jpg'/>";
                 
                 var imageHtml = "<img src='cellValue'/>";
                  
                 return imageHtml;
            }

        
        	function pickdates(id){
        		jQuery("#"+id+"_movieEndDate","#movie_list").datepicker({dateFormat:"yy-mm-dd"});
        	}
   	
        	var getVaueByName = function (directors, colName) {
                var i, count = directors.length, item;
                
                console.log("directors.length", directors.length);
                
                for (i = 0; i < count; i += 1) {
                    item = directors[i];
                    
                	//console.log("item" + item.peopleNm);
                    
                    
                    if (item.colname === colName) {
                    	
                    	console.log("item" + item.peopleNm);
                        return item.peopleNm;
                    }
                    
                    return item.peopleNm; 
                }
                return '';
            };
        
                   
        
         $("#movie_list").jqGrid( 
        		{         			
        
            	// ajax 요청주소
                url:"/movie/json/getAPIMoiveList",
                caption : "영화 API 등록",
                // 요청방식
                mtype:"post",
                // 결과물 받을 데이터 타입
                datatype:"json",   
          
                // 그리드 높이
                height:"auto",
               
                // 컬럼명
                colNames:['영화CD','영화명','제작국가','상영마감','줄거리','트레일러'],
                // 컬럼 데이터(추가, 삭제, 수정이 가능하게 하려면 autoincrement컬럼을 제외한 모든 컬럼을 editable:true로 지정)
                // edittyped은 text, password, ... input type명을 사용
                     
                colModel:[
                          {name:'movieCd', key: true,index:'movieCd',align:"left",sorttype:"int",width:90, sortable:true,editable:true},
                          {name:'movieNm', index:'movieNm', align:"left",width:90, sortable:true, editable:true},                       
   	                      {name:'nationAlt', index:'nationAlt',align:"left", width:90,sortable:true, editable:true},              
                          {name:'movieEndDate', index:'movieEndDate',align:"left",                         	    
                        	      editable:true, editoptions:{size:10, 
                                  dataInit:function(el){ 
                                        $(el).datepicker({dateFormat:'yy-mm-dd'}); 
                                  }, 
                                  defaultValue: function(){ 
                                    var currentTime = new Date(2017,10,1); 
                                    var month = parseInt(currentTime.getMonth() + 1); 
                                    month = month <= 9 ? "0"+month : month; 
                                    var day = currentTime.getDate(); 
                                    day = day <= 9 ? "0"+day : day; 
                                    var year = currentTime.getFullYear(); 
                                    return year+"-"+month + "-"+day; 
                                  } 
                                }                	     
                          },                   
                          
                          //{name:'postUrl', index:'postUrl', width:60, align:'center',
                          // formatter:formatImage},                        	 
                          
                          
                        
                          {name:'synopsis', index:'synopsis',align:"left", width:90,sortable:true, editable:true, 
                        	     edittype: "textarea",editoptions: { rows: 3, wrap: "off",style: 'overflow-x: hidden',}},                     
                          {name:'trailer', index:'trailer',align:"left", width:90,editable:true}
                          ],
                          
                          
                       
         
         	  // 네비게이션 도구를 보여줄 div요소
                hidegrid : true,                        // grid 전체를 접는 오른쪽 상단 아이콘 disable
            	beforeSelectRow : function(invid) {                // 선택한 로우 색상 변경
                  setClickRowColor('movie_list', invid);
                    return true;
               }, 
               
          

               	sortable: true,
                sortname: 'movieCd',
                pager:"#pager777",
            	rowNum:10,
               	//rowList:[10,20,30],             
                autowidth:true,
                // 전체 레코드수, 현재레코드 등을 보여줄지 유무
                multiselect: true,
                viewrecords:true,
                
                // 추가, 수정, 삭제 url
                editurl: "/movie/json/addMovie",    
    
                mtype:"post",
                // 결과물 받을 데이터 타입
                datatype:"json",
          
                //sortable: true 
                sortorder: "desc",
                loadonce : true,
               
                jSonReader : {
                	root:"rows",
                	page:"page",
                	total:"total",
                	records:"records",
                	repeatitems:false,
                	cell:"cell",
                	id:"movieCd"
                },
                 
               	loadComplete: function(data) {
          			// alert ("records="+$("#movie_list").getGridParam("records"));
                },  
                
                
          		loadError: function (jqXHR, textStatus, errorThrown) {
                    alert('HTTP status code: ' + jqXHR.status + '\n' +
                          'textStatus: ' + textStatus + '\n' +
                          'errorThrown: ' + errorThrown);
                    alert('HTTP message body (jqXHR.responseText): ' + '\n' + jqXHR.responseText);
                },

        		});
         
        
  
         
	  // 네비게시션 도구 설정
	  
	 /*  $("#movie_list").jqGrid(
	         		"navGrid",
	                "#pager777",
	                
	                
	                {search:true, edit:true, add:true, del:true},
	               	    
	                
	                {   //EDIT
	                	
	               	    reloadAfterSubmit: true,
	                	closeAfterAdd: true,
	                	closeAfterEdit: true, reloadAfterSubmit: true,
	                    closeOnEscape: true,//Closes the popup on pressing escape key
	                    closeAfterEdit: true,
	                    afterSubmit: function (response, postdata) {
	                    	//alert("성공적으로 입력되었습니다.");
	                    	alert('After Submit \n' +'statusText: '+ response.statusText);
	                    }
	                 }
	              
			  );
		  }) 
		   */
  	    
	      // 네비게시션 도구 설정
	  $("#movie_list").jqGrid(
	         		"navGrid",
	                "#pager777",
	                 
	                {search:true, edit:true, add:true, del:true},
	                
	                {   //EDIT
	               	    reloadAfterSubmit: true,
	                	closeAfterAdd: true,
	                	closeAfterEdit: true, reloadAfterSubmit: true,
	                    closeOnEscape: true,//Closes the popup on pressing escape key
	                    closeAfterEdit: true,
	                    
	                 	afterSubmit: function (response, postdata) {
	                 		
	                 		if (response.statusText = "OK")
	                    	alert("성공적으로 입력되었습니다 !!!" + response.statusText); 
	                 		else 
	                 		alert("오류 발생 " +response.statusText);
                   
	                    }
	                 
	                
	                 }
	              
			  );
		  }) 
		  
		  
    </script>

<body>
<div class="wrapper">
    	<c:set var="who" value=""/>
    	<c:if test="${sessionScope.user.role ne 'admin'}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user.role eq 'admin'}">
    		<c:set var="who" value="admin"/>	
    	</c:if>
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
   		
</div>


<form id="uploadForm" method="POST">  
	<br/> <br/>  <br/> <br/> 
       
	
	
	<table id="movie_list"></table>    
    <div id="pager777" class="scroll" style="text-align:center"></div>
    <div id="load_time" class="scroll" style="text-align:center"></div>
 

</form>
</body>
</html>

