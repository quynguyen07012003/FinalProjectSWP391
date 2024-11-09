<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!doctype html>  
<html lang="vi">     
    <head>         
        <!-- Required meta tags -->         
        <meta charset="utf-8">         
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">         
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">         
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">         
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/calendars/calendar-1/assets/css/calendar-1.css">         
        <jsp:include page="header.jsp" />         
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>         
        <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap5@6.1.9/index.global.min.js"></script>         
        <script src="https://unpkg.com/bs-brain@2.0.4/components/calendars/calendar-1/assets/controller/calendar-1.js"></script>         
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <title>Lịch #9</title>          

        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif; 
            }

            .fc .fc-toolbar-title {
                color: #343a40; 
                font-size: 1.5rem; 
            }

            .container {
                padding-top: 60px;
            }

            #bsb-calendar-1 {
                width: 100%;
                max-width: 900px; 
                margin: 0 auto; 
                height: 500px;
                border-radius: 0.5rem; 
            }

            .col-xl-6 {
                width: 80%;
                height: auto; 
            }

            .form-group label {
                color: #495057; 
                margin-top: 12px; 
            }

            .modal-header {
                display: flex;
                justify-content: space-between; 
                align-items: center; 
            }

            .modal-title {
                color: #212529; 
            }

            .btn-success {
                margin-top: 10px; 
            }

            .btn-close {
                color: #000;
                opacity: 0.5; 
                transition: opacity 0.2s; 
            }

            .btn-close:hover {
                cursor: pointer;
                opacity: 1; 
            }

            strong {
                color: black;
            }

            #event-info-popup {
                color: black;
                position: absolute;
                display: none; 
                background-color: white;
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
                z-index: 2000; 
                box-shadow: 0 0 10px rgba(0,0,0,0.2); 
            }
        </style>
    </head>     
    <body>         
        <div class="py-3 py-md-5">             
            <div class="container">                 
                <div class="row justify-content-center">                     
                    <div class="col-12 col-lg-9 col-xl-6">                         
                        <div class="card widget-card border-light shadow-sm">                             
                            <div class="card-body p-4">      
                                <div id="bsb-calendar-1" class="fc fc-media-screen fc-direction-ltr fc-theme-bootstrap5 bsb-calendar-theme"></div>                            
                            </div>                         
                        </div>                     
                    </div>                 
                </div>             
            </div>         
        </div>
        <div id="event-info-popup" style="display: none;"></div>

        <jsp:include page="footer.jsp" />

        <script>
            $(document).ready(function () {
                var calendarEl = document.getElementById('bsb-calendar-1');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    themeSystem: 'bootstrap5',
                    initialView: 'dayGridMonth',
                    events: {
                        url: 'EventServlet',
                        method: 'GET',
                        failure: function () {
                            alert('Đã xảy ra lỗi khi lấy sự kiện!');
                        }
                    },
                    eventContent: function (arg) {
                        return {html: arg.event.title}; // Chỉ hiển thị tiêu đề
                    },

                    eventMouseEnter: function (info) {
                        var event = info.event; // Lấy thông tin sự kiện
                        var popup = $('#event-info-popup');

                        // Thiết lập nội dung cho popup
                        popup.html(
                                '<strong style="color:black;">Tiêu đề:</strong> ' + event.title + '<br>' +
                                '<strong style="color:black;">Địa điểm:</strong> ' + event.extendedProps.address + '<br>' +
                                '<strong style="color:black;">Bắt đầu:</strong> ' + (event.start.toISOString().split('T')[0]) + '<br>' +
                                '<strong style="color:black;">Kết thúc:</strong> ' + (event.end ? event.end.toISOString().split('T')[0] : event.start.toISOString().split('T')[0]) + '<br>' +
                                '<strong style="color:black;">Mô tả:</strong> ' + event.extendedProps.description
                                );

                        // Vị trí của popup gần con chuột
                        var mouseX = info.jsEvent.clientX + 10; // Thêm một chút để không bị chồng lên chuột
                        var mouseY = info.jsEvent.clientY + 10;
                        popup.css({top: mouseY, left: mouseX}).show(); // Hiện popup
                    },

                    eventMouseLeave: function () {
                        $('#event-info-popup').hide(); // Ẩn popup khi không hover nữa
                    }
                });

                calendar.render();
            });
        </script>
    </body>
</html>
