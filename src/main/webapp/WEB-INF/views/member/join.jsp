<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
td {
	border: 1px solid #000000;
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
//모든 공백 체크 정규식 
var empJ = /\s/g; 
//아이디 정규식 
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
// 비밀번호 정규식 
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
// 이름 정규식 
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
// 이메일 검사 정규식 
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
// 휴대폰 번호 정규식 
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/ 
var birthJ = false; 
var address = $('#mem_detailaddress');

$(document).ready(function() { 
	var address = $('#mem_detailaddress');
	//아이디 중복확인 
	$("#mem_id").blur(function() { 
		if($('#mem_id').val()==''){ 
			$('#id_check').text('아이디를 입력하세요.'); 
			$('#id_check').css('color', 'red'); 
			} else if(idJ.test($('#mem_id').val())!=true){ 
				$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.'); 
				$('#id_check').css('color', 'red'); 
				} else if($('#mem_id').val()!=''){ 
					var mem_id=$('#mem_id').val(); 
					$.ajax({ async : true, type : 'POST', data : mem_id,
						url : 'idcheck.do', 
						dateType: 'json', 
						contentType: "application/json; charset=UTF-8", 
						success : function(data) { 
		 if(data.cnt > 0){ 
			 $('#id_check').text('중복된 아이디 입니다.'); 
			 $('#id_check').css('color', 'red'); 
			 $("#usercheck").attr("disabled", true); 
			 }else{ 
				 if(idJ.test(mem_id)){ 
					 $('#id_check').text('사용가능한 아이디 입니다.'); 
					 $('#id_check').css('color', 'blue'); 
					 $("#usercheck").attr("disabled", false); 
			    } else if(mem_id==''){ 
				     $('#id_check').text('아이디를 입력해주세요.'); 
				     $('#id_check').css('color', 'red'); 
				     $("#usercheck").attr("disabled", true); 
				 } else{ 
					 $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다."); 
					 $('#id_check').css('color', 'red'); 
					 $("#usercheck").attr("disabled", true); 
					 } 
				 } 
		 }
						}); 
					} 
		});
	
	$('form').on('submit',function(){ 
		var inval_Arr = new Array(8).fill(false); 
		if (idJ.test($('#mem_id').val())) { 
			inval_Arr[0] = true; 
		} else { 
			inval_Arr[0] = false; 
			alert('아이디를 확인하세요.'); 
			return false; } 
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#mem_pw').val() == ($('#mem_pw2').val())) 
				&& pwJ.test($('#mem_pw').val())) { 
			inval_Arr[1] = true; 
			} else { 
			inval_Arr[1] = false; 
			alert('비밀번호를 확인하세요.'); 
			return false; 
			} 
		// 이름 
		if (nameJ.test($('#mem_name').val())) { 
			inval_Arr[2] = true; 
			} else { 
			inval_Arr[2] = false; 
			alert('이름을 확인하세요.'); 
			return false; 
			} 
		// 생년월일 
		if (birthJ) { 
			console.log(birthJ); 
			inval_Arr[3] = true; 
		} else { 
			inval_Arr[3] = false; 
			alert('생년월일을 확인하세요.'); 
			return false; 
			} 
		// 이메일 
		if (mailJ.test($('#mem_email').val())){ 
			console.log(phoneJ.test($('#mem_email').val())); 
			inval_Arr[4] = true; 
		} else { 
			inval_Arr[4] = false; 
			alert('이메일을 확인하세요.'); 
			return false; 
			} 
		// 휴대폰번호 
		if (phoneJ.test($('#mem_phone').val())) { 
			console.log(phoneJ.test($('#mem_phone').val())); 
			inval_Arr[5] = true; 
		} else { 
			inval_Arr[5] = false; 
			alert('휴대폰 번호를 확인하세요.'); 
			return false; 
			} 
		//주소확인
		if(address.val() == ''){ 
			inval_Arr[7] = false; 
			alert('주소를 확인하세요.'); 
			return false; 
		}else 
			inval_Arr[7] = true; 
		//전체 유효성 검사
		var validAll = true; 
		for(var i = 0; i < inval_Arr.length; i++){ 
			if(inval_Arr[i] == false){ 
				validAll = false; 
				} 
			} 
		if(validAll == true){  
			alert('Tain 회원가입 완료.'); 
		} else{ 
			alert('정보를 다시 확인하세요.') 
			} 
		});
	$('#mem_id').blur(function() { 
		if (idJ.test($('#mem_id').val())) { 
			console.log('true'); 
			$('#id_check').text(''); 
			} else { 
				console.log('false'); 
				$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'); 
				$('#id_check').css('color', 'red'); 
				} 
		}); 
	$('#mem_pw').blur(function() { 
		if (pwJ.test($('#mem_pw').val())) { 
			console.log('true'); 
			$('#pw_check').text(''); } else { console.log('false'); 
			$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.'); 
			$('#pw_check').css('color', 'red'); } }); 
	//1~2 패스워드 일치 확인 
	$('#mem_pw2').blur(function() { 
		if ($('#mem_pw').val() != $(this).val()) { 
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.'); 
			$('#pw2_check').css('color', 'red'); } 
		else { 
			$('#pw2_check').text(''); 
			} 
		});
	}


	</script>
</head>

<body>
	<article class="container">
		<div class="join_header">
			<div class="col_md col_md_3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col_sm col_md_3">
			<form action="/member/join.do" method="post" rale="from" id="usercheck"
				name="member">
				<div class="form_group">
					<label for="id">아이디</label> <input type="text" class="form_control"
						id="mem_id" placeholder="ID">
					<div class="check_font" id="id_check"></div>
				</div>
				<div class="form_group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form_control" id="mem_pw" name="mem_pw"
						placeholder="PASSWARD">
					<div class="check_font" id="pw_check"></div>
				</div>
				<div class="form_group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form_control" id="mem_pw2" name="mem_pw2"
						placeholder="Confirm Password">
					<div class="check_font" id="pw2_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_name">이름</label> <input type="text"
						class="form_control" id="mem_name" name="mem_name"
						placeholder="Name">
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form-group">
					<label for="mem_birth">생년월일</label> <input type="tel"
						class="form_control" id="mem_birth" name="mem_birth"
						placeholder="ex) 19990101">
					<div class="check_font" id="birth_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_email">이메일 주소</label> <input type="email"
						class="form_control" id="mem_email" name="mem_email"
						placeholder="E-mail">
					<div class="check_font" id="email_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input
						type="tel" class="form_control" id="mem_phone" name="mem_phone"
						placeholder="Phone Number">
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="form_group">
					<input class="form_control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="mem_oaddress" id="mem_oaddress"
						type="text" readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form_group">
					<input class="form_control" style="top: 5px;" placeholder="도로명 주소"
						name="mem_address" id="mem_address" type="text"
						readonly="readonly" />
				</div>
				<div class="form_group">
					<input class="form_control" placeholder="상세주소"
						name="mem_detailaddress" id="mem_detailaddress" type="text" />
				</div>
				<div class="form_group text_center">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</article>
</body>
</html>