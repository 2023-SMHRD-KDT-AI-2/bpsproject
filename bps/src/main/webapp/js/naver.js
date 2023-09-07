/**
 * 
 */

let naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "CY5jOjW2akZvHodFiPj0", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: "http://localhost:8090/bps/goEmpSingIn", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
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
                   const phoneNum1 = phone.split('-')[0].substr(-2,2);
                   const phoneNum2 = phone.split('-')[1];
                   const phoneNum3 = phone.split('-')[2];

                   sessionStorage.setItem("이름", inputData);
                   sessionStorage.setItem("메일1", emailadress1);
                    sessionStorage.setItem("메일2", emailadress2);
                   sessionStorage.setItem("번호1", "0"+phoneNum1);
					sessionStorage.setItem("번호2", phoneNum2);
					sessionStorage.setItem("번호3", phoneNum3);
			
			
			console.log(naverLogin.user);
			
 			
			
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