<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page contentType="text/html; charset=EUC-KR" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>


    
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    	<!-- Stylesheets -->    
    	<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />
        
        <!--  얘네 쓰면 글씨크기 이상해짐(원래 우리가 가지고있던 css) -->
       <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
		<!--  -----------------------------------------------------------------------  -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
		
		<!-- 우리가 가지고 있던 javaScript (현재 별문제 안됨)-->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        
        
        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>
        
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
    
    $(document).ready(function(){
    	
    	 
     	$( function() {
 			$("#userId").focus();
 			
 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 			$("#login").on("click" , function() {
 				var id=$("#userId").val();
 				var pw=$("input:password").val();
 				
 				if(id == null || id.length <1) {
 					alert('ID 를 입력하지 않으셨습니다.');
 					$("#userId").focus();
 					return;
 				}
 				
 				if(pw == null || pw.length <1) {
 					alert('패스워드를 입력하지 않으셨습니다.');
 					$("#password").focus();
 					return;
 				}
 				
 				$.ajax( 
 						{	
 							url : "/user/json/loginUser",
 							method : "POST" ,
 							async : false,
 							headers : {
 								"Accept" : "application/json",
 								"Content-Type" : "application/json"
 							},
 							data : JSON.stringify({
 								userId : id,
 								password : pw
 							}),
 							success : function(JSONData , status) {

 								//Debug...
 								//alert(status);
 								//alert("JSONData : \n"+JSONData);
 								//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
 								//alert("JSONData : "+ JSONData );
 								//alert("status : "+ status );
 									//alert(JSONData.role);
 									console.log(JSONData.userId);
 									
 									if( JSONData.role == 'not' ){
 										alert("탈퇴한회원...");
 									}else if( JSONData !='' ){
 									//$(window.parent.document.location).attr("href","/index.jsp");
 									$(self.location).attr("href","/index.jsp");
 									
 									}else{
 										alert("아이디 , 패스워드를 확인하시고 다시 로그인1...");
 									}
 								},
 							error:function(request,status,error){
 								//alert(error);
 								//alert("아이디 , 패스워드를 확인하시고 다시 로그인2...");
 						    }
 					}); 
 				
 			});
 		});	
     	
     	
   	
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
		
	
    
</head>

<body>
    
    
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        
      



    <div class="container">
                 <!-- Search bar -->
 			<div class="col-sm-12">
 			
                <h1 class="page-heading"> 영화 등록  </h1> 
                               
				
			      
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
	</div>
        

<form id="uploadForm" method="POST">  
	<br/> <br/>  <br/> <br/> 
       
	
	
	<table id="movie_list"></table>    
    <div id="pager777" class="scroll" style="text-align:center"></div>
    <div id="load_time" class="scroll" style="text-align:center"></div>
    
    <br/>
    <br/>
    <br/> 
    <br/> 
    <br/> 
    <br/> 
    <br/> 
    <br/>
    <br/>
     
         
    <div class="bottom low ">
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
	</div>
 
</form>  


		<!--  Select Mobile menu  둘다있어야지 search가능함!!! 하단에 있어야지 생김 (이유모름)-->
        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
		
		
        <!-- Custom 이게있어야지 스크롤내릴시top버튼있음!!!!!!!!!!! -->
        <script src="/js/custom.js"></script>
		<!-- ------------------------------------  -->
		
	
		

</body>

<style>
    
</style>	

</html>
