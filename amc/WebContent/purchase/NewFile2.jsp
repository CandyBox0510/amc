<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<% int index = (int)(java.lang.Math.random()*3.0); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
<script src="../semantic/semantic.min.js"></script>


          <!--   semantic UI  -->
        <link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
       	<script src="../semantic/semantic.min.js"></script>
       	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
  


<script type="text/javascript">
/* $(function(){ */
/*     $("#popbutton").click(function(){
         $('div.modal').modal({remote : '/product/getGoodsProduct?prodNo=10137&menu=search'}); 
    	 $('div.modal').modal({remote : 'product/.jsp'});  
    })
})
 */

/* 	function fncmodal(){
		$('.ui.modal').modal('show'); 
		$('.ui.modal').modal({remote : '/product/getGoodsProduct?prodNo=10137&menu=search'}); 
	} */
	
	$(function () {
	    $('.info-modal-link').each(function () {
	        $(this).on('click', function (e) {                   
	            e.preventDefault();
	            var url = $(this).attr('href'); 
	            $.get(url, function (data) {
	                $('.info.modal .content').html(data);
	                $(".info.modal").modal({closable:true,observeChanges:true}).modal('show');
	            });
	        });              
	    });
	});
	
	$('.test.modal')
	  .modal('show')
	;
	
	
	$('#modal1').modal('attach events', '#call-modals');
	$('#modal2').modal('attach events', '#btn-modal-1');
	$('#modal3').modal('attach events', '#btn-modal-2');

	
	
	
	  $('center .button').on('click', function(){
			// using the attribute data-modal to identify for what modal the button references
			modal = $(this).attr('data-modal');
			// creating the individual event attached to click over button
			$('#'+modal+'.modal').modal(
				'show'
			);
		});  
</script>
</head>
<body>

<!-- <button class="btn btn-default" id="popbutton">모달출력버튼</button><br/>
<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
        remote ajax call이 되는영역
    </div>
  </div>
</div>
 -->

<%-- <a href="javascript:fncmodal();" class="cinema__images">
    <img id="poster"alt='' src="../images/amc.png" >
    <input type="hidden" id="prodNo" value="${product.prodNo}"/>
</a>
 --%>
 
 <div class="ui thin info modal"> 
  <i class="close icon"></i>
    <div class="content" ></div>
</div>  
 
 <div class="modal-body">
 
<div class="ui united fullscreen modal" id="modal2">
 <div class="header"> Modal 2 </div>
 <div class="content">If you want to close previous modals before show the next modal, you should disable the parameter <b>'allowMultiple'</b>.  </div>
 <div class="actions">
  	<div class="ui red labeled icon button" id="btn-modal-2"><i class="arrow sign left icon"></i>btn2</div>
 </div>
</div>


</div>


<div class="ui info event-modal modal" data-object="trigger2">
  <div class="header">
    ecs_sign.c2
  </div>    
  <div class="content">
    test?2
  </div>
  <div class="actions">
    <div class="ui deny black button">Close</div>
  </div>    
</div>  
<!-- <div class="ui modal"> -->
<!-- <div class="ui modal">
	<i class="close icon"></i>
	<div class="header">
		Profile Picture
	</div>
	<div class="image content">
		<div class="ui medium image">
			<img src="/images/amc.png">
		</div>
		<div class="description">
			<div class="ui header">We've auto-chosen a profile image for you.</div>
		</div>
		<div class="actions">
			<div class="ui black deny button">
				Nope
			</div>
			<div class="ui positive right labeled icon button">
				Yep, that's me
				<i class="checkmark icon"></i>
			</div>
		</div>
	</div>
</div> -->
		                   		                          		   
<div class="ui modal">
  <i class="close icon action"></i>
  <div class="header">
    Header
  </div>
  <div class="content">
    <div class="left">
      Some content to the left, usually an image or icon
    </div>
    <div class="right">
      Some content to the right
    </div>
  </div>
  <div class="actions">
    <div class="ui button">
      Cancel
    </div>
    <div class="ui button">
      Okay
    </div>
  </div>
</div>
		            
		            
		            
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
    테스트입니다.                     
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-warning" id="testDel">
        전체삭제<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <span class="btn btn-sm btn-success" id="testSave">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>


출처: http://aramk.tistory.com/24 [깨순이네]
		         
		
		
	<div class="ui modal test">
  <i class="close icon"></i>
  <div class="header">
    Profile Picture
  </div>
  <div class="image content">
    <div class="ui medium image">
      <img src="https://semantic-ui.com/images/avatar2/large/rachel.png">
    </div>
    <div class="description">
      <div class="ui header">We've auto-chosen a profile image for you.</div>
      <p>We've grabbed the following image from the <a href="https://www.gravatar.com" target="_blank">gravatar</a> image associated with your registered e-mail address.</p>
      <p>Is it okay to use this photo?</p>
    </div>
  </div>
  <div class="actions">
    <div class="ui black deny button">
      Nope
    </div>
    <div class="ui positive right labeled icon button">
      Yep, that's me
      <i class="checkmark icon"></i>
    </div>
  </div>
</div>
		
		
		
		
		
		         
		                   		      
<div class="ui small info modal">
    <div class="content">
  
    </div>
</div> 

<!--  <a href="/product/getGoodsProduct?prodNo=10137&menu=search" class="info-modal-link">Find out more</a> -->
<a href="/purchase/NewFile3.jsp" class="info-modal-link">Find out more</a>

</body>
<style>
.modal-content {
	position: relative;
    z-index: 5;
    float: left;
    width: 100%;
    list-style: none;
    font-size: 7px;
    text-align: left;
    background-color: #fff;
    background-clip: padding-box;
    box-shadow: 0 2px 10px rgba(0,0,0,.2);
    border-radius: 3px;
    top: -1px;
    margin-top: 0%;
    border: 0;
    padding: 30px;
}

</style>
</html>
