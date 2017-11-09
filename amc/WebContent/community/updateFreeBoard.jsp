<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="EUC-KR">

</head>

<body>
	<div class="wrapper">
		<c:set var="who" value="" />
		<c:if test="${sessionScope.user.role ne 'admin'}">
			<c:set var="who" value="search" />
		</c:if>
		<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
			<c:set var="who" value="search" />
		</c:if>
		<c:if test="${sessionScope.user.role eq 'admin'}">
			<c:set var="who" value="admin" />
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

			<div class="col-md-12">
				<h2 class="page-heading">게시글 수정</h2>
				<form id='updateFreeForm'>
					<div class="addFreeBoard">
						<div class="field">
							<div class='col-md-1' id="title">제목</div>
							<div class='col-md-11'>
								<input type='text' name='freeBoardTitle' id="freeBoardTitle" class="add__input" value="${freeBoard.freeBoardTitle}">
							</div>
							<div class='field'>
								<div class='col-md-12' id="context">
									<textarea id="freeBoardContent" name="freeBoardContent">${freeBoard.freeBoardContent }</textarea>
								</div>
								<div class='col-md-1' id="title">첨부파일</div>
								<div class='col-md-11'>
									<span class="notice">이미지 파일(jpg, jpeg, png, gif)만 업로드 가능합니다</span> 
									<input type="file" id="imageFile" name="imageFile" class="add__input" value="${freeBoard.freeBoardImage }">
								</div>
							</div>
						</div>
						<div class="col-md-12" id="buttonWrap">
							<button type='button' class="btn btn-md btn--warning btn--wider" id="addButton">수정하기</button>
							<button type='button' class="btn btn-md btn--warning btn--wider" id="cancleButton">취소하기</button>
						</div>
						<div>
							<input type="hidden" name="userId" id="userId" value="${freeBoard.user.userId }">
						</div>
					</div>
				</form>

				<div class="clearfix"></div>
			</div>


		</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
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
        function fncAddFreeBoard() {
            freeBoardTitle = $("input[name='freeBoardTitle']").val();
            freeBoardContent = $("textarea[name='freeBoardContent']").val();
            imageFile = $("input[name='imageFile']").val();
            console.log(freeBoardTitle + "   " + freeBoardContent + "   " + imageFile);

            if (freeBoardTitle == null || freeBoardTitle.length < 1) {
                alert("제목을 입력 해 주세요");
                return;
            }
            if (freeBoardContent == null || freeBoardContent.length < 1) {
                alert("내용을 입력 해 주세요");
                return;
            }
            if (imageFile != "") {
                extension = imageFile.substring(imageFile.lastIndexOf(".") + 1);
                extension = extension.toLowerCase();

                if (extension == 'jpg' || extension == 'jpeg' || extension == 'png' || extension == 'gif') {
                    alert("?");
                } else {
                    alert("업로드가능한 확장자가 아닙니다. 다시 확인해주세요");
                    return;
                }
            }

            $("#updateFreeForm").attr("method", "POST").attr("action", "/community/updateFreeBoard").attr('enctype', 'multipart/form-data').submit();
        }

        $(document).ready(function() {

            $(document).on("click", "#addButton", function() {

                fncAddFreeBoard();

            })

            $(document).on("click", "#cancleButton", function() {

                if (confirm("정말 등록을 취소하시겠습니까?") == true) {
                    history.go(-1);
                } else {
                    return;
                }

            })

        })
    </script>


</body>
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);



.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
}
body {
	font-family: 'Noto Sans KR', sans-serif;
}


.page-heading {
	margin-top: 100px
}

.wrapper {
	margin-bottom: 30px
}

html {
	height: auto;
}

.add__input {
	font-size: 13px;
	color: #b4b1b2;
	width: 100%;
	-webkit-box-shadow: none;
	box-shadow: none;
	-webkit-appearance: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	margin: 5px 0;
	padding: 9px;
}

#title {
	font-size: 13px;
	margin-top: 15px;
	text-align: right;
	/*  vertical-align : middle;
		 margin : 0 auto; */
}

#context {
	font-size: 13px;
	margin-top: 15px;
	text-align: left;
	/*  vertical-align : middle;
		 margin : 0 auto; */
}

#freeBoardContent {
	width: 100%;
	min-height: 400px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 2px #dbdee1;
	font-size: 13px;
	color: #b4b1b2;
}

#addButton {
	font-size: 13px;
	text-align: center;
	margin-top: 10px;
	height: 40px;
	margin-right: 5px;
	color: #4C4145;
}

#cancleButton {
	font-size: 13px;
	text-align: center;
	margin-top: 10px;
	height: 40px;
	margin-left: 5px;
	color: #4C4145;
}

#buttonWrap {
	text-align: center;
}

.notice {
	font-size: 12px;
	color: #969b9f;
}
</style>

</html>