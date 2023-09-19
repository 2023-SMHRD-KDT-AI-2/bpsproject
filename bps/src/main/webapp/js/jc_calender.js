const presentDate = {
    year: (new Date()).getFullYear(),
    month: (new Date()).getMonth()+1,
    day: (new Date()).getDate()
}
class month {
    constructor(year, month) {
        const inputDate = new Date(year, month-1);
        const firstDayOfWeek = inputDate.getDay();
        console.log(firstDayOfWeek);
        const dateArray = (Array(6).fill(0).map((_,week) => {
            return {
                date: Array(7).fill(0).map((_,j) => {
                    const temp = new Date(inputDate);
                    temp.setDate(temp.getDate()+(7*week+j)-firstDayOfWeek);
                    return temp
                })
            };
        }));

        this.dateArray = dateArray;
    }
}

// Main Container
const container = document.querySelector("#jongco-calender");


// Main Table
const mainTable = document.createElement('table');
mainTable.setAttribute('class', 'jc-cal-t');


// Year Elements =============================================
// Year Controller Container
const yearController = document.createElement('div');
yearController.setAttribute('class', 'jc-cal-controller');
container.appendChild(yearController);

// Year Controller Buttons
const yearPrevBtn = document.createElement('button');
yearPrevBtn.textContent = '<'
yearPrevBtn.setAttribute('class', 'jc-cal-npbtn');
yearPrevBtn.onclick = () => {
    presentDate.year -= 1;
    clickDate(presentDate.year, presentDate.month, presentDate.day);
    render();
}
const yearNextBtn = document.createElement('button');
yearNextBtn.textContent = '>'
yearNextBtn.onclick = () => {
    presentDate.year += 1;
    clickDate(presentDate.year, presentDate.month, presentDate.day);
    render();
}
yearNextBtn.setAttribute('class', 'jc-cal-npbtn');

// Year Label
const yearLabel = document.createElement('h3');
yearLabel.setAttribute('class', 'jc-cal-mg-hor');

yearController.appendChild(yearPrevBtn);
yearController.appendChild(yearLabel);
yearController.appendChild(yearNextBtn);
// Year Elements =============================================


// Month Elements =============================================
// Month Controller Container
const monthController = document.createElement('div');
monthController.setAttribute('class', 'jc-cal-controller');
container.appendChild(monthController);

// month Controller Buttons
const monthPrevBtn = document.createElement('button');
monthPrevBtn.textContent = '<';
monthPrevBtn.onclick = () => {
    presentDate.month -= 1;
    clickDate(presentDate.year, presentDate.month, presentDate.day);
    render();
}
monthPrevBtn.setAttribute('class', 'jc-cal-npbtn');
const monthNextBtn = document.createElement('button');
monthNextBtn.textContent = '>'
monthNextBtn.onclick = () => {
    presentDate.month += 1;
    clickDate(presentDate.year, presentDate.month, presentDate.day);
    render();
}
monthNextBtn.setAttribute('class', 'jc-cal-npbtn');

const monthLabel = document.createElement('h3');
monthLabel.setAttribute('class', 'jc-cal-mg-hor');
container.appendChild(monthLabel);

monthController.appendChild(monthPrevBtn);
monthController.appendChild(monthLabel);
monthController.appendChild(monthNextBtn);
// Month Elements =============================================


/*
// Day Elements =============================================
const dayLabel = document.createElement('h3');
dayLabel.setAttribute('class', 'jc-cal-controller');
container.appendChild(dayLabel);
// Day Elements =============================================
*/



["일","월","화","수","목","금","토"].forEach((item) => {
    const weekDoc = document.createElement('th')
    weekDoc.setAttribute('class', 'jc-cal-th');
    if(item === "토") weekDoc.setAttribute('class', weekDoc.getAttribute('class') + ' jc-cal-color-sat');
    if(item === "일") weekDoc.setAttribute('class', weekDoc.getAttribute('class') + ' jc-cal-color-sun');
    weekDoc.textContent = item;
    mainTable.appendChild(weekDoc);
});

const weekRows = Array(6).fill(0).map(()=>({
    dom: document.createElement('tr'),
    dayDataDoms: Array(7).fill(0).map(()=>(document.createElement('td')))
}))

weekRows.forEach((tr) => {
    tr.dayDataDoms.forEach((td, i) => {
        td.setAttribute('class', 'jc-cal-td');
        if(i === 0) td.setAttribute('class', td.getAttribute('class') + ' jc-cal-sun');
        if(i === 6) td.setAttribute('class', td.getAttribute('class') + ' jc-cal-sat');
        tr.dom.appendChild(td);
    })

    tr.dom.setAttribute('class', 'jc-cal-tr');
    mainTable.appendChild(tr.dom);
});

// ========================================================
// ========================================================
// ========================================================
// ========================================================
// ========================================================
function clickDate(year, month, day) {
    //TODO : do something
    presentDate.year = year;
    presentDate.month = month;
    presentDate.day = day;
    console.log(year, month, day);
    render();
    
    $("#schedule-table-body").empty();
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
    		$("#schedule-table-body").append($(`
        		<tr class="detail_infomation">
            		<td>
                		<span id="view_out">`+item.id+`</span>
               		 	<span id="View_out"> | </span>
               		 	<span>`+item.title+`</span>
                		<div class="del_btn_location">
                    		<button class="btn btn-sm schedule-delete-btn"><i class="fa fa-times"></i></button>
                		</div>
            		</td>
        		</tr>
    		`).click((e) => {
				window.location.href = "goScheduleDetail?num="+e.target.children[0].textContent;
			}));
		})
		const schedule_delete_btn = document.getElementsByClassName('schedule-delete-btn')
		Array.from(schedule_delete_btn).forEach((item, i) => {
			item.addEventListener('click', async (e) => {
				const confirmResult = confirm("정말로 삭제하시겠습니까?");
				
				if(confirmResult === true) {
					const response = await fetch("/bps/api/schedule/delete?id="+detail_infomation.item(i).children[0].children[0].textContent);
					clickDate(presentDate.year ,presentDate.month ,presentDate.day);
					alert("일정을 삭제하였습니다.");
				}
			})
		});
	})
}
// ========================================================
// ========================================================
// ========================================================
// ========================================================
// ========================================================



function render(){
    const targetMonth = new month(presentDate.year, presentDate.month);
    if(presentDate.month > 12) {
		presentDate.month = 1;
		presentDate.year += 1;
	}
	
	if(presentDate.month < 1) {
		presentDate.month = 12;
		presentDate.year -= 1;
	}
    
    targetMonth.dateArray.forEach((item,i) => {
        item.date.forEach((d,j) => {
            weekRows[i].dayDataDoms[j].textContent = d.getDate();
            weekRows[i].dayDataDoms[j].classList.remove('jc-cal-td-selected');
            if(d.getMonth()+1 == presentDate.month && d.getDate() == presentDate.day){
				weekRows[i].dayDataDoms[j].classList.add('jc-cal-td-selected');
			}
            weekRows[i].dayDataDoms[j].onclick = (e) => {
                const year = d.getFullYear();
                const month = d.getMonth()+1;
                const day = d.getDate();
                clickDate(year, month, day);
            };
        });
    });

    yearLabel.textContent = presentDate.year + "년";
    monthLabel.textContent = presentDate.month + "월";
    //dayLabel.textContent = presentDate.day + "일";
    
    console.log("calender rendered");
}

container.appendChild(mainTable);
render();
