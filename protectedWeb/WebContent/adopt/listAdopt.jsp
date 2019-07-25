<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>LIST ADOPT</title>
	<meta charset="EUC-KR">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">

	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		
		
 	  	html { 
 	 	 scroll-behavior: smooth; 
 		} 

		
		h3{
			font-family: 'NanumSquare', sans-serif !important;
			font-size: 20px !important;
			padding-bottom: 0px;
			margin-bottom: 0px !important;
			opacity: 1  !important;
			font-weight: bold;
		}
		
		div.row { 
			font-family: 'NanumSquare', sans-serif !important;
			font-weight: bold;
		}

	    .getadopt {
			position: relative;
			max-height: 300px; 
			min-height: 300px; 
			min-width: 255px;
			max-width: 255px;
		}
	
		.getadopt img {
			max-height: 300px; 
			min-height: 300px; 
			min-width: 255px;
			max-width: 255px;
	/* 		    transition: all 0.3s; */
			display: block;
			height: auto;
	/* 		    transform: scale(1); */
		}
		
		.overlay {
			position: absolute;
			bottom: 0;
			left: 0;
			right: 0;
			background-color: white;
			overflow: hidden;
			opacity: 1;
			min-width: 255px;
			max-width: 255px;
			height: 50px;
			transition: 1s ease;
		}
	
		.getadopt:hover .overlay {
			height: 0%;
		}
	
		.text {
			color: #3E6B79;
			font-size: 20px;
			position: absolute;
			top: 50%;
			left: 50%;
			-webkit-transform: translate(-50%, -50%);
			-ms-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		
		form {
			text-align: right;
			padding-left: 199px;
		}
		
		.justify {
			margin-right: 0px;
		}
		
		.form-group {
			display: inline-block;
			right: 0%;
			text-align: right;
/* 			vertical-align: ; */
		}
		
		select, #searchKeyword {
			height: 33px;
		}
		
/* 		select[name=areaCondition] { */
/* 			margin-left: 200px; */
/* 		} */

    </style>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<input type="hidden" id="boardCode" value="${param.boardCode }">
	
	
		<div class="page-header text-info">
		
			<div class="row" style="position:relative;height:35px;">
	        	<div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" >
	        	<font size="5px" id="pagename"><strong>
					<c:if test="${param.boardCode eq 'AD' }">분양글 리스트</c:if>
