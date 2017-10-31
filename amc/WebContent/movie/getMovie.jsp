<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page contentType="text/html; charset=EUC-KR" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>
<head>
    
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 

		  <!-- Swiper slider -->
        <link href="/css/external/idangerous.swiper.css" rel="stylesheet" />
        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

		
		<!-- 우리가 가지고 있던 javaScript (현재 별문제 안됨)-->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
		
         <script src="/js/external/modernizr.custom.js"></script> 
         
         <script type="text/javascript">
         window.fbAsyncInit = function() {
        	    FB.init({
        	     // appId      : '688547171338913',
        	      xfbml      : true,
        	      version    : 'v2.10'
        	    });
        	    FB.AppEvents.logPageView();
        	  };


        	  (function(d, s, id){
        	     var js, fjs = d.getElementsByTagName(s)[0];
        	     if (d.getElementById(id)) {return;}
        	     js = d.createElement(s); js.id = id;
        	      js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=688547171338913';
        	     fjs.parentNode.insertBefore(js, fjs);
        	   }(document, 'script', 'facebook-jssdk'));
        	  
        	  function posting() {
        		  FB.ui({
        			    method: 'share_open_graph',
        			    action_type: 'og.shares',
        			    action_properties: JSON.stringify({
        			    	   object:{
        		                    
        		                    'og:title': 'AMC',
        		                    'og:description': '영화 '+movieNm+'상세보기',
        		                    'og:url':  'http://192.168.0.32:8080/movie/getMovie?movieNo='+movieNo+'&menu=search',
        		              
        		                    'og:image': 'http://192.168.0.32:8080/images/common/AMC_Logo.png'
        		                    
        		                }
        			      }),
        			 
        			    mobile_iframe: true,
        			  
        			  }, function(response){});
        			
        	}
        	  

        		function addOpenAlarm() {
        			$.ajax(
        							{
        								url : "/alarm/json/switchOpenAlarm?screenContent.screenContentNo="+screenContentNo+"&user.userId="
        										+ "${sessionScope.user.userId}", //서버로 알림 체크 요청
        										
        								type : 'GET',
        							}).done(function(data) {
        						//정상 통신인 경우
        						if (data == 'add') {
        							var msg = '오픈알림이 신청되었습니다.';
        							/* msg += '\n무슨영화 : ' + movie정보;
        							 */
        							alert(msg);
        						} else {
        							alert("오픈알림이 취소되었습니다.");
        						}
        					});
        		} //end of addOpenAlarm function

        		
        	  
         function fncGetPageList(currentPage) {
        	 

		        var movieNo = $("input[name='movieNo']").val();
		        
		   
		        $.ajax({
				url : "/movie/json/getMovieCommentList/",
				type : 'POST',

				headers : {

					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					search : {
						currentPage : currentPage
						},
					movie : {
							movieNo : movieNo
					}
					

				}),
				dataType : "json",

				success : function(JSONData, status) { 					
					console.log("fncGetPageList()");
					console.log("success"+JSON.stringify(JSONData.data));
		            console.log("ㅇ난녕" );

             	   //console.log("fncMovieCommentList() JSONData "+ JSONData.movieComment);
             	   var result = JSONData;
             console.log(result);console.log(result.length);
             	   userId = $("input[name='userId']").val();
             	   userRole = $("input[name='userRole']").val();
             	   
         
             	   
             	 
             	  
             	
             	  
     
             	   //displayValue ='<div class="comment"> <div class ="tatalCount">전체  ${resultPage.totalCount } 건</div> '
             		displayValue =''
             	   $.each(result, function(idx, val) {
             		
                 	   displayValue += '<p class="comment__user">'+val.user.userId+'</p>'+
                 	    '<p class="comment__movieComment" id="movieComment'+val.movieCommentNo+'" >'               
                 	   if(val.blindCommentFlag =='Y'){
                 		   displayValue +=' <span style="color:gray">블라인드 처리된 게시글입니다.</span>'
                 		   if(userRole == 'admin'){
                 			   displayValue +='<br> '+val.movieComment
                 		   }
                 	   }else{
                 		   displayValue +=val.movieComment
                 	   }
                 	    displayValue+= '</p>'+
                 	   ' <span class="comment__regDate">'+val.movieCommentRegDate+' </span>'

                 	   
                 	   if(userId == val.user.userId || userRole == 'admin'){
                 		   displayValue += '<span class="comment__update" >'
                 		   if(val.blindCommentFlag =='N'){
                 			   displayValue +='<i class="fa fa-eraser">  </i>'
                 		   }
                 		   displayValue +=  '<input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'"> '+
                     	   '<input type="hidden" id="movieComment" value="'+val.movieComment+'"></span>'+
                            '<span class="comment__delete" ><i class="fa fa-trash-o">  </i>'+
                            '<input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'"></span>'
                            if(userRole == 'admin'){
                         	   displayValue += '<span class="comment__blind" >'+
                                ' <input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'">'+
                                '<input type="hidden" id="blindCommentFlag" value="'+val.blindCommentFlag+'">'
                                if(val.blindCommentFlag =='Y'){
                             	   displayValue +=  '<i class="fa fa-eye"> </i>'
                                }else{
                             	   displayValue +=  '<i class="fa fa-eye-slash"> </i>'
                                }
                         	   displayValue += ' </span>'
                            }
                           
                 	 	}
                 	   displayValue += ' <hr>'
                 	})          	
                 	//displayValue +=' </div>'
                  	                    	   
                         $(".comment").append(displayValue);
                 	
                         currentPage = parseInt(currentPage) +1;
                   		
      
             		 
             		 if(result.length !=10){
             			currentPage = parseInt(currentPage) -1;
                  		$(".comment-more").remove();
                  	
             			 
             		 }
                        
             		$("#currentPage").val(currentPage);

				}
 			}) 

    			
    			
    			
		        //$("form").attr("method", "POST").attr("action", ").submit();
		    }
         
         
         function fncGetMovieComment() {
        	 $("div[name='update"+$("input[name='movieCommentNo2']").val()+"']").html($("input[name='movieComment2']").val());
        	 
        	 	
				console.log(movieCommentNo);
				console.log(movieComment);
				
				var dispaly =  '<div id="comment-form" class="movieComment" name="update'+movieCommentNo+'">'+
				'<input type="hidden" id="movieCommentNo" value="'+movieCommentNo+'">'+
				'<textarea class="movieComment__text" id="updateMovieCommentText" value="">'+movieComment+'</textarea>'+
				'<button type="submit" class="btn btn-md btn--shine movieComment__btn" id="updateButton">수정</button></div>'
			//movieComment${movieComment.movieCommentNo }
			$("input[name='movieCommentNo2']").val(movieCommentNo);
			$("input[name='movieComment2']").val(movieComment);
			 $("#movieComment"+movieCommentNo).html(dispaly);

		}

         function fncAddMovieComment() {
        	
        		 var movieComment = $("#addMovieCommentText").val();          	
            	 if(movieComment == ""){
            		 alert("감상평을 입력해 주세요");
            		 return;
            	 }
            		 $.ajax({
            				url : "/movie/json/addMovieComment/",
            				type : 'POST',

            				headers : {

            					"Content-Type" : "application/json"
            				},
            				data : JSON.stringify({
            					movie : {
            						movieNo : movieNo
            					},
            					user : {
            						userId : userId
            					},
            					movieComment : movieComment

            				}),
            				dataType : "json",

            				success : function(JSONData, status) { 					
            					console.log("fncAddMovieComment()");
            					$("#addMovieCommentText").val(null);
            					fncMovieCommentList()
            				}
            			}) 
    	     }
		 function fncMovieCommentList() {
        	 
        	 var movieNo = $("input[name='movieNo']").val();
        	 
        	 
        	   $.ajax({
                   url: "/movie/json/getMovieCommentList/" + movieNo,
                   method: "GET",
                   dataType: "json",
                   headers: {
                       "Accept": "application/json",
                       "Content-Type": "application/json"
                   },
                   success: function(JSONData, status) {
                	   //console.log("fncMovieCommentList() JSONData "+ JSONData.movieComment);
                	   var result = JSONData;
                
                	   userId = $("input[name='userId']").val();
                	   userRole = $("input[name='userRole']").val();
                	   
                	   $(".comment-sets").html("");
                	   
                	   displayValue ='<div class="comment">'
                		
                	   $.each(result, function(idx, val) {
                		
                    	   displayValue += '<p class="comment__user">'+val.user.userId+'</p>'+
                    	    '<p class="comment__movieComment" id="movieComment'+val.movieCommentNo+'" >'               
                    	   if(val.blindCommentFlag =='Y'){
                    		   displayValue +=' <span style="color:gray">블라인드 처리된 게시글입니다.</span>'
                    		   if(userRole == 'admin'){
                    			   displayValue +='<br> '+val.movieComment
                    		   }
                    	   }else{
                    		   displayValue +=val.movieComment
                    	   }
                    	    displayValue+= '</p>'+
                    	   ' <span class="comment__regDate">'+val.movieCommentRegDate+' </span>'

                    	   
                    	   if(userId == val.user.userId || userRole == 'admin'){
                    		   displayValue += '<span class="comment__update" >'
                    		   if(val.blindCommentFlag =='N'){
                    			   displayValue +='<i class="fa fa-eraser">  </i>'
                    		   }
                    		   displayValue +=  '<input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'"> '+
                        	   '<input type="hidden" id="movieComment" value="'+idx+':'+val.movieComment+'"></span>'+
                               '<span class="comment__delete" ><i class="fa fa-trash-o">  </i>'+
                               '<input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'"></span>'
                               if(userRole == 'admin'){
                            	   displayValue += '<span class="comment__blind" >'+
                                   ' <input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'">'+
                                   '<input type="hidden" id="blindCommentFlag" value="'+val.blindCommentFlag+'">'
                                   if(val.blindCommentFlag =='Y'){
                                	   displayValue +=  '<i class="fa fa-eye"> </i>'
                                   }else{
                                	   displayValue +=  '<i class="fa fa-eye-slash"> </i>'
                                   }
                            	   displayValue += ' </span>'
                               }
                              
                    	 	}
                    	   displayValue += ' <hr>'
                    	})          	
               
                    	displayValue +=' </div><div class="comment-more">'+
                            '<a href="#" class="watchlist">Show more comments</a>'
                            +'</div>'
                     	                    	   
                            $(".comment-sets").html(displayValue);
          	
                   }

               });
 
		}
		 
		 function fncUpdateMovieComment() {
     	
				
				
				$.ajax({
					url : "/movie/json/updateMovieComment/",
					type : 'POST',

					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						movieComment : movieComment,
						movieCommentNo : movieCommentNo
					}),
					dataType : "text",

					success : function(JSONData, status) {
						 
						var	display ='<input type="hidden" id="movieComment" value="ㅇ나녕">'+movieComment;

						//$("#movieComment"+movieCommentNo).html(dispaly);
							
							
							$("#movieComment"+movieCommentNo).html(movieComment);
							
							

							$("#movieComment2").val(movieComment);
							
							fncMovieCommentList()
					}
				})
			
		}
 
 
		 function fncDeleteMovieComment() {
				
				 
				 if(confirm("정말 삭제하시겠습니까?") ==true){
					 $.ajax({
							url : "/movie/json/deleteMovieComment/"+ movieCommentNo,
							type : 'GET',
		
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
		
							dataType : "json",
		
							success : function(JSONData, status) {
								console.log("fncDeleteMovieComment() JSONData "+ JSONData);
								 fncMovieCommentList()
							}
						})
				 }else{
					 return;
				 }
		}
		 
		function fncBlindCommentFlag() {

        		 blindComment = "";
        		 if(blindCommentFlag == 'Y'){
        			 blindComment = '취소 '
        		 }
     			
     			console.log("fncBlindCommentFlag()의 movieCommentNo ==> "+ movieCommentNo)
     			console.log("fncBlindCommentFlag()의 blindCommentFlag ==> "+ blindCommentFlag)

     				console.log('dddd');
     				if(confirm("정말 블라인드 처리를 "+blindComment+"하시겠습니까?") == true){
     					
     					$.ajax({
     						url : "/movie/json/blindMoiveComment",
     						type : 'POST',
     	
     						headers : {
     							"Accept" : "application/json",
     							"Content-Type" : "application/json"
     						},
     						data : JSON.stringify({
     	
     							blindCommentFlag : blindCommentFlag,
     							movieCommentNo : movieCommentNo
     	
     						}),
     						dataType : "text",
     	
     						success : function(JSONData, status) {
     							console.log("fncAddMovieComment()");
     							 fncMovieCommentList()
     						}
     					})
     	
     				}else{
     					return;
     				}
     			
			
		}
		
		

         $(document).ready(function() {
         	movieNo = $("input[name='movieNo']").val();
     		userId = $("input[name='userId']").val();
     		screenContentNo = $("input[name='screenContentNo']").val();
     		movieNm = $("input[name='movieNm']").val();
     		
     		$(document).on("click", "#addButton", function () {
     			fncAddMovieComment();
     			fncMovieCommentList();
			})
			
			$(document).on("click", ".comment__delete", function () {
				 movieCommentNo=  $("#movieCommentNo",$(this)).val();				 
				fncDeleteMovieComment();
     			fncMovieCommentList();
			})
			
			$(document).on("click", ".comment__blind ", function () {
				movieCommentNo=  $("#movieCommentNo",$(this)).val();
       		 	blindCommentFlag=  $("#blindCommentFlag",$(this)).val();	 
				 fncBlindCommentFlag();
     			fncMovieCommentList();
			})
			
			$(document).on("click", ".comment__update", function () {
				
				movieCommentNo=  $("#movieCommentNo",$(this)).val();
       		 	movieComment=  $("#movieComment",$(this)).val();	 
       		 	
       		 	fncGetMovieComment();
		
			})
			$(document).on("click", ".comment-more", function () {
				currentPage = $("#currentPage").val();
				
				
				//alert(currentPage);
				
				fncGetPageList(currentPage);
			})
			
			$(document).on("click", "#updateButton", function () {
			
       		 	movieCommentNo = $(this).parent().find("#movieCommentNo").val();
       		 	movieComment =  $(this).parent().find("#updateMovieCommentText").val();
       		 	fncUpdateMovieComment();
		
			})
			
			$("button[name='booking']").on("click", function() {
				
				$(self.location).attr("href","/booking/getScreenMovieList");
		})
		
		$("button[name='wish']").on("click", function() {
			if(userId == ""){
				alert('로그인 후 이용가능합니다')
			}else{
				//$(self.location).attr("href","/booking/getScreenMovieList");

			}
		})

 		$("button[name='ticketOpen']").on("click", function() {
			if(userId == ""){
				alert('로그인 후 이용가능합니다')
			}else{
				addOpenAlarm()
			}
		})  
		
			

         });
            
        </script>
        
        
        <style type="text/css">
        
        
        .your-class img{
			height : calc(50vh - 100px);
			width : auto;
			margin : 0 auto;
		}
		.slick-prev:before,
		.slick-next:before{
			color : #f06060;
		}


        
        
        	.movieComment {
			  margin-bottom: 40px;
			}
			.movieComment .movieComment__text {
			  width: 100%;
			  min-height: 78px;
			  padding: 8px 19px;
			  -webkit-border-radius: 3px;
			  -moz-border-radius: 3px;
			  border-radius: 3px;
			  background-color: #ffffff;
			  border: solid 1px #dbdee1;
			  font-size: 13px;
			  color: #b4b1b2;
			}
			.movieComment .movieComment__info {
			  margin-top: 19px;
			  font: 13px 'Roboto', sans-serif;
			  color: #969b9f;
			  display: inline-block;
			}
			.movieComment .movieComment__btn {
			  float: right;
			  margin-top: 9px;
			}
		
      		body {
				padding-top: 80px;
			}	
			 .comment .comment__user {
				  font-size: 18px;
				  margin-bottom: 20px;
				  font-weight: bold;
				  position: relative;
		   		overflow: hidden;
			}
			
			.comment .comment__movieComment {
			  font-size: 14px;  
			   line-height: 14px;
			}
			
			.comment .comment__regDate {
			  font-size: 12px;
			  color: #969b9f;
			    line-height: 14px;
			}
		
        </style>

