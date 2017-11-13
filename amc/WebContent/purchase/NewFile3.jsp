<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Multiple Modals With Semantic UI</title>
	<!-- <link rel="stylesheet" href="path_to_semantic/dist/semantic.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--   <script src="path_to_semantic/dist/semantic.js"></script> -->
  
          <!--   semantic UI  -->
        <link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
       	<script src="../semantic/semantic.min.js"></script>
       	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
  
  
  
</head>
<body>

<div class="ui united modal" id="modal1">
	<div class="header">Modal 1</div>
	<div class="content">Some info will go here...</div>
	<div class="actions">
		<div class="ui blue labeled icon button" id="btn-modal-1"><i class="arrow sign left icon"></i>btn1</div>
	</div>
</div>




<div class="ui united small modal" id="modal3">
 <div class="header"> Modal 3 </div>
 <div class="content"> Hello World </div>
 <div class="actions">
  <div class="ui blue labeled icon button" id="btn-modal-3"> <i class="checkmark icon"></i> btn3 </div> </div>
</div>

<!-- Bored Modal -->
<div class="ui small modal" id="modal4">
 <div class="header"> Don't talk with me! </div>
 <div class="content"> :'( darkness my only old friend... <br> I don't have the class <b>.united</b></div>
 <div class="actions"><div class="ui secondary button"> Close me! </div></div>
</div>

<center style="padding: 30px;">
	<button data-modal="modal1" id="call-modals" class="ui green button">Call Modal 1, 2 and 3</button>
<!-- 	<button data-modal="modal2" id="call-modal-2" class="ui red button">Call Modal 2 and 3 after it</button>
	<button data-modal="modal3" id="call-modal-3" class="ui orange button">Call Modal 3 only</button>
	<button data-modal="modal4" id="call-modal-4" class="ui secondary button">Call Bored Modal Alone in the dark</button> -->
</center> 



<div class="ui thin info modal"> 
  <i class="close icon"></i>
    <div class="content" ></div>
</div>  


<a href="/purchase/NewFile2.jsp" class="info-modal-link">
	asdfasf
</a>



<div id="showmodal" class="ui button primary">
Show Modal
</div>
<div class="ui fullscreen modal event-modal">
  <div class="header">
  ecs_sign.c
  </div>
  <div class="content">
    <div id="trigger1" class="ui primary button">
      test1
    </div>
    <div id="trigger2" class="ui primary button">
      test2
    </div>
    <div id="trigger3" class="ui primary button">
      test3
    </div>    
  </div>
  <div class="actions">
    <div class="ui deny black button">
    Close
    </div>
  </div>
</div>

<div class="ui info event-modal modal" data-object="trigger1">
  <div class="header">
    ecs_sign.c1
  </div>    
  <div class="content">
    test?1
  </div>
  <div class="actions">
    <div class="ui deny black button">Close</div>
  </div>    
</div>

    

<div class="ui info event-modal modal" data-object="trigger3">
  <div class="header">
    ecs_sign.c3
  </div>    
  <div class="content">
    test?3
  </div>
  <div class="actions">
    <div class="ui deny black button">Close</div>
  </div>  
</div>      

<a data-toggle="modal" href="NewFile2.jsp" data-target="#modal-testNew" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success">test</span>
</a>
 
 
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="test" aria-describedby="test">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>



<button class="ui button yellow create_btn" type="button" id="test" >Create</button>


<script>

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


$(function(){
	$("#test").click(function(){
		$(".test").modal('show');
	});
	$(".test").modal({
		closable: true
	});
});

$('.event-modal').modal({
    allowMultiple: true
  });
  
$('#showmodal').click(function() {
	$('.fullscreen.modal').modal('show');
});

$('.event-modal.info').each(function(idx, elem) {
	$(elem).modal('attach events', '#' + $(elem).attr('data-object'));
});




//Multiple Modals
// all first 3 modals will be called and showed but 'BORED MODAL' won't. Only when you click on the last button
// .united is a custom class and you can use anything.
$('.united.modal').modal({
	// this parameter will enable/disable the closing for the previous .united modals when the next will be opened :)
	allowMultiple: false,
});
// attach events
// haven't attached events over button of modal 3
$('#modal1').modal('attach events', '#call-modals');
/* $('#modal2').modal('attach events', '#btn-modal-1'); */
$('#modal2').modal('attach events', 'purchase.addPurchase.jsp');
$('#modal3').modal('attach events', '#btn-modal-2');
// disable the comment bellow to call the modal 4 after click on button into modal 3
//$('#modal4').modal('attach events', '#btn-modal-3');
// Individual events - unecessary but i does it.
  $('center .button').on('click', function(){
	// using the attribute data-modal to identify for what modal the button references
	modal = $(this).attr('data-modal');
	// creating the individual event attached to click over button
	$('#'+modal+'.modal').modal(
		'show'
	);
});  
</script>

</body>
<style>
.ui.modal {
  display: fade in;
  position: fixed;
  z-index: 1001;
  top: 50%;
  left: 50%;
  text-align: left;
  background: #000000;
  border: none;
  box-shadow: 1px 3px 3px 0px rgba(0, 0, 0, 0.2), 1px 3px 15px 2px rgba(0, 0, 0, 0.2);
  -webkit-transform-origin: 50% 25%;
  transform-origin: 50% 25%;
  border-radius: 0.28571429rem;
  -webkit-user-select: text;
  -moz-user-select: text;
  -ms-user-select: text;
  user-select: text;
  will-change: top, left, margin, transform, opacity;
}
</style>
</html>