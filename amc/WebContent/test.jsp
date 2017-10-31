<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:if test="${ indexList eq null }">
 	<jsp:forward page="/cinema/index"/>
</c:if> --%>

<!doctype html>
<html>
<head>
<meta charset="EUC-KR">
<!-- df
	Basic Page Needs
        <meta charset="utf-8">
        <title>AMovie</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
    Mobile Specific Metas
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    Fonts
        Font awesome - icon font
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        Roboto
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
        Open Sans
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
    
    Stylesheets

        Mobile menu
        <link href="css/gozha-nav.css" rel="stylesheet" />
        Select
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

        Slider Revolution CSS Files
        <link rel="stylesheet" type="text/css" href="revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="revolution/css/navigation.css">
    
        Custom
        <link href="css/style.css?v=1" rel="stylesheet" />


        Modernizr 
        <script src="js/external/modernizr.custom.js"></script> -->

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
			<jsp:include page="/layout/topToolbar_.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
        <!-- Slider -->
        <div class="bannercontainer rev_slider_wrapper">
 
            <!-- the ID here will be used in the JavaScript below to initialize the slider -->
            <div id="rev_slider_1" class="banner rev_slider" style="display:none">
 
                <!-- BEGIN SLIDES LIST -->
                <ul>
                    <!-- SLIDE 1 -->
                    <li data-transition="fade" class="slide" data-title='JAVA 95.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../images/slides/cinema.jpg">

                        <div class="tp-caption slide__name margin-slider" 
                             data-x="right" 
                             data-y="80"
                             data-frames='[{
                               "delay":300,
                               "split":"chars",
                               "splitdelay":0.1,
                               "speed":700,
                               "frame":"0",
                               "from":"x:[-100%];opacity:0;",
                               "mask":"x:0px;y:0px;s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power4.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            AMC
                        </div>
                        <div class="tp-caption n slide__time margin-slider" 
                            data-x="right" 
                            data-hoffset='230' 
                            data-y="186" 
                            data-frames='[{
                               "delay":1200,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            From
                        </div>

                        <div class="tp-caption  slide__date margin-slider" 
                             data-x="right" 
                             data-hoffset='149' 
                             data-y="186" 
                             data-frames='[{
                               "delay":1700,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             May 31
                        </div>
                        <div class="tp-caption slide__time margin-slider" 
                             data-x="right" 
                             data-hoffset='120' 
                             data-y="186" 
                             data-frames='[{
                               "delay":1200,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             till
                        </div>
                        <div class="tp-caption slide__date margin-slider" 
                             data-x="right" 
                             data-y="186" 
                             data-frames='[{
                               "delay":1700,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             November 24
                        </div>
                        <div class="tp-caption slide__text margin-slider text-right" 
                             data-x="right" 
                             data-y="250"
                             data-frames='[{
                               "delay":2300,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;skX:50px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <!-- Two-time Academy Award winner Ron Howard, teams once again with fellow two-time Academy<br> Award nominee, writer Peter Morgan , on Rush, a spectacular big-screen re-creation of the merciless<br> 1970s rivalry between James Hunt and Niki Lauda -->
                             Made in Room number 403
                        </div>
                        <div class="tp-caption margin-slider" 
                             data-x="right" 
                             data-y="324"
                             data-frames='[{
                               "delay":2600,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="#" class="btn btn-md btn--danger slider--btn">Sign in</a>
                             <!-- <a href="#" class="slide__link">Sign in</a> -->
                        </div>
 
                    </li>
 
                    <!-- SLIDE 2 -->
                    <li data-transition="fade" class="slide" data-title='Comming Cinema. Travel MovieWorld.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../images/bg-video.jpg">
                        <div class="rs-background-video-layer" 
                             data-forcerewind="on" 
                             data-volume="mute" 
                             data-videowidth="100%" 
                             data-videoheight="100%" 
                             data-videomp4="../video/zutopia.mp4" 
                             data-videopreload="auto" 
                             data-videoloop="loop" 
                             data-forceCover="1" 
                             data-aspectratio="16:9" 
                             data-autoplay="true" 
                             data-autoplayonlyfirsttime="false" 
                        ></div>
                        <div class="tp-caption slide__name slide__name--smaller" 
                             data-x="center" 
                             data-y="160" 

                             data-splitin="chars"
                             data-elementdelay="0.1"

                             data-speed="700" 
                             data-start="1400" 
                             data-easing="easeOutBack"

                             data-frames='[{
                               "delay":1400,
                               "speed":700,
                               "split":"chars",
                               "splitdelay":0.1,
                               "frame":"0",
                               "from":"opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            Movie, Watch, Touched.
                        </div>
                        <div class="tp-caption slide__time" 
                             data-x="center"
                             data-hoffset='-130' 
                             data-y="242" 
                             data-frames='[{
                               "delay":1800,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             From
                        </div>
                        <div class="tp-caption slide__date position-center postion-place--two lfb ltb" 
                             data-x="center"                              
                             data-hoffset='-65'                                       
                             data-y="242" 
                             data-frames='[{
                               "delay":2200,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             May 31 
                        </div>
                        <div class="tp-caption slide__time" 
                             data-x="center" 
                             data-hoffset='-10' 
                             data-y="242" 
                             data-frames='[{
                               "delay":1800,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             - till
                        </div>
                        <div class="tp-caption slide__date" 
                             data-x="center"                              
                             data-hoffset='60'
                             data-y="242" 
                             data-frames='[{
                               "delay":2200,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             November 24
                        </div>

                        <div class="tp-caption slider-wrap-btn" 
                             data-x="center"
                             data-y="310" 
                             data-frames='[{
                               "delay":2800,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="/movie/getMovieList?menu=movie" class="btn btn-md btn--danger btn--wide slider--btn">Browse Now Playing</a>
                        </div>
                    </li>

                    <!-- SLIDE 3 -->
                    <li data-transition="fade" class="slide" data-title='Sanck and, Goods sales.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../images/slides/pop_corn.jpg">
                        <div class="tp-caption slide__name slide__name--smaller slide__name--specific" 
                          data-x="center" 
                          data-y="160" 
                          data-frames='[{
                               "delay":1400,
                               "speed":700,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            Snack <span class="highlight">and,</span> Goods <span class="highlight"> sales.</span> 
                        </div>

                        <div class="tp-caption slide__descript" 
                            data-x="center" 
                            data-y="240"
                            data-frames='[{
                               "delay":2000,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            find your goods and snack with Store
                        </div>

                        <div class="tp-caption slider-wrap-btn" 
                            data-x="center" 
                            data-y="310" 
                            data-frames='[{
                               "delay":2500,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            <a href="#" class="btn btn-md btn--danger slider--btn">visit Store</a>
                        </div>
                    </li>

 
                </ul><!-- END SLIDES LIST -->
 
            </div><!-- END SLIDER CONTAINER -->
 
        </div><!-- END SLIDER CONTAINER WRAPPER -->
        <!--end slider -->
        
        
        <!-- Main content -->
        <div class="container">
            <div class="movie-best">
                 <div class="col-sm-10 col-sm-offset-1 movie-best__rating">Today Best choice</div>
                 <div class="col-sm-12 change--col">
                 <c:forEach var="count" begin="1" end="6">
                 <c:if test="${count <=2 }">
                     <div class="movie-beta__item ">
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl eq ''}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:185px; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne ''}">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:185px; height:264px;">
                        </c:if>
                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                             	 <p>${indexList.mainMovieList[count-1].movieNm}</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                 </c:if>
                 <c:if test="${count == 3 }">
                     <div class="movie-beta__item third--item">
                        <c:if test="${indexList.mainMovieList[count-1].postUrl eq ''}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:185px; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne ''}">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:185px; height:264px;">
                        </c:if>
                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                            	 <p>${indexList.mainMovieList[count-1].movieNm}</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                 </c:if>
				 <c:if test="${count == 4}">
                     <div class="movie-beta__item hidden-xs">
                         <c:if test="${indexList.mainMovieList[count-1].postUrl eq ''}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:185px; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne ''}">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:185px; height:264px;">
                        </c:if>
                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                             	 <p>${indexList.mainMovieList[count-1].movieNm}</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
                </c:if>
                <c:if test="${count > 4 }">
                     <div class="movie-beta__item hidden-xs hidden-sm">
                        <c:if test="${indexList.mainMovieList[count-1].postUrl eq null}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:185px; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne null}">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:185px; height:264px;">
                        </c:if>
                         <ul class="movie-beta__info">
                             <li><span class="best-voted">71 people voted today</span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>38 comments</p>
                             </li>
                             <li class="last-block">
                             	 <p>${indexList.mainMovieList[count-1].movieNm}</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
				</c:if>
                </c:forEach>
                </div>
                <div class="col-sm-10 col-sm-offset-1 movie-best__check">check all movies now playing</div>
            </div>

            <div class="col-sm-12">
                <div class="mega-select-present mega-select-top mega-select--full">
                    <div class="mega-select-marker">
                        <div class="marker-indecator location">
                            <p class="select-marker"><span>searching anythings</span> <br>in AMC</p>
                        </div>
                    </div>

                      <div class="mega-select pull-right">
                          <span class="mega-select__point">Search by</span>
                          <ul class="mega-select__sort">
                              <li class="filter-wrap"><a href="#" class="mega-select__filter filter--active" data-filter='location'>통합검색</a></li>
                          </ul>

                          <input name="search-input" type='text' class="select__field">
                          
                          <div class="select__btn">
                            <a href="#" class="btn btn-md btn--danger location">find <span class="hidden-exrtasm">your city</span></a>
                            <a href="#" class="btn btn-md btn--danger cinema">find <span class="hidden-exrtasm">suitable cimema</span></a>
                            <a href="#" class="btn btn-md btn--danger film-category">find <span class="hidden-exrtasm">best category</span></a>
                            <a href="#" class="btn btn-md btn--danger actors">find <span class="hidden-exrtasm">talented actors</span></a>
                            <a href="#" class="btn btn-md btn--danger director">find <span class="hidden-exrtasm">favorite director</span></a>
                            <a href="#" class="btn btn-md btn--danger country">find <span class="hidden-exrtasm">produced country</span></a>
                          </div>

                          <div class="select__dropdowns">
                              <ul class="select__group location">
                                <li class="select__variant" data-value='London'>London</li>
                                <li class="select__variant" data-value='New York'>New York</li>
                                <li class="select__variant" data-value='Paris'>Paris</li>
                                <li class="select__variant" data-value='Berlin'>Berlin</li>
                                <li class="select__variant" data-value='Moscow'>Moscow</li>
                                <li class="select__variant" data-value='Minsk'>Minsk</li>
                                <li class="select__variant" data-value='Warsawa'>Warsawa</li>
                              </ul>
                          </div>
                      </div>
                  </div>
            </div>
            
            <div class="clearfix"></div>
			
			<div class="col-sm-12">
			<div class="col-sm-9">
            <h2 id='target' class="page-heading heading--outcontainer">Now in the cinema</h2>
			</div>
			<div class="col-sm-3 hidden-xs " >
			<h2 id='target' class="page-heading heading--outcontainer">Best Product</h2>
			</div>
			
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-8 col-md-9">
                    <c:set var="i" value="0"/>
                    <c:set var="count" value="1"/>
                    <c:forEach var="movie" items="${indexList.mainMovieList }">
                    <c:set var="i" value="${i+1}"/>
                    	<c:if test="${count == 1}">
                    	<!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                        <img alt='' src="${movie.postUrl}" style="width:220px; height:220px;">
                                        <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">${movie.movieNm}</a>

                                    <p class="movie__time">${movie.showTm}</p>

                                    <p class="movie__option">${movie.genres}</p>
                                    
                                    <div class="movie__rate">
                                    	<div>${movie.watchGradeNm}</div>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                    	</c:if>
                	    <c:if test="${count == 2}">
                    	<!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--left">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                        <img alt='' src="${movie.postUrl}" style="width:220px; height:220px;">
                                        <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">${movie.movieNm}</a>

                                    <p class="movie__time">${movie.showTm}</p>

                                    <p class="movie__option">${movie.genres}</p>
                                    
                                    <div class="movie__rate">
                                        <div>${movie.watchGradeNm}</div>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                    	</c:if>
						<c:if test="${count == 3}">
                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--right">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                    <img alt='' src="${movie.postUrl}" style="width:220px; height:220px;">
                                    <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">${movie.movieNm}</a>

                                    <p class="movie__time">${movie.showTm}</p>

                                    <p class="movie__option">${movie.genres}</p>
                                    
                                    <div class="movie__rate">
                                        <div>${movie.watchGradeNm}</div>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                         </c:if>
                         <c:if test="${count == 4}">
                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--right">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                    <img alt='' src="${movie.postUrl}" style="width:220px; height:220px;">
                                    <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">${movie.movieNm}</a>

                                    <p class="movie__time">${movie.showTm}</p>

                                    <p class="movie__option">${movie.genres}</p>
                                    
                                    <div class="movie__rate">
                                        <div>${movie.watchGradeNm}</div>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                         </c:if>
                         <c:set var="count" value="${count+1}"/>
                         <c:if test="${count == 5}">
                         	<c:set var="count" value="1"/>
                         </c:if>
                         </c:forEach>
                        <div class="row">

                        </div>
                    </div>

                    <aside class="col-sm-4 col-md-3">
                        <div class="sitebar first-banner--left">
                            <div class="banner-wrap first-banner--left">
                                <img alt='banner' src="../images/uploadFiles/${indexList.bestProductList[0].prodImage}">
                            </div>

                             <div class="banner-wrap">
                                <img alt='banner' src="../images/uploadFiles/${indexList.bestProductList[1].prodImage}">
                            </div>

                             <div class="banner-wrap banner-wrap--last">
                                <img alt='banner' src="../images/uploadFiles/${indexList.bestProductList[2].prodImage}">
                            </div>

                            <div class="promo marginb-sm">
                              <div class="promo__head">AMC app</div>
                              <div class="promo__describe">in AndroidPhone<br> You can receive push alarm!</div>
                              <div class="promo__content">
                                  <ul>
                                  	  <li class="store-variant"><a href="#"><img alt='' src="../images/google-play.svg"></a></li>
                                      <li class="store-variant"><a href="#"><img alt='' src="../images/apple-store.svg"></a></li>
                                  </ul>
                              </div>
                          </div>
    
                        </div>
                    </aside>
                </div>
            </div>

            <div class="col-sm-12">
                <h2 class="page-heading">Latest news</h2>

                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <div class="post__image">
                            <img alt='' src="../images/client-photo/post-thor.jpg">
                            <div class="social social--position social--hide">
                                <span class="social__name">Share:</span>
                                <a href='#' class="social__variant social--first fa fa-facebook"></a>
                                <a href='#' class="social__variant social--second fa fa-twitter"></a>
                                <a href='#' class="social__variant social--third fa fa-vk"></a>
                            </div>
                        </div>
                        <p class="post__date">22 October 2013 </p>
                        <a href="single-page-left.html" class="post__title">"Thor: The Dark World" - World Premiere</a>
                        <a href="single-page-left.html" class="btn read-more post--btn">read more</a>
                    </div>
                </div>
                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <div class="post__image">
                            <img alt='' src="../images/client-photo/post-annual.jpg">
                            <div class="social social--position social--hide">
                                <span class="social__name">Share:</span>
                                <a href='#' class="social__variant social--first fa fa-facebook"></a>
                                <a href='#' class="social__variant social--second fa fa-twitter"></a>
                                <a href='#' class="social__variant social--third fa fa-vk"></a>
                            </div>
                        </div>
                        <p class="post__date">22 October 2013 </p>
                        <a href="single-page-left.html" class="post__title">30th Annual Night Of Stars Presented By The Fashion Group International</a>
                        <a href="single-page-left.html" class="btn read-more post--btn">read more</a>
                    </div>
                </div>
                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <div class="post__image">
                            <img alt='' src="../images/client-photo/post-awards.jpg">
                            <div class="social social--position social--hide">
                                <span class="social__name">Share:</span>
                                <a href='#' class="social__variant social--first fa fa-facebook"></a>
                                <a href='#' class="social__variant social--second fa fa-twitter"></a>
                                <a href='#' class="social__variant social--third fa fa-vk"></a>
                            </div>
                        </div>
                        <p class="post__date">22 October 2013 </p>
                        <a href="single-page-left.html" class="post__title">Hollywood Film Awards 2013</a>
                        <a href="single-page-left.html" class="btn read-more post--btn">read more</a>
                    </div>
                </div>
            </div>
                
        </div>
        
        <div class="clearfix"></div>

        <footer class="footer-wrapper">
            <section class="container">
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">Cities</a></li>
                        <li><a href="movie-list-left.html" class="nav-link__item">Movies</a></li>
                        <li><a href="trailer.html" class="nav-link__item">Trailers</a></li>
                        <li><a href="rates-left.html" class="nav-link__item">Rates</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="coming-soon.html" class="nav-link__item">Coming soon</a></li>
                        <li><a href="cinema-list.html" class="nav-link__item">Cinemas</a></li>
                        <li><a href="offers.html" class="nav-link__item">Best offers</a></li>
                        <li><a href="news-left.html" class="nav-link__item">News</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><a href="#" class="nav-link__item">Terms of use</a></li>
                        <li><a href="gallery-four.html" class="nav-link__item">Gallery</a></li>
                        <li><a href="contact.html" class="nav-link__item">Contacts</a></li>
                        <li><a href="page-elements.html" class="nav-link__item">Shortcodes</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="footer-info">
                        <p class="heading-special--small">A.Movie<br><span class="title-edition">in the social media</span></p>

                        <div class="social">
                            <a href='#' class="social__variant fa fa-facebook"></a>
                            <a href='#' class="social__variant fa fa-twitter"></a>
                            <a href='#' class="social__variant fa fa-vk"></a>
                            <a href='#' class="social__variant fa fa-instagram"></a>
                            <a href='#' class="social__variant fa fa-tumblr"></a>
                            <a href='#' class="social__variant fa fa-pinterest"></a>
                        </div>
                        
                        <div class="clearfix"></div>
                        <p class="copy">&copy; A.Movie, 2013. All rights reserved. Done by Olia Gozha</p>
                    </div>
                </div>
            </section>
        </footer>
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
<!-- df
	JavaScript
        jQuery 3.1.1 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        Migrate 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        Bootstrap 3 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        Slider Revolution core JavaScript files
        <script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js"></script>

        Slider Revolution extension scripts. 
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>

        Mobile menu
        <script src="js/jquery.mobile.menu.js"></script>
         Select
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>
        Stars rate
        <script src="js/external/jquery.raty.js"></script>
        
        Form element
        <script src="js/external/form-element.js"></script>
        Form validation
        <script src="js/form.js"></script>

        Twitter feed
        <script src="js/external/twitterfeed.js"></script>

        Custom
        <script src="js/custom.js"></script>
		
	      <script type="text/javascript">
              $(document).ready(function() {
                init_Home();
              });
		    </script> -->
		    <script src="/js/custom.js"></script>
		    

</body>
</html>
