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
].join("")).then((res) => {
	return res.json()
}).then((json) => {
	json.result.forEach((item) => {
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