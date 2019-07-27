<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/register.css">
    
    


</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        

	
    <header class="header">
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>
    </header>

<!--====================================================
                        PAGE CONTENT
======================================================-->
	<br/>
	<br/>
	<br/>
    <div class="page-content d-flex align-items-stretch">

            <!--***** CONTENT *****-->     


                <!--***** USER INFO *****-->
                <div class="col-md-3">
                </div>
                <div class="col-md-6 login-card">
                    <div class="card form" id="form1">
                        <div class="card-header" align="center">
                            <h3><i class="fa fa-user-circle"></i>회원가입</h3>
                        </div>
                        <br>
                        <form class="addUsersForm" style="padding-left: 90px;">
							<input type="hidden" id="id" name="id" value=${ sessionScope.user.id }>
							<input type="hidden" name="levels" value="브론즈">
							<input type="hidden" name="levelPoint" value=100>                        
                            <div class="row">
                                <div class="col-md-10">
                                
                                    <div class="form-group">
                                        <label for="email">이 메 일</label>
									    <div>
									      <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Email">
									      <div id="mailAuth" style="display:none">
									      	<input type="text" id="checkMail"/>
									      	<input type="button" id="mailClick" value="전송"/>
									      </div>
									      <input type="button" id="authMail" name="authMail" value="인증하기">
									    </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="phone">휴대전화번호</label>
                                        <div>
	                                        <div class="col-sm-4" style="float:left; padding-left:0">
												<select class="form-control" name="phone1" id="phone1">
												  	<option value="010" >010</option>
													<option value="011" >011</option>
													<option value="016" >016</option>
													<option value="018" >018</option>
													<option value="019" >019</option>
												</select>
	                                        </div>
										    <div class="col-sm-4" style="float:left;">
										      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="Enter Your">
										    </div>
										    <div class="col-sm-4" style="float:left; padding-right:0">
										      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="Phone Number">
										    </div>
										    <input type="hidden" name="phone"/>
										    <div id="authButton" style="display:none">
										   		<input type="text" id="checkAuth"/>
										    	<input type="button" id="authClick" value="전송"/>
										    </div>
								 		    <input type="button" id="authPhone" name="authPhone" value="인증하기">
									    </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="userAddr">자택주소</label>
                                        <div>
											<div class="col-sm-6" style="float:left; padding-left: 0">
												<input type="text" class="form-control"id="sample6_postcode" placeholder="Find Your Address" readonly="readonly">
											</div>
			      
											<div class="col-sm-6" style="float:left; padding-right: 0;">
												<input type="button" class="form-control btn btn-general btn-blue mr-2" 
												style="margin:0;" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
											</div>
										</div>
                                    </div> 
                                    
                                    <div class="form-group">
										<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
										<div class="col-sm-12" style="padding: 0;">
											<input type="text" class="form-control" id="userAddr" name="userAddr" placeholder="주소" readonly="readonly">
											<br>
											<input type="text" class="form-control"  id="sample6_extraAddress" placeholder="참고항목">
											<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
										</div>
                                    </div>
                                    
                                    <div class="form-group">
                                    	<div class="col-sm-6" style="float: left; padding-left: 0;">
											<label for="birthDate">생 년 월 일</label>                                        
											<input type="text" class="form-control" id="birthDate" name="birthDate" aria-describedby="emailHelp" placeholder="Enter BirthDate">
                                        </div>
                                        <div class="col-sm-6" style="float: left; padding-right: 0;">
                                        	<label for="gender">성 별</label> 
											<select class="form-control" name="gender" id="gender">
												<option value="m">남자</option>
												<option value="f">여자</option>
											</select>
										</div>
                                    </div>
                                    
                                    
                                </div>
                            </div> 
							<br/>
							<br/>
							<br/>
                            <button type="submit" id="submit" class="btn btn-general btn-blue mr-2">회원가입</button>
                            <button type="submit" id="addition" class="btn btn-general btn-blue mr-2">추가정보입력</button>
                            <button type="reset" id="reset" class="btn btn-general btn-white">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button> 
                 	       <br/>
                 	       <br/>
                 	       <br/>
                        </form>

                    </div>
  
            </div> 

    </div> 
    	<jsp:include page="/layout/footer.jsp"></jsp:include>

    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
    
    <!--Core Javascript -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
			$(function() {
			
			$( "#submit" ).on("click" , function() {
				var value = "";	
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
				}

				$("input:hidden[name='phone']").val( value );
				
				$("form[name=formal]").attr("method" , "POST").attr("action" , "/users/addUsersAdditional");
				
				alert("인증회원으로 가입되셨습니다!");
			});
		});	
		
		$(function(){
		
			$("#authPhone").on("click", function(){
				var value = "";	
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
				}

				$("input:hidden[name='phone']").val( value );
				
				var check=$("input:hidden[name='phone']").val();
				
				$.ajax({
					
					url:"/users/json/sendSMS",
					method:"POST",
					data:JSON.stringify({
						phone:check
					}),
					headers: {
						"accept":"application/json",
						"content-type":"application/json"
					},
					success:function(authPhone, status){
// 						alert(status);
// 						alert(authPhone.authKey);
						$("#authKeyReturn").val(authPhone.authKey);
						$("#authButton").show();
					}
					
				})

			})
			
		});
		
		$(function() {
			$("#authClick").on("click", function(){
				if($("#checkAuth").val()==$("#authKeyReturn").val()){
					$("#authButton").hide();
					$("#authPhone").hide();
					alert("인증되었습니다.");
				}else{
					alert("인증번호가 맞지 않습니다.");
				}
			})
		});
		
		
		$(function(){
			
			$("#authMail").on("click", function(){

				var check=$("input[name='email']").val();

					$.ajax({
						
						url:"/users/json/mailSender",
						method:"POST",
						data:JSON.stringify({email:check}),
						headers: {
							"accept":"application/json",
							"content-type":"application/json"
						},
						success:function(authMail, status){
// 							alert(status);
// 							alert(authMail.authKey);
							$("#authKeyReturn").val(authMail.authKey);
							$("#mailAuth").show();
						}
									
					})
		
				})
					
			});

			$(function() {
				$("#mailClick").on("click", function(){
					if($("#checkMail").val()==$("#authKeyReturn").val()){
						$("#authMail").hide();
						$("#mailAuth").hide();
						alert("인증되었습니다.");
					}else{
						alert("인증번호가 맞지 않습니다.");
					}
				})
			});
		
		
			$(function() {
			 
				$("input[name='email']").on("change" , function() {
				
					var email=$("input[name='email']").val();
			    
					if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
						alert("이메일 형식이 아닙니다.");
						return;
					}
				});
			 
			});
		 
			function execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			        	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var userAddr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수

			            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                userAddr = data.roadAddress;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                userAddr = data.jibunAddress;
			            }

			            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			            if(data.userSelectedType === 'R'){
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraAddr !== ''){
			                    extraAddr = ' (' + extraAddr + ')';
			                }
			                // 조합된 참고항목을 해당 필드에 넣는다.
			                document.getElementById("sample6_extraAddress").value = extraAddr;
			            
			            } else {
			                document.getElementById("sample6_extraAddress").value = '';
			            }

			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('sample6_postcode').value = data.zonecode;
			            document.getElementById("userAddr").value = userAddr;
			            // 커서를 상세주소 필드로 이동한다.
			            document.getElementById("sample6_detailAddress").focus();
			        }
			    }).open();
			    }
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	

	</script>	


</body>

</html>