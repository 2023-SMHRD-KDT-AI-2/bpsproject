

let naverLogin = new naver.LoginWithNaverId(


	{

		clientId: "CY5jOjW2akZvHodFiPj0", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: 'http://localhost:8090/bps/goLogin', // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup: false,
		callbackHandle: true

	}
);

naverLogin.init();




window.addEventListener('load', function() {


	naverLogin.getLoginStatus(function(status) {

		if (status) {

			console.log(naverLogin.user);
			let email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			let name = naverLogin.user.getName();
			let phone = naverLogin.user.getMobile();

			const inputData = name;
			const emailadress1 = email.split('@')[0];
			const emailadress2 = email.split('@')[1];
			const phoneNum1 = phone.split('-')[0].substr(-2, 2);
			const phoneNum2 = phone.split('-')[1];
			const phoneNum3 = phone.split('-')[2];

			console.log(emailadress1)
			$.ajax({
				url: "kakaoIdCheck",
				type: "get",
				data: { userId: emailadress1 },
				dataType: "json",
				
				//dataType --> success 했을 때 받아올 결과값의 자료형을 의미
				success: function(result) {
						console.log(result)

					if (result == 0) {
						location.href = 'http://localhost:8090/bps/goLogin'
						alert('승인되지 않은 아이디입니다.');

						
					} else if (result == 1) {
						location.href = 'http://localhost:8090/bps/goEmpSingIn'
						alert('존재하지않는아이디입니다.');
						return;
					} else {

						let Email = emailadress1 + "@" + emailadress2
						let pw = result.pw
						createHiddenLoginForm(Email, pw);

						sessionStorage.setItem("이름", inputData);
						sessionStorage.setItem("메일1", emailadress1);
						sessionStorage.setItem("메일2", emailadress2);
						sessionStorage.setItem("번호1", "0" + phoneNum1);
						sessionStorage.setItem("번호2", phoneNum2);
						sessionStorage.setItem("번호3", phoneNum3);


					}

				},
				error: function() {
					alert('존재하지않는아이디입니다!.');
					//location.href = 'http://localhost:8090/bps/goEmpSingIn'
					return;
				}
			})




			sessionStorage.setItem("이름", inputData);
			sessionStorage.setItem("메일1", emailadress1);
			sessionStorage.setItem("메일2", emailadress2);
			sessionStorage.setItem("번호1", "0" + phoneNum1);
			sessionStorage.setItem("번호2", phoneNum2);
			sessionStorage.setItem("번호3", phoneNum3);

			let name1 = sessionStorage.getItem("이름");
			let email1 = sessionStorage.getItem("메일1");
			let email2 = sessionStorage.getItem("메일2");
			let phone1 = sessionStorage.getItem("번호1");
			let phone2 = sessionStorage.getItem("번호2");
			let phone3 = sessionStorage.getItem("번호3");




			$('input[name=inputName]').attr('value', name1);
			$('input[name=inputEmail1]').attr('value', email1);
			$('input[name=inputEmail2]').attr('value', email2);
			$('input[name=inputPhone1]').attr('value', phone1);
			$('input[name=inputPhone2]').attr('value', phone2);
			$('input[name=inputPhone3]').attr('value', phone3);



			if (email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}

		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});

});

function createHiddenLoginForm(Email, pw) {



	console.log(Email, pw);
	var frm = document.createElement('form');
	frm.setAttribute("charset", "UTF-8");
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', 'Login');

	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type', 'hidden');
	hiddenInput.setAttribute('name', 'id');
	hiddenInput.setAttribute('value', Email);
	frm.appendChild(hiddenInput);

	hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type', 'hidden');
	hiddenInput.setAttribute('name', 'pw');
	hiddenInput.setAttribute('value', pw);

	frm.appendChild(hiddenInput);

	document.body.appendChild(frm);
	frm.submit();

}



var testPopUp;
function openPopUp() {
	testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp() {
	testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
	}, 1000);


}