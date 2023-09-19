const testData = [
    {
        scheduleId: 248,
        scheduleTitle: "밥먹기"
    },
    {
        scheduleId: 182,
        scheduleTitle: "잠자기"
    },
    {
        scheduleId: 433,
        scheduleTitle: "코딩하기"
    },
    {
        scheduleId: 875,
        scheduleTitle: "방치우기"
    },
    {
        scheduleId: 112,
        scheduleTitle: "딸딸쮸 한우사주기"
    },
]

const scheduleArray = [];

const scheduleTableBody = $("#schedule-table-body");

fetch("/bps/api/schedule/read"+[
	"?searchdate=",
	presentDate.year,
	"-",
	presentDate.month,
	"-",
	presentDate.day
].join("")).then((res) => {  //이 then이라는건, 요청한 뒤 응답을 받았을 때 실행됨.
	return res.json() //나는 json형태의 문자열로 보냈으니, json으로 변환할거임.
}).then((json) => { //이것도 then인데, 이건 그냥 json으로 바꾸는게 성공하면 실행될거임. 이건... 익숙해지는 수 밖에..
	json.result.forEach((item) => { //보면 알다시피, json 데이터 내부에는 result안에 배열을 집어넣고 줌. 이건 파악한거같다. ㅁㅈ? 
    	scheduleTableBody.append($(`
        	<tr class="detail_infomation">
            	<td>
                	<span>`+item.id+`</span>
                	<span> | </span>
                	<span>`+item.title+`</span>
                	<div class="del_btn_location">
                    	<button class="btn btn-sm"><i class="fa fa-times"></i></button>
                	</div>
            	</td>
        	</tr>
    	`));
	})
})

const detail_infomation = document.getElementsByClassName('detail_infomation')


Array.from(detail_infomation).forEach((item)=>{
	item.addEventListener('click', (e) => {
		window.location.href = "goScheduleDetail?num="+e.target.children[0].textContent;
	})
})
      
const addScheduleBtn = document.getElementById('schedule_plus_btn');
addScheduleBtn.onclick = ()=>{
	console.log("a");
	window.location.href = "goScheduleSubmit?year="+presentDate.year+"&month="+presentDate.month+"&day="+presentDate.day
};