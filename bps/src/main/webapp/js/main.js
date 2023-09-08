(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });



    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });

    const delmes = () => $('.close-message').click(function () {
        $('div').remove('#close-msg');
    })
    delmes();

    const delcal = () => $('.close-cal').click(function () {
        $('div').remove('#cal');
    });
    delcal();

    const deltoDo = () => $('.close-toDo').click(function () {
        $('div').remove('#toDo');
    })
    deltoDo();


    // Calender
    const makecal = () => $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    })

    makecal();



    // 추가
    // plus menu
    $('.dal').click(function () {
        
        $('#menuarea2').append(
        `<div class="row p-4 rowmove" id="cal">
        <div draggable="true"  class="calenderya">
            <div class="h-100 bg-light rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Calender</h6>
                    <a href="#" class="close-cal close-menu">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
                <div id="calender"></div>
            </div>
        </div>
    </div>`);
     makecal()
     delcal()
     moving();
            
    })




    $(document).ready(function () {
        $('.submenu').click(function () {
            if ($('.close-sub').hasClass('close-sub')) {
                $('.submenu > .fa').addClass('menus fa-times').removeClass('fa-plus')
                $('.close-sub').addClass('open-sub').removeClass('close-sub');
            } else if ($('.open-sub').hasClass('open-sub')) {
                $('.open-sub').addClass('close-sub').removeClass('open-sub');
                $('.submenu > .fa').addClass('fa-plus').removeClass('menus fa-times')
            }
        });
    });


  
    // $(document).ready(function () {
    //        if($('.menuarea').hasClass('.menus')){
    //             $('.body').click(function(){
    //             $('.menus').click();
             
    //        })
    //     }
    // })

    $('html').click(function(e) {   
        if(!$(e.target).hasClass('menus')) {
            $('.menus').click();
        }
    });    

    




    $(document).ready(function () {
        $('.submenu').click(function () {

            if ($('.calenderya').hasClass('calenderya')) {
                $('.dal').addClass('close-sub1').removeClass('open-sub1');
            } else if (!$('.calenderya').hasClass('calenderya')){
                $('.dal').addClass('open-sub1').removeClass('close-sub1');
            } 

            if ($('.msg').hasClass('msg')) {
                $('.mes').addClass('close-sub1').removeClass('open-sub1');
            } else if (!$('.msg').hasClass('msg')) {
                $('.mes').addClass('open-sub1').removeClass('close-sub1');
            }

            if ($('.to_Do').hasClass('to_Do')) {
                $('.upmu').addClass('close-sub1').removeClass('open-sub1');
            } else if (!$('.to_Do').hasClass('to_Do')) {
                $('.upmu').addClass('open-sub1').removeClass('close-sub1');
            }
            
        });
    });

    

    const moving = () => $(document).ready(function () {
    const draggables = document.querySelectorAll(".rowmove");
    const containers = document.querySelectorAll(".row1");

    draggables.forEach(draggable => {
        draggable.addEventListener("dragstart", () => {
            draggable.classList.add("dragging");
        });

        draggable.addEventListener("dragend", () => {
            draggable.classList.remove("dragging");
        });
    });

    containers.forEach(container => {
        container.addEventListener("dragover", e => {
            e.preventDefault();
            const afterElement = getDragAfterElement(container, e.clientX);
            const draggable = document.querySelector(".dragging");
            if (afterElement === undefined) {
                container.appendChild(draggable);
            } else {
                container.insertBefore(draggable, afterElement);
            }
        });
    });

    function getDragAfterElement(container, x) {
        const draggableElements = [
            ...container.querySelectorAll(".draggable:not(.dragging)"),
        ];

        return draggableElements.reduce(
            (closest, child) => {
                const box = child.getBoundingClientRect();
                const offset = x - box.left - box.width / 2;
                // console.log(offset);
                if (offset < 0 && offset > closest.offset) {
                    return { offset: offset, element: child };
                } else {
                    return closest;
                }
            },
            { offset: Number.NEGATIVE_INFINITY },
        ).element;
    }

    });

    moving();



    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, { offset: '80%' });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav: false
    });


    // Worldwide Sales Chart
    var ctx1 = $("#worldwide-sales").get(0).getContext("2d");
    var myChart1 = new Chart(ctx1, {
        type: "bar",
        data: {
            labels: ["2016", "2017", "2018", "2019", "2020", "2021", "2022"],
            datasets: [{
                label: "USA",
                data: [15, 30, 55, 65, 60, 80, 95],
                backgroundColor: "rgba(0, 156, 255, .7)"
            },
            {
                label: "UK",
                data: [8, 35, 40, 60, 70, 55, 75],
                backgroundColor: "rgba(0, 156, 255, .5)"
            },
            {
                label: "AU",
                data: [12, 25, 45, 55, 65, 70, 60],
                backgroundColor: "rgba(0, 156, 255, .3)"
            }
            ]
        },
        options: {
            responsive: true
        }
    });


    // Salse & Revenue Chart
    var ctx2 = $("#salse-revenue").get(0).getContext("2d");
    var myChart2 = new Chart(ctx2, {
        type: "line",
        data: {
            labels: ["2016", "2017", "2018", "2019", "2020", "2021", "2022"],
            datasets: [{
                label: "Salse",
                data: [15, 30, 55, 45, 70, 65, 85],
                backgroundColor: "rgba(0, 156, 255, .5)",
                fill: true
            },
            {
                label: "Revenue",
                data: [99, 135, 170, 130, 190, 180, 270],
                backgroundColor: "rgba(0, 156, 255, .3)",
                fill: true
            }
            ]
        },
        options: {
            responsive: true
        }
    });



    // Single Line Chart
    var ctx3 = $("#line-chart").get(0).getContext("2d");
    var myChart3 = new Chart(ctx3, {
        type: "line",
        data: {
            labels: [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150],
            datasets: [{
                label: "Salse",
                fill: false,
                backgroundColor: "rgba(0, 156, 255, .3)",
                data: [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15]
            }]
        },
        options: {
            responsive: true
        }
    });


    // Single Bar Chart
    var ctx4 = $("#bar-chart").get(0).getContext("2d");
    var myChart4 = new Chart(ctx4, {
        type: "bar",
        data: {
            labels: ["Italy", "France", "Spain", "USA", "Argentina"],
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: [55, 49, 44, 24, 15]
            }]
        },
        options: {
            responsive: true
        }
    });


    // Pie Chart
    var ctx5 = $("#pie-chart").get(0).getContext("2d");
    var myChart5 = new Chart(ctx5, {
        type: "pie",
        data: {
            labels: ["Italy", "France", "Spain", "USA", "Argentina"],
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: [55, 49, 44, 24, 15]
            }]
        },
        options: {
            responsive: true
        }
    });


    // Doughnut Chart
    var ctx6 = $("#doughnut-chart").get(0).getContext("2d");
    var myChart6 = new Chart(ctx6, {
        type: "doughnut",
        data: {
            labels: ["Italy", "France", "Spain", "USA", "Argentina"],
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: [55, 49, 44, 24, 15]
            }]
        },
        options: {
            responsive: true
        }
    });


})(jQuery);

