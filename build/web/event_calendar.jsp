<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!doctype html>  
<html lang="vi">     
    <head>         
        <!-- Các thẻ meta cần thiết -->         
        <meta charset="utf-8">         
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">         
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">         
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">         
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/calendars/calendar-1/assets/css/calendar-1.css">         
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>         
        <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap5@6.1.9/index.global.min.js"></script>         
        <script src="https://unpkg.com/bs-brain@2.0.4/components/calendars/calendar-1/assets/controller/calendar-1.js"></script>          

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <title>Lịch Sự Kiện</title>          

        <style>       
            .navbar {
                background-color: #343a40;
                padding: 10px 20px;
            }
            .navbar a {
                color: white;
                margin-right: 15px;
                font-weight: 600;
                text-decoration: none;
            }
            .navbar a:hover {
                text-decoration: underline;
            }
            body {
                background-color: black;
                font-family: Arial, sans-serif;
            }

            .fc .fc-toolbar-title {
                color: #343a40;
                font-size: 1.5rem;
            }

            #bsb-calendar-1 {
                width: 100%;
                max-width: 900px;
                margin: 0 auto;
                height: 550px;
                border-radius: 0.5rem;
                overflow: hidden;
            }

            .col-xl-6 {
                margin-top: -50px;
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

        <nav class="navbar">
            <a href="home.jsp">Trang Chủ</a>
            <a href="BookController">Đặt Lịch</a>
            <a href="manage-new">Tin Tức</a>
            <a href="event_calendar.jsp">Lịch Sự Kiện</a>
        </nav>
        <div class="text-center my-3">             
        </div>
        <div class="py-3 py-md-5">             
            <div class="container">                 
                <div class="row justify-content-center">                     
                    <div class="col-12 col-lg-9 col-xl-6">                         
                        <div class="card widget-card border-light shadow-sm">                             
                            <div class="card-body p-4">                                 
                                <div id="bsb-calendar-1" class="fc fc-media-screen fc-direction-ltr fc-theme-bootstrap5 bsb-calendar-theme"></div> 
                            </div>                         
                        </div>   
                        <button class="btn btn-primary btn btn-success mt-2 float-end" data-bs-toggle="modal" data-bs-target="#addEventModal">Thêm Sự Kiện</button>
                    </div>   
                </div>         
            </div>         
        </div>

        <!-- Modal Thêm sự kiện -->
        <div id="addEventModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thêm Sự Kiện Mới</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Đóng">
                            <span aria-hidden="true">&times;</span>
                        </button>                    
                    </div>
                    <div class="modal-body">
                        <form id="addEventForm" action="AddEventServlet" method="POST">
                            <div class="form-group">
                                <label for="title">Tiêu Đề Sự Kiện:</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="startDate">Ngày Bắt Đầu:</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                            </div>
                            <div class="form-group">
                                <label for="endDate">Ngày Kết Thúc:</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" required>
                            </div>
                            <div class="form-group">
                                <label for="location">Địa Điểm:</label>
                                <input type="text" class="form-control" id="location" name="location" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô Tả:</label>
                                <textarea class="form-control" id="description" name="description" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-success mt-2 float-end">Thêm Sự Kiện</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal chỉnh sửa sự kiện -->
        <div id="editEventModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Chỉnh Sửa Sự Kiện</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Đóng">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Form chỉnh sửa sự kiện -->
                        <form id="editEventForm" method="POST">
                            <input type="hidden" id="editEventId" name="id">
                            <div class="form-group">
                                <label for="editTitle">Tiêu Đề Sự Kiện:</label>
                                <input type="text" class="form-control" id="editTitle" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="editStartDate">Ngày Bắt Đầu:</label>
                                <input type="date" class="form-control" id="editStartDate" name="startDate" required>
                            </div>
                            <div class="form-group">
                                <label for="editEndDate">Ngày Kết Thúc:</label>
                                <input type="date" class="form-control" id="editEndDate" name="endDate">
                            </div>
                            <div class="form-group">
                                <label for="editLocation">Địa Điểm:</label>
                                <input type="text" class="form-control" id="editLocation" name="location">
                            </div>
                            <div class="form-group">
                                <label for="editDescription">Mô Tả:</label>
                                <textarea class="form-control" id="editDescription" name="description"></textarea>
                            </div>
                            <button type="button" class="btn btn-success" id="updateEventButton" onclick="submitForm('EditEventIdServlet')">Cập Nhật</button>
                            <button type="button" class="btn btn-danger" id="deleteEventButton" onclick="submitForm('DeleteEventIdServlet')">Xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
                            alert('Đã xảy ra lỗi khi tải sự kiện!');
                        }
                    },
                    eventContent: function (arg) {
                        return {html: arg.event.title};
                    },
                    eventClick: function (info) {
                        var event = info.event;
                        $('#editEventId').val(event.id);
                        $('#editTitle').val(event.title);
                        $('#editStartDate').val(event.start.toISOString().split('T')[0]);
                        $('#editEndDate').val(event.end ? event.end.toISOString().split('T')[0] : event.start.toISOString().split('T')[0]);
                        $('#editLocation').val(event.extendedProps.location);
                        $('#editDescription').val(event.extendedProps.description);

                        $('#editEventModal').modal('show');
                    }
                });

                calendar.render();
            });

            function submitForm(servletName) {
                document.getElementById('editEventForm').action = servletName;
                document.getElementById('editEventForm').submit();
            }
        </script>
    </body>
</html>
