<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel = "icon" href = "/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/prodmenu/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/animate.css">
    
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/aos.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/flaticon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/icomoon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/style.css">
    
<!--     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> -->
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript">

    	$(function(){
    		$("span:contains('�α���')").on("click", function(){
    			$(self.location).attr("href","/users/login");
    		});
    	});

    </script>
    
    <style type="text/css">
    	.py-1 bg-black{
    		min-height: 27px;
    	}
    	
    	.goto-here{
    		color : black;
    	}
    	.pr-4{
    		padding-right : 17px;
    	}
    	    	
		@font-face {
    		font-family: 'YouandiModernTR';
   		 	font-style: normal;
    		font-weight: normal;
    		src: url(/resources/font/Youandi_Modern_TextRegular.woff) format('woff');
		}
    	body{
    		font-family: 'YouandiModernTR', sans-serif !important;
    	}
    </style>
  </head>
  <body class="goto-here">
  		<input type="hidden" id="registId" value="${ sessionScope.user.id }">
      <div class="py-1 bg-black">
       <div class="container">
          <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
             <div class="col-lg-12 d-block">
                <div class="row d-flex">
                   <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="col-md-4 pr-4">
					    		
						    	<span class="icon-phone2">
						    		<span class="text">${ sessionScope.user.phone }</span>
						    	</span>
					    	</div>
						   	 	<c:if test="${ sessionScope.user == null }">
						   	 	<span>
							   	 	<a id="custom-login-btn" href="javascript:loginWithKakao()">
	                        			<img src="/resources/img/kakao/kakaolink_btn_small.png" style="height:15px; width: 15px;"/>
	                        		</a>
	                        	</span>
                        		</c:if>
                        		</div>
                        		<c:if test="${ sessionScope.user.kakao != null }">
                        			<a id="" href="javascript:logoutWithKakao()">īī�� �α׾ƿ�</a>
                        		</c:if>
<%-- 							<c:if test="${ sessionScope.user.google != null }"> --%>
<!-- 								<a id="googleLogout" href="#" onclick="signOut();">google �α׾ƿ�</a> -->
<%-- 							</c:if> --%>

							<c:if test="${ sessionScope.user.id != null }">
					    	<a class="icon mr-2 d-flex justify-content-center align-items-center" >
					    		<span class="icon-paper-plane msg">����������</span>
					    	</a>

					   		</c:if>

					   		
					   		
					    	<div class="col-md-4 pr-4" align="right">
					    	<input type="hidden" id="id" name="id" value="${ sessionScope.user.id }">
						    <c:if test="${ sessionScope.user eq null }">
						    	<div align="right">
						    	<span id="login" class="text">�α���</span> &nbsp;
						    	<span id="regist" class="text">ȸ������</span>
						    	</div>
						    </c:if>

<%-- 						    <c:if test="${sessionScope.user.role eq 'user' }"> --%>
<!-- 						    <div class="myInfo"> -->
<!-- 						    	<input type="button" id="myInfo" value="����������"> -->
<!-- 						    </div> -->
<%-- 						    </c:if> --%>
<%-- 						    <c:if test="${sessionScope.user.role eq 'admin' }"> --%>
<!-- 						    <div class="manageMenu"> -->
<!-- 						    	<input type="button" id="manageMenu" value="�����ڸ޴�"> -->
<!-- 						    </div> -->
<%-- 						    </c:if> --%>
						    
						    <c:if test="${ sessionScope.user != null }">
<!-- 							    <div class="col-md-5 pr-4 userInfo"> -->
							    	<span class="text">${sessionScope.user.nickname } ��</span>
							    	<span class="text" class="logout">
							    		<a href="/users/logout">�α׾ƿ�</a>
							    	</span>
<!-- 	                            </div> -->
                            </c:if>
                            </div>

                </div>
             </div>
          </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/index.jsp">#��ȣ�Ұ�</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span>
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">

             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">�о�</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">�о縮��Ʈ</a>
<!--                 <a class="dropdown-item" href="/adopt/listAdopt?boardCode=MS">��������Ʈ</a> -->
                <a class="dropdown-item" href="/adoptReview/listAdoptReview">�ı�</a>
