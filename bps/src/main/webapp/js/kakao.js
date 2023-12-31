/**
 * 
 */






// 2. 카카오 초기화
Kakao.init('619243d23a558af00f15b3f83ec54bfb');
console.log(Kakao.isInitialized()); // 초기화 판단여부

// 3. 데모버전으로 들어가서 카카오로그인 코드를 확인.
function loginWithKakao() {
	Kakao.Auth.login({
		success: function(authObj) {
			// access토큰 값
			Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장


			getInfo();


		},
		fail: function(err) {
			console.log(err);
		}
	});
}



// 4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
function getInfo() {
	Kakao.API.request({
		url: '/v2/user/me',
		success: function(res) {
			console.log(res);
			// 이메일, 성별, 닉네임, 프로필이미지
			let email = res.kakao_account.email;
	
			let name = res.kakao_account.name;
			let phone = res.kakao_account.phone_number;


			console.log(email, name, phone);



			const inputData = name;
			const emailadress1 = email.split('@')[0];
			const emailadress2 = email.split('@')[1];
			const phoneNum1 = phone.split('-')[0].split(" ")[1];
			const phoneNum2 = phone.split('-')[1];
			const phoneNum3 = phone.split('-')[2];
			
			
			sessionStorage.setItem("이름", inputData);
			sessionStorage.setItem("메일1", emailadress1);
			sessionStorage.setItem("메일2", emailadress2);
			sessionStorage.setItem("번호1", "0" + phoneNum1);
			sessionStorage.setItem("번호2", phoneNum2);
			sessionStorage.setItem("번호3", phoneNum3);
			
			$.ajax({
				url: "kakaoIdCheck",
				type: "get",
				data: { userId: emailadress1 },
				dataType :"json",
				//dataType --> success 했을 때 받아올 결과값의 자료형을 의미
				success: function(result) {
					

					if (result == 0) {
						alert('승인되지 않은 아이디입니다.');
						location.href = 'http://localhost:8090/bps/goLogin'


					} else if (result == 1) {
						console.log(inputData);
						alert('존재하지않는아이디입니다.');
						window.location.href = 'http://localhost:8090/bps/goEmpSingIn'
						
					} else {
						
						let Email = emailadress1+"@"+emailadress2
						let pw = result.pw
						createHiddenLoginForm(Email, pw);
						
						sessionStorage.setItem("이름", inputData);
						sessionStorage.setItem("메일1", emailadress1);
						sessionStorage.setItem("메일2", emailadress2);
						sessionStorage.setItem("번호1", "0" + phoneNum1);
						sessionStorage.setItem("번호2", phoneNum2);
						sessionStorage.setItem("번호3", phoneNum3);

						//location.href = 'goMain'
					}

				},
				error: function() {
					alert('존재하지않는아이디입니다.');
						window.location.href = 'http://localhost:8090/bps/goEmpSingIn'
				}
			})





		},
		fail: function(error) {
			alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
		}
	});
}

function createHiddenLoginForm(Email, pw){
	
	
	
	console.log(Email, pw);
	var frm = document.createElement('form');
	frm.setAttribute("charset", "UTF-8");
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', 'Login');
	
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','id');
	hiddenInput.setAttribute('value',Email);
	frm.appendChild(hiddenInput);
	
	hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','pw');
	hiddenInput.setAttribute('value',pw);
	
	frm.appendChild(hiddenInput);
	
	document.body.appendChild(frm);
	frm.submit();
	
}


// 5. 로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행.
function kakaoLogout() {
	if (!Kakao.Auth.getAccessToken()) {
		alert('Not logged in.');
		return;
	}
	Kakao.Auth.logout(function() {
		alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
	});
}