<%-- 				    <c:if test="${param.boardCode eq 'MS' }">실종글 리스트</c:if> --%>
	        	</strong></font></div>
	        	<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " ><font size="5px">
		        	<c:if test="${ !(empty sessionScope.user) && sessionScope.user.levels ne '미인증회원' }">
		       		 	<button type="button" class="btn btn-primary"><font size="3px">글쓰기</font></button>
		        	</c:if>
	        	</font></div>
	        </div>
		
	    </div>



		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건
		    	</p>
		    </div>
		    
			<div class="col-md-6" id="justify" align="right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
			    		<select name="areaCondition" >
							<option value="all">전체</option>
							<option value="kw"  ${ ! empty search.areaCondition && search.areaCondition=="강원" ? "selected" : "" }>강원도</option>
							<option value="kk"  ${ ! empty search.areaCondition && search.areaCondition=="경기" ? "selected" : "" }>경기도</option>
							<option value="ks"  ${ ! empty search.areaCondition && search.areaCondition=="경상" ? "selected" : "" }>경상도</option>
							<option value="kj"  ${ ! empty search.areaCondition && search.areaCondition=="광주" ? "selected" : "" }>광주시</option>
							<option value="dj"  ${ ! empty search.areaCondition && search.areaCondition=="대전" ? "selected" : "" }>대전시</option>
							<option value="bs"  ${ ! empty search.areaCondition && search.areaCondition=="부산" ? "selected" : "" }>부산시</option>
							<option value="su"  ${ ! empty search.areaCondition && search.areaCondition=="서울" ? "selected" : "" }>서울시</option>
							<option value="us"  ${ ! empty search.areaCondition && search.areaCondition=="울산" ? "selected" : "" }>울산시</option>
							<option value="ic"  ${ ! empty search.areaCondition && search.areaCondition=="인천" ? "selected" : "" }>인천시</option>
							<option value="jr"  ${ ! empty search.areaCondition && search.areaCondition=="전라" ? "selected" : "" }>전라도</option>
							<option value="cc"  ${ ! empty search.areaCondition && search.areaCondition=="충청" ? "selected" : "" }>충청도</option>
						</select>
			    	</div>&nbsp;

			    	<div class="form-group">
						<select name="searchCondition" id="searchCondition">
							<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>견종</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						<input type="text" id="searchKeyword" name="searchKeyword"  placeholder="&nbsp;검색어를 입력하세요."
						    	value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>

					<div class="form-group" >
						<button type="button" class="btn btn-default"  id="search" style="height: 33px;width: 45px;">검색</button>
					</div>
			    
			    </form>
		    </div>
		    
		</div>
			    

		
		<div class="row"><div class="col-md-12"></div><br/></div>

      <div class="row">
      <div class="col-md-12"></div>
      <div class="col-md-12" >
      
      <div class="col-md-12" id="listAdoptJSON" style="padding-left: 0px">
      
      <c:if test="${resultPage.totalCount eq 0 }">
     	 <br/><br/><br/><br/><br/><p align="center"><font size="4px">검색결과가 없습니다.</font><br/><br/><br/><br/><br/><br/></p>
      </c:if>
      <c:set var="i" value="0" />
		  <c:forEach var="adopt" items="${list}">
			<c:set var="i" value="${ i+1 }" />

			<div class="col-sm-4 col-md-3" style="vertical-align: middle;margin-top: 10px;">
			
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<figure class="getadopt">
			<input type="hidden" name="postNo" value="${adopt.postNo}"/>
				<span id="image-box"><c:if test="${adopt.statusCode ne 3}">
				  <img class="listImg" src="../resources/file/fileAdopt/${adopt.mainFile}"  onerror="this.src='http://placehold.it/400x400'"/>
				</c:if>
				<c:if test="${adopt.statusCode eq 3}">
				  <img class="listImg" src="../resources/file/fileAdopt/complete.png" style="width:100%;background:url('../resources/file/fileAdopt/${adopt.mainFile}') no-repeat center center;background-size:cover;" onerror="this.src='http://placehold.it/400x400'" />
				</c:if></span>
<%-- 				<c:if test="${adopt.statusCode ne 3}"> --%>
				  <figcaption class="overlay">
					    <span id="text"><h3 align="center" style="width: 255px;padding-right: 0px;" >${adopt.postTitle}</h3>
					    <c:if test="${param.boardCode eq 'AD' }">
					   	 	<p align="right">${fn:substring( adopt.areaKr , 0, fn:indexOf(adopt.areaKr,'시')+1 ) }</p>
					   	</c:if>
					    <c:if test="${param.boardCode eq 'MS' }">
					   	 	<p align="right"><fmt:formatNumber value="${ adopt.dogPay }" pattern="#,###" />원</p>
					   	</c:if></span>
				  </figcaption>
<%-- 				  </c:if> --%>
			</figure>
			
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			
			</div>	
		
       </c:forEach>
       </div>
       
       </div>
       </div>
       
       <div class="col-md-12"><br/><br/></div>
       
         
       
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	
 	
 	
 	<jsp:include page="/layout/footer.jsp"></jsp:include>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
