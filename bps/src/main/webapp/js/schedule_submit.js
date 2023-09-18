const scheduleDepartment = $("#schedule-department");
const scheduleName = $("#schedule-name");
const scheduleEmployeeID = $("#schedule-empid");
const scheduleTitle = $("#schedule-title");
const scheduleDetail = $("#schedule-detail");
const scheduleSubmitBtn = $("#schedule-submit");

scheduleSubmitBtn.click(async () => {
	const urlParam = new URLSearchParams(location.search);
	const addDate = urlParam.get("year") + "-" + urlParam.get("month") + "-" + urlParam.get("day");
	
	const stringQueryArray = [
		"?department=",
		scheduleDepartment.val(),
		"&name=",
		scheduleName.val(),
		"&empid=",
		scheduleEmployeeID.val(),
		"&title=",
		scheduleTitle.val(),
		"&detail=",
		scheduleDetail.val(),
		"&adddate=",
		addDate
	];
	
    const response = await fetch("/bps/api/schedule/insert"+stringQueryArray.join(""));
    const jsonData = await response.json();
    
    alert("등록이 완료되었습니다");
    window.location.href = "goSchedule";
})