</head>

<body>
<jsp:include page="/layout/topToolbar.jsp" />
	
    <div class="wrapper">
    	<div class="container">
    		<div>
			<div class="page-header">
				<h2 class=" text-info">${movie.movieNm }</h2>
			</div>
	
			<div class="row ">

				<!--  <div class="col-xs-1 col-md-2"></div> -->

				<div class="col-md-2">
					<div>
						<br> <img src="${movie. postUrl}">
					</div>
				</div>

				<div class="col-md-10">
					<div>
						<h3 class=" text-info"></h3>
					</div>
					<div class="row">
						<div class="col-md-2">개봉일</div>
						<div class="col-md-10">
							<input type="hidden" name='openDt' value="${movie.openDt }">${movie.openDt }</div>
					</div>
					<div class="row">
						<div class="col-md-2">감독</div>
						<div class="col-md-10">${movie.directors }</div>
					</div>
					<div class="row">
						<div class="col-md-2">배우</div>
						<div class="col-md-10">${movie.actors }</div>
					</div>
					<div class="row">
						<div class="col-md-2">장르</div>
						<div class="col-md-10">${movie.genres }</div>
					</div>
					<div class="row">
						<div class="col-md-2">러닝타임</div>
						<div class="col-md-10">${movie.showTm }분</div>
					</div>
					<div class="row">
						<div class="col-md-2">관람등급</div>
						<div class="col-md-10">${movie.watchGradeNm }</div>
					</div>
					<br>
					<div class="row center-block col-md-12" >
						&emsp;&emsp;
						<div id='wishAfter'></div>
						<button class="btn btn-link btn-lg" name="wish" ><h3><i class="glyphicon glyphicon-heart-empty" id="heartempty" style="color:#f06060; text-align : center; margin:0 auto;"></i></h3></button>
						<button class="btn btn-pinterest" style="width:100px" name="booking">예매하기</button>
						<button class="btn btn-facebook" style="width:100px"  onClick="javascript:posting()"  ><i class="fa fa-facebook"> &nbsp; </i>공유하기</button>
						<c:if test="${screenContent.screenContentNo != 0 }">
							<button  class="btn btn-vimeo"     name = "ticketOpen">티켓오픈알림</button><!-- -->
						</c:if>						
					</div>
					
				</div>
				<!--  <div class="col-xs-1 col-md-2"></div> -->
			</div>
		</div>
		<hr>

		<br>
		<div class="col-md-12" style="margin-bottom: 50px">
			<div
				style="border: 1px solid black; border-radius: 0.5em; padding: 10px;">
				<h2 class="page-heading">줄거리 </h2>
				<div>${movie.synopsis }</div>
			</div>
			<br>
			<div		style="border: 1px solid black; border-radius: 0.5em; padding: 10px;">
				
				<h2 class="page-heading">스틸컷 </h2>

				
					<c:if test="${movie.steelCut1 !=  null}">
					
				
						<div class="center-block your-class" style="width:800px">
			   					<div >
			 					 	<div class="image center-block "  ><img  src="/images/movie/${movie.steelCut1 }" /></div>
			 					</div>			 				
			 				<c:if test="${movie.steelCut2 != null }">
								<div>
									<div class="image"><img class="steelCut" src="/images/movie/${movie.steelCut2 }"/></div>
								</div>
							</c:if>	
							<c:if test="${movie.steelCut3 != null }">
								<div>
									<div class="image"><img class="steelCut" src="/images/movie/${movie.steelCut3 }"/></div>
								</div>
							</c:if>				
						</div>
						
	
					 </c:if> 
					  
					  
				<div></div>
			</div>
			<br>
			<div
				style="border: 1px solid black; border-radius: 0.5em; padding: 10px;">
				<h3>트레일러</h3>
				<div></div>
			<p align="middle"><iframe  width="800" height="500" src="${movie.trailer }" frameborder="0" allowfullscreen></iframe></p>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-3'>			
			<h2 class="page-heading">예매자 성별 차트 </h2>
				
				<canvas id="genderChart" width="400" height="400"></canvas>
			</div>
			<div class='col-md-3'>
			<h2 class="page-heading">예매자 나이 차트 </h2>
				
				<canvas id="ageChart" width="400" height="400"></canvas>
			</div>
			<div class='col-md-6'>
				<h2 class="page-heading"><span class="fa fa-twitter" id='twitterSearch' > </span>  ${movie.movieNm}  실시간 트위터 검색</h2>
			<iframe id="realTimeSearch" src="http://192.168.0.10:1337/${movie.movieNm }" frameborder = 0 >		 
					  <p>Your browser does not support iframes.</p>
			</iframe>
			
			</div>
		</div>
    	</div>
    
		
		

        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
              

                <div class="post">
                    <div class="post__preview">
                        <div class="swiper-container">
                        </div>
                    </div>
                </div>


               
                 <h2 class="page-heading">감상평 </h2>

                <div class="comment-wrapper">
                    <div id="comment-form" class="movieComment">
                    	<c:if test="${user.userId !=null}">
                        <textarea class="movieComment__text" id="addMovieCommentText" placeholder='부적절한 글은 블라인드 처리 될 수 있습니다.'></textarea>
                        </c:if>
                        
                        <c:if test="${user.userId ==null}">
                        <textarea class="movieComment__text" id="addMovieCommentText" placeholder='로그인 후 이용해주세요' readonly="readonly"></textarea>
                       
                        </c:if>
                         <button type='submit' class="btn btn-md btn--danger movieComment__btn" <c:if test="${user.userId ==null}">disabled="disabled"</c:if> id="addButton">등록</button>
                  
                    </div>

                    <div class="comment-sets">	
                    	

                        <div class="comment">           
                        	   
	                        <c:set var="i" value="0" />
							<c:forEach var="movieComment" items="${list }">
							<c:set var="i" value="${i+1 }" />
							
							<p class="comment__user"> ${movieComment.user.userId }</p>
							
                            <p class="comment__movieComment" id="movieComment${movieComment.movieCommentNo }" >
                            <c:if test="${movieComment.blindCommentFlag.trim() == 'Y'}">
                            <%-- <input type="hidden" id="movieComment" value="${movieComment.movieComment }"> --%>
                            <span style="color:gray">블라인드 처리된 게시글입니다.</span>
	                            <c:if test="${user.role == 'admin'}">
	                            <br> ${movieComment.movieComment }
	                            </c:if>
                            </c:if>
                            <c:if test="${movieComment.blindCommentFlag.trim() == 'N'}">
                            <span id='test'>${movieComment.movieComment }</span>
                            </c:if>
                            </p>
                            <span class="comment__regDate">${movieComment.movieCommentRegDate }</span>
                            <c:if test="${user.userId == movieComment.user.userId || user.role == 'admin'}">
	                          
	                            <span class="comment__update" >
	                            <c:if test="${movieComment.blindCommentFlag.trim() == 'N'}"><i class="fa fa-eraser"></i>  </c:if>
	                            <input type="hidden" id="movieCommentNo" value="${movieComment.movieCommentNo }">
	                            <input type="hidden" id="movieComment" value="${movieComment.movieComment }">
	                            </span>
	                       
	                            <span class="comment__delete" ><i class="fa fa-trash-o"></i><input type="hidden" id="movieCommentNo" value="${movieComment.movieCommentNo }"></span>
		                        <c:if test="${user.role == 'admin'}">
		                        <span class="comment__blind" >
		                        <input type="hidden" id="movieCommentNo" value="${movieComment.movieCommentNo }">
		                        <input type="hidden" id="blindCommentFlag" value="${movieComment.blindCommentFlag }">
		                            <c:if test="${movieComment.blindCommentFlag.trim() == 'Y'}">             
		                            	<i class="fa fa-eye"></i>             	
		                            </c:if>
		                            <c:if test="${movieComment.blindCommentFlag.trim() == 'N'}">
		                            	<i class="fa fa-eye-slash"></i>
		                           	</c:if>
		                        </span>
		                        </c:if>
                           	</c:if>
                            <hr>
							</c:forEach>
							<div id="append"></div>
                        </div>

                        <div class="comment-more">
                            <a href="#" class="watchlist">Show more comments</a>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <div id="hidden">
				<input type="hidden" name='movieNm' value="${movie.movieNm }">
				<input type="hidden" name='movieNo' value="${movie.movieNo }">
				<input type="hidden" name='userId' value="${user.userId }">
				<input type="hidden" name='userRole' value="${user.role }">
				<input type="hidden" name='movieComment2' value=""> 
				<input type="hidden" name='movieCommentNo2' >
				<input type="hidden" name='screenContentNo' value="${screenContent.screenContentNo }">
			
				<input type="hidden" name='femaleCnt' value="${movie.femaleCnt}">
				<input type="hidden" name="maleCnt" value="${movie.maleCnt}" />
				<input type="hidden" name="age10s" value="${movie.age10s}" />
				<input type="hidden" name="age20s" value="${movie.age20s}" />
				<input type="hidden" name="age30s" value="${movie.age30s}" />
				<input type="hidden" name="age40s" value="${movie.age40s}" />
				<input type="hidden" name="age50s" value="${movie.age50s}" />
				<input type="hidden" name="age60s" value="${movie.age60s}" />
				<input type="hidden" name="age60sMore" value="${movie.age60sMore}" />
			
			
				<form>
					<input type="hidden" id="currentPage" name="currentPage" value="2" />
				</form>
			</div>
        
        
    </div>



    <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>

        <!-- Swiper slider -->
        <script src="/js/external/idangerous.swiper.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Share buttons -->
        <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525fd5e9061e7ef0"></script>



        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>
        <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
        <script type="text/javascript">
        

        var ctx1 = document.getElementById("genderChart").getContext('2d');
        var femaleCnt = $("input:hidden[name='femaleCnt']").val();
        var maleCnt = $("input:hidden[name='maleCnt']").val();
        console.log(femaleCnt)
        console.log(maleCnt)
        var genderData = {
        	
        	
        	    datasets: [{
        	        data: [
        	               maleCnt, femaleCnt 
        	        ],	       
        	        backgroundColor : [
        	                           'rgb(54, 162, 235)',
        	                           'rgb(255, 99, 132)'
        	             	    ],	             	    
        	             	    borderColer : [
        	             			'rgb(255, 99, 132)',
        	             			'rgb(54, 162, 235)'         
        	             	    ]
        	    }],

        	    // These labels appear in the legend and in the tooltips when hovering different arcs
        	    labels: [
        	        '남자',
        	        '여자'
        	    ]
        	    
        	};

        var ageChart = new Chart(ctx1, {
        	  type: 'pie',
        	    data: genderData,
        	    options: {
                    responsive: true
                    
                }
           
        });




        var ctx2 = document.getElementById("ageChart").getContext('2d');


        var age10s = $("input:hidden[name='age10s']").val();
        var age20s = $("input:hidden[name='age20s']").val();
        var age30s = $("input:hidden[name='age30s']").val();
        var age40s = $("input:hidden[name='age40s']").val();
        var age50s = $("input:hidden[name='age50s']").val();
        var age60s = $("input:hidden[name='age60s']").val();
        var age60sMore = $("input:hidden[name='age60sMore']").val();

        var ageData ={
        		 labels: ['10대', '20대', '30대', '40대', '50대', '60대', '60대+' ],
        	
        	        
        	    datasets: [{
        	    	
        	    	label : '성별',
        	        data: [
        	               age10s, age20s,age30s,age40s,age50s,age60s, age60sMore
        	        ],	       
        	        backgroundColor : '#808080',	             	    
        	             	  
        	    }]
        	};

        var barChart = new Chart(ctx2, {
        	    type: 'bar',
        	    data: ageData,
        	    options: {
        	    	legend:{
        	    		display : false
        	    	},
        	    
                    responsive: true,
                    scales :{
                    	yAxes:[{
                    		ticks :{
                    			min : 0,
                    			stepSize : 1
                    		}
                    	}]	
                }
               
                }
        	});   


        $(document).ready(function(){
            $('.your-class').slick({
            	centerMode:true,
            	
                	edgeFriction : 2,
                	dots: true,
              	  infinite: true,
              	  speed: 500,
          	  fade: true,
          	  prevArrow : '<button type="button" class="slick-prev">Previous</button>'
            });
          
            
          });
        	
        </script>
        
        

</body>
</html>