<%-- 	<jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	

		console.log($(window).height() );
		console.log($(window).scroll() );
		console.log($(document).height());
		var postNo;
		var postSize = 2;
		var area = '';
		var str = '';
		var event = false;
		
		$(function(){
	        $(window).scroll(function(){
	            
	//             scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	//             if( $(this).scrollTop() == $(document).height() -  $(this).height() ){
	            if( $(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){
	            	postSize++;
	            	listApply(postSize,"");
	            }
	        })//스크롤 
	//         listApply(postSize,"");
	    })
	
	
	
		function listApply(postSize, str){
	// 		console.log("dd "+$("#listAdoptJSON").html());
	// 		console.log(area+'들어옴'+postSize+", "+str);
	// 		var sendData = jQuery("form[name=detailForm]").serialize();
			console.log($("#searchCondition").val()+", "+$("#searchKeyword").val()+", "+area+", "+$("#boardCode").val()+", "+postSize);
			console.log(typeof $("#searchCondition").val());
			console.log(typeof postSize);
	  		$.ajax( 
			 		{
						url : "/adopt/json/listAdopt",
						method : "POST" ,
						data : JSON.stringify({
							searchCondition : $("#searchCondition").val(),
							searchKeyword : $("#searchKeyword").val(),
							areaCondition : $('select[name=areaCondition]').val(),
							boardCode : $("#boardCode").val(),
							pazeSize : postSize,
						}) ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(data , status) {
	// 							console.log(JSON.stringify(data));
	
								var displayValue = '';
								
								for( i=0; i<data.list.length; i++ ){
									var figover = '';
									var bCode = data.list[i].areaKr.substring( 0, data.list[i].areaKr.indexOf('시')+1 );
									var sCode = '<img class="listImg" src="../resources/file/fileAdopt/complete.png" style="background:url(\'..\/resources\/file\/fileAdopt\/'+data.list[i].mainFile+'\') no-repeat center center;background-size:cover;" onerror="this.src=\'http://placehold.it/400x400\'" />';
									
									if ( data.list[i].statusCode != 3 ) {
										sCode = '<img class="listImg" src="../resources/file/fileAdopt/'+data.list[i].mainFile+'"  onerror="this.src=\'http://placehold.it/400x400\'"/>';		
	// 									figover =   '<figcaption class="overlay">'
	// 							      					+'<span id="text"><h3 align="center" style="width: 255px;padding-right: 0px;" >'+data.list[i].postTitle+'</h3>'
	// 							      					+'<p align="right">'+bCode+'</p></span>'
	// 							      				+'</figcaption>';
									}
									
									displayValue += '<div class="col-sm-4 col-md-3" style="vertical-align: middle;margin-top: 10px;">'
										      			+'<figure class="getadopt">'
										      				+'<input type="hidden" name="postNo" value="'+data.list[i].postNo+'"/>'
										      				+sCode
										      				+'<figcaption class="overlay">'
									      					+'<span id="text"><h3 align="center" style="width: 255px;padding-right: 0px;" >'+data.list[i].postTitle+'</h3>'
									      					+'<p align="right">'+bCode+'</p></span>'
									      				+'</figcaption>'
										      			+'</figure>'
									      			+'</div>';	
						            
								}
								if(str!=""){
									$('#listAdoptJSON').children().remove();
									$('.text-primary').text('전체 '+data.totalCount+' 건');
								}
								if( postSize == 1 && data.list.length == 0 ){
									console.log('결과없음');
									displayValue = '<br/><br/><br/><br/><br/><p align="center"><font size="4px">검색결과가 없습니다.</font><br/><br/><br/><br/><br/><br/></p>';
								}
								$('#listAdoptJSON').append(displayValue);
								
								
				
							
						},
						error: function(request, status, error){ 
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
				
			});

 		}
	
		
		
		$(function() {
			$( "button:contains('검색')" ).on("click" , function() {
				if ( $( '#searchKeyword').val() == '' ){
					$("#searchKeyword").focus();
					return;
				}
				fncGetList(1);
			});
			//엔터검색
			$('#searchKeyword').keydown( function(e) {
				if(e.keyCode == 13) {
// 					alert("엔터 "+$('#boardCode').val());
// 					return;
					if ( $( '#searchKeyword').val() == '' ){
						$("#searchKeyword").focus();
						return;
					}else {
						fncGetList(1); 
					}
				}
			});
			// 상세조회
			$(document).on("click")
			$( "#listAdoptJSON" ).on("click", ".getadopt" , function() {
				self.location ="/adopt/getAdopt?postNo="+$(this).children( $('input')).val().trim();
			});
			
			// 글 등록하기
			$( "button:contains('글쓰기')" ).on("click" , function() {
				self.location = "/adopt/addAdopt?boardCode=${param.boardCode}"
			});
			
			$( "strong:contains('분양글 리스트')" ).on("click" , function() {
				self.location = "/adopt/listAdopt?boardCode=${param.boardCode}"
			});

// 			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	
		$('select[name=areaCondition]').change( function(){
			postSize = 1;
			listApply(postSize,"dd");
		});
		
		
		function fncGetList(currentPage) {
// 			var ccc = $( '#boardCode' ).val();
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/adopt/listAdopt?boardCode=AD").submit();
		}
		
	
	</script>
	
	
	
</body>

</html>