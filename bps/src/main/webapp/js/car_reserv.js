/**
 * 
 */
function userInformationFormGenerator() {
    const userInfomationForm = $(
        `<div class='hr-flex'>
            <div class="form-floating mb-1 w-100">
                <select class="form-select" id="floatingSelect"
                    aria-label="Floating label select example">
                    <option value="1">영업팀</option>
                    <option value="2">개발팀</option>
                    <option value="3">인사팀</option>
                </select>
                <label for="floatingSelect">부서</label>
            </div> 
            <div class="form-floating mb-1 w-100">
                <select class="form-select" id="floatingSelect"
                    aria-label="Floating label select example">
                    <option value="1">사원</option>
                    <option value="2">대리</option>
                    <option value="4">과장</option>
                    <option value="5">부장</option>
                </select>
                <label for="floatingSelect">계급</label>
            </div> 
            <div class='form-floating mb-3 w-100'>
                <input type='email' class='form-control' id='floatingInput'placeholder='name@example.com'>
                <label for='floatingInput'>사번</label>
            </div> 
            <div class='form-floating mb-3 w-100'>
                <input type='text' class='form-control' id='floatingPassword'placeholder='Password'>
                <label for='floatingPassword'>이름</label>
            </div>
        </div>`
    );
    
    const userInformationDeleteBtn = $(
        `<button type='button' class='btn btn-square btn-outline-danger m-2'>x</button>`
        
    )

    userInfomationForm.append(userInformationDeleteBtn);

    userInformationDeleteBtn.on('click', function(){
        userInfomationForm.remove()
    })

    return userInfomationForm;
}


$('#new-form').on('click',function() {
    let newParagraph = userInformationFormGenerator();

    $('.enter-information').append(newParagraph)
    
})

let carList = [
    {
        name: "포르쉐",
        carName: "911 gt2rs",
        number: "249두 6236"
    },
    {
        name: "페라리",
        carName: "라페라리",
        number: "34어 8250"
    },
    {
        name: "롤스로이스",
        carName: "고스트",
        number: "245어 9911"
    },
    {
        name: "람보르기니",
        carName: "아벤타도르",
        number: "79무 5996"
    },
    {
        name: "파가니",
        carName: "존다",
        number: "37호 3746"
    },
    {
        name: "람보르기니",
        carName: "베네노",
        number: "41부 9338"
    }
] //이걸 JSON 자료 방식이라고 함


// 테이블의 tbody 요소 선택

// JSON 데이터를 HTML 테이블에 추가

$(function () {
    let tableBody = $('#tableBody');
    $.each(carList, function (i, member) {
        var add_data = '';
        add_data += '<tr>';
        add_data += '<td>';
        add_data += member.name;
        add_data += '</td>';
        add_data += '<td>';
        add_data += member.carName;
        add_data += '</td>';
        add_data += '<td>';
        add_data += member.number;
        add_data += '</td>';
        add_data += '</tr>';
        tableBody.append(add_data);
    });
});
    


$(document).ready(function(){
    $("#search").on("keyup", function() { // 검색창 입력 이벤트 발생 시
  
        var value = $(this).val().toLowerCase(); // 입력 내용을 소문자로 전환해 value 변수에 담아
  
    $("#tableBody tr").toArray().forEach( item => { //car-table의 tr들을 가져와서 하나씩 돌림
        $(item).toggle($(item).text().toLowerCase().indexOf(value) > -1)
        //item(각 tr요소)의 text를 조회하여 값이 일치하면 toggle(true)를 실행하여 목록에 보이게 함
    })

    });
  });
