<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    

	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">ȸ����������</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" id="id" name="id" value="${ user.id }">
		  <div class="form-group">
		    <label for="pw" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="pw" name="pw" value="${user.pw}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="pw2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="pw2" name="pw2" value="${ user.pw }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${ user.email }">
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
					<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
					<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
					<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
					<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
				<input type="text" class="form-control" id="phone2" name="phone2" placeholder="���Է½� ���� ���ʿ�">
		    </div>
		    <div class="col-sm-2">
				<input type="text" class="form-control" id="phone3" name="phone3">
		    </div>
			<input type="hidden" value="${ user.phone }" name="phone"/>
		    <div id="authButton" style="display:none">
				<input type="text" id="checkAuth"/>
				<input type="button" id="authClick" value="����"/>
		    </div>
 		    <input type="button" id="authPhone" name="authPhone" value="�����ϱ�">
 		    <input type="hidden" id="authKeyReturn">
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control"id="sample6_postcode" placeholder="������ȣ" readonly="readonly">
		    </div>
		      
		      <div class="col-sm-2">
			  <input type="button" class="form-control" onclick="execDaumPostcode()" value="������ȣ ã��"><br>
			  </div>
		  </div>
		  
		<div class="form-group">
		  <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
		  <div class="col-sm-4">
		      <input type="text" class="form-control" id="userAddr" name="userAddr" placeholder="�ּ�" value="${ user.userAddr }" readonly="readonly">
		      <br>
			  <input type="text" class="form-control"  id="sample6_extraAddress" placeholder="�����׸�">
			  <input type="text" class="form-control" id="sample6_detailAddress" placeholder="���ּ�">
			  </div>
		   </div>
		  
		  <div class="form-group">
		    <label for="account" class="col-sm-offset-1 col-sm-3 control-label">���¹�ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="account" name="account" value="${ user.account }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="birthDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="birthDate" name="birthDate" value="${ user.birthDate }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <input type="submit" id="submit" class="btn btn-primary" value="��&nbsp;��">
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>


	    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
		$(function() {
			
			$( "#submit" ).on("click" , function() {
				var value = "";	
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
				}

				$("input:hidden[name='phone']").val( value );
				
				$("form").attr("method" , "POST").attr("action" , "/users/updateUsers");
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
						alert(status);
						alert(authPhone.authKey);
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
					alert("�����Ǿ����ϴ�.");
				}else{
					alert("������ȣ�� ���� �ʽ��ϴ�.");
				}
			})
		});
		
		
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			    	return;
			     }
			});
			 
		});
		 
			function execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			        	 // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

			            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
			            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
			            var userAddr = ''; // �ּ� ����
			            var extraAddr = ''; // �����׸� ����

			            //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
			            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
			                userAddr = data.roadAddress;
			            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
			                userAddr = data.jibunAddress;
			            }

			            // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
			            if(data.userSelectedType === 'R'){
			                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
			                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
			                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
			                    extraAddr += data.bname;
			                }
			                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
			                if(extraAddr !== ''){
			                    extraAddr = ' (' + extraAddr + ')';
			                }
			                // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
			                document.getElementById("sample6_extraAddress").value = extraAddr;
			            
			            } else {
			                document.getElementById("sample6_extraAddress").value = '';
			            }

			            // ������ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
			            document.getElementById('sample6_postcode').value = data.zonecode;
			            document.getElementById("userAddr").value = userAddr;
			            // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
			            document.getElementById("sample6_detailAddress").focus();
			        }
			    }).open();
			    }
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
	</script>
 	
</body>

</html>