<!--                 <a class="dropdown-item" href="/adoptReview/REALaddAdoptReview.jsp">�ı�</a> -->

              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">���丮�ݵ�</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/funding/listVoting">��ǥ�Խ���</a>
                <a class="dropdown-item" href="/funding/listFunding">�Ŀ��Խ���</a>
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ŀ�´�Ƽ</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/info/listInfo">��������</a>
                <a class="dropdown-item" href="/community/getDogSense.jsp">�ְ߻��</a>
              </div>
            </li>
            <c:if test="${ sessionScope.user != null }">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">����������</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/users/getUsers?id=${ sessionScope.user.id }">����������</a>
              	<a class="dropdown-item" href="/message/listReceiveMessage">����������</a>
                <a class="dropdown-item" href="/message/listSendMessage">����������</a>
                <a class="dropdown-item" href="/message/addMessage">��������</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/coupon/addCoupon">��������</a>
                </c:if>
                <a class="dropdown-item" href="/coupon/listCoupon">�����ޱ�</a>
                <a class="dropdown-item" href="/report/addReportView.jsp">�Ű��ϱ�</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                <a class="dropdown-item" href="/report/listReport">�Ű��۸��</a>
                </c:if>
              </div>
            </li>
            </c:if>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">�����</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
               <a class="dropdown-item" href="/prodQna/listProdQna?order=1">��ǰQ&a</a>
                <a class="dropdown-item" href="/market/listMarket?order=1">��ȣ����</a>
                <a class="dropdown-item" href="/product/listProduct">��ǰ����Ʈ</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/product/listAdminProduct">�����ڻ�ǰ����Ʈ</a>
                </c:if>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/community/getBreedPedia.jsp">�������</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="/hospital/getHospital.jsp">��������</a>
            </li>
           </ul>
         </div>
       </div>
     </nav>
    <!-- END nav -->


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#94BFCA"/></svg></div>


  <script src="/resources/prodmenu/js/jquery.min.js"></script>
  <script src="/resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/prodmenu/js/popper.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
  <script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
  <script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/prodmenu/js/aos.js"></script>
  <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap-datepicker.js"></script>
  <script src="/resources/prodmenu/js/scrollax.min.js"></script>
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="/resources/prodmenu/js/google-map.js"></script> -->
  <script src="/resources/prodmenu/js/main.js"></script>

  	<script type="text/javascript">

		Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');
		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(authObj) {
					Kakao.API.request({
						url : "/v2/user/me",
						success : function(result) {
							var info = JSON.stringify(result);
							$(location).attr('href','/users/kakao?kakao=' + result.id);
						}
					});
					Kakao.Auth.getAccessToken();
				},
				fail : function(err) {
					alert(JSON.stringify(err));
					alert("�α��� ����")
				}
			})
		}


		function logoutWithKakao() {
			Kakao.Auth.logout();
			location.href = 'https://accounts.kakao.com/logout?continue=https://pf.kakao.com/logged_out';
		}

		$(function() {
			
			$("#myInfo").on("click",function() {
				$(self.location).attr('href',"/users/getUsers?id=${sessionScope.user.id}");
			});
			
			$("#login").on("click", function() {
				$(self.location).attr("href", "/users/login");
			});
			
			$("#regist").on("click", function() {
				$(self.location).attr("href", "/users/addUsersBase");
			});
		});

		
// 		Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');
// 		function loginWithKakao() {
// 			Kakao.Auth.login({
// 				success : function(authObj) {
// 					Kakao.API.request({
// 						url : "/v2/user/me",
// 						success : function(result) {
// 							var info = JSON.stringify(result);
// 							$(location).attr('href',
// 									'/users/kakao?kakao=' + result.id);
// 						}
// 					});
// 					Kakao.Auth.getAccessToken();
// 				},
// 				fail : function(err) {
// 					alert(JSON.stringify(err));
// 					alert("�α��� ����")
// 				}
// 			})
// 		}
		

		$(function() {

			$(document).ready(function(){
		
				var id=$("#registId").val();
				var msgId=JSON.stringify({id:id});
// 				alert(id);
// 				alert(msgId);
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/message/json/getUnreadMessage",
					data : msgId,
					datatype : "json",
					success : function(response){
						if(id!=null && $.trim(response.result)==0){
// 							alert($.trim(response.result));
							$(".msg").hide();
						}
						if(id!=null && $.trim(response.result)==1){
// 							alert($.trim(response.result));
							$(".msg").show();
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
	
				});
				
			});

		});

		
// 		$(function(){
// 			$("#googleLogout").on("click", function(){
// 				var auth2=gapi.auth2.getAuthInstance();
// 				auth2.setToken(null);
// 				auth2.signOut();
// 			});
// 		})


	</script>
	
  </body>
</html>
    
    