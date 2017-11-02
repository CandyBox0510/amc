<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:if test="${ indexList eq null }">
 	<jsp:forward page="/cinema/index"/>
</c:if> --%>

<!doctype html>
<html>
<head>
<meta charset="EUC-KR">

	<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
</head>

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

        
        <!-- Main content -->
        <div class="container">
            
            
            <div class="clearfix"></div>
			
			<section class="container">
            <div class="col-md-12">
                <h2 class="page-heading"> 자유게시판</h2>
                	<div class="col-md-12 getFreeBoard">
                		<input type="hidden" name ="freeBoardNo" value="${freeBoard.freeBoardNo }">
                		<div class="col-md-12 title" >${freeBoard.freeBoardTitle }</div>
                		<div class="row freeBoardInfo">
                			<div class="col-md-1 text-right">작성자</div>
                			<div class="col-md-1 text-left">${freeBoard.user.userId }</div>
                			<div class="col-md-5"></div>
                			<div class="col-md-1 text-right">작성일</div>
                			<div class="col-md-2 text-left">${freeBoard.freeBoardRegDate }</div>
                			<div class="col-md-1 text-right">HIT</div>
                			<div class="col-md-1 text-left">${freeBoard.freeBoardViews }</div>
                		</div>
                		<hr>
                		<div class="col-md-12 content">
                			<div>
	                			<c:if test="${freeBoard.freeBoardImage != null}">	
	                				<img id="freeBoardImage" src="/images/community/${freeBoard.freeBoardImage}"> 
	                			</c:if>
                			</div>
                			<div>${freeBoard.freeBoardContent }</div>
                		</div>
                		<div class="col-md-12"><hr></div>
                		<div class="col-md-12">
                	
                			<div class="col-md-1 text-right">첨부파일</div>
                			<div class="col-md-11 text-left">
                			<c:if test="${freeBoard.freeBoardImage == null }">
                			첨부파일이 없습니다.
                			</c:if>
                			 
                			</div>
                			<c:if test="${freeBoard.freeBoardImage != null}">	
                			${freeBoard.freeBoardImage}
                			</c:if>
                		
                			</div>
                	
                		</div>
                		
                	
                	</div>
                   	
			        <div class ="col-md-12 text-right button">
			      
			        <button type="button" class="btn btn-md btn--warning btn--wider" id = 'listButton'><i class="fa fa-bars"></i> &nbsp; 목록으로</button>
			        	<c:if test="${user.userId != null }">
			        		<button type="button" class="btn btn-md btn--warning btn--wider" id = 'writeButton'><i class="fa fa-pencil"></i> &nbsp;글쓰기</button>
			        	</c:if>
			        	<c:if test="${user.userId == freeBoard.user.userId || user.role == 'admin' }">
			        		<button type="button" class="btn btn-md btn--warning btn--wider" id = 'updateButton'><i class="fa fa-eraser"></i> &nbsp;수정</button>
			        		<button type="button" class="btn btn-md btn--warning btn--wider" id = 'deleteButton'><i class="fa fa-times"></i>삭제</button>
			        	</c:if>
			        	
			        </div>
			        
				
            
           

        </section>


            
                
        </div>
         <div class="container">
       		  <h2 class="page-heading">댓글</h2>

                <div class="comment-wrapper">
                    <form id="comment-form" class="comment-form" method='post'>
                        <textarea class="comment-form__text" placeholder='Add you comment here'></textarea>
                        <label class="comment-form__info">250 characters left</label>
                        <button type='submit' class="btn btn-md btn--danger comment-form__btn">add comment</button>
                    </form>

                    <div class="comment-sets">

                        <div class="comment"></div>
                         
                         <div class="comment">
                        <c:forEach var="comment" items="${list }">
                        
                        	${comment.commentNo }
                        </c:forEach>
  
                            <a href='#' class="comment__author">Olia Gozha</a>
                            <p class="comment__date">22.10.2013 | 14:40</p>
                            <p class="comment__message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae enim sollicitudin, euismod erat id, fringilla lacus. Cras ut rutrum lectus. Etiam ante justo, volutpat at viverra a, mattis in velit. Morbi molestie rhoncus enim, vitae sagittis dolor tristique et.</p>
                            <a href='#' class="comment__reply">Reply</a>
                       </div>

                        <div class="comment comment--answer">
                            <div class="comment__images">
                                <img alt='' src="images/comment/avatar-dmitriy.jpg">
                            </div>

                            <a href='#' class="comment__author"><span class="social-used fa fa-vk"></span>Dmitriy Pustovalov</a>
                            <p class="comment__date">today | 10:19</p>
                            <p class="comment__message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae enim sollicitudin, euismod erat id, fringilla lacus. Cras ut rutrum lectus. Etiam ante justo, volutpat at viverra a, mattis in velit. Morbi molestie rhoncus enim, vitae sagittis dolor tristique et.</p>
                            <a href='#' class="comment__reply">Reply</a>
                        </div>

                        

                        <div class="comment-more">
                            <a href="#" class="watchlist">Show more comments</a>
                        </div>

                    </div>
                </div>



       
         </div>
        
        <div class="clearfix"></div>

      
    </div>

    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" class="login" method='get' novalidate=''>
                        <p class="login__title">sign in <br><span class="login-edition">welcome to A.Movie</span></p>

                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>

                        <p class="login__tracker">or</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email' name='user-email' class="login__input">
                        <input type='password' placeholder='Password' name='user-password' class="login__input">

                        <input type='checkbox' id='#informed' class='login__check styled'>
                        <label for='#informed' class='login__check-info'>remember me</label>
                         </div>
                        
                        <div class="login__control">
                            <button type='submit' class="btn btn-md btn--warning btn--wider">sign in</button>
                            <a href="#" class="login__tracker form__tracker">Forgot password?</a>
                        </div>
                    </form>
                </div>

            </section>
        </div>

		
         <script src="/js/external/modernizr.custom.js"></script> 
	
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script> 


        <!-- Custom -->
        <script src="/js/custom.js"></script>
       
		
		<script type="text/javascript">
		
		function fncGetCommentList() {
			
			
		}
		
		 function fncGetPageList(currentPage) {
		        $("#currentPage").val(currentPage)		  
		      
		        $("form").attr("method", "POST").attr("action", "/community/getFreeBoardList").submit();
		        $("input[name='searchKeyword']").val(searchKeyword);
		    }
		    
		 
		 
            $(document).ready(function() {
                init_MovieList();
                freeBoardNo = $("input[name='freeBoardNo']").val();

                if($('html').height() < window.outerHeight){
                	$('html').css('height', '100%');
                }
                
                $(document).on("click", "#listButton", function () {
        			
    				$(self.location).attr("href","/community/getFreeBoardList");
    		
    			})
                
    			$(document).on("click", "#writeButton", function () {
    			
    				$(self.location).attr("href","/community/addFreeBoard.jsp");
    		
    			})
    			   $(document).on("click", "#deleteButton", function () {
    				if(confirm("정말 삭제하시겠습니까?")==true){
    					$(self.location).attr("href","/community/deleteFreeBoard?freeBoardNo="+freeBoardNo);
    				}else{
    					return;
    				}
    			})
    			
    			$(document).on("click", "#updateButton", function () {
    			
    				$(self.location).attr("href","/community/updateFreeBoard?freeBoardNo="+freeBoardNo);
    		
    			})
    			
    	
            });
		</script>
		    

</body>
<style type="text/css">
html{
  height: auto;
}
			

section{
	margin-bottom : 30px
}
.page-heading{
	margin-top : 100px
}
hr{
 border: solid 0.5px #dbdee1;
}
.title {
  font-size: 20px;
  font-weight: bold;
  height : auto;
  padding-bottom:10px;

}

.getFreeBoard div{
  color:#4C4145;

}

.content{
	height : auto;
	margin-bottom : 10px;
}

.button button{
	padding : 5px 5px 5px 5px;
	
	
}
.freeBoardInfo >div {
	padding-top:10px;
	padding-botton:10px;
}

#freeBoardImage{
	width:500px;
	margin-bottom:20px;
}

</style>

</html>
