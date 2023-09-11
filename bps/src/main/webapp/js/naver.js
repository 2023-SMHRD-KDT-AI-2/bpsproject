/**
 * 
 */




	
let naverLogin = new naver.LoginWithNaverId(

	{

		clientId: "CY5jOjW2akZvHodFiPj0", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: 'http://localhost:8090/bps/goEmpSingIn', // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup: false,
		callbackHandle: true

	}
);


naverLogin.init();

