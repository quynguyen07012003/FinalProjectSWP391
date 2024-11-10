<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Đặt Chỗ</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Montserrat', sans-serif;
                color: #343a40;
            }
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
            .container {
                margin-top: 60px;
            }
            h1 {
                font-weight: 700;
                color: #343a40;
                text-align: center;
                margin-bottom: 30px;
            }
            .table {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .table th {
                background-color: #343a40;
                color: #fff;
                text-align: center;
            }
            .table td {
                vertical-align: middle;
                text-align: center;
            }
            .status-label {
                font-weight: bold;
                font-size: 0.9rem;
                padding: 5px 10px;
                border-radius: 8px;
            }
            .status-pending {
                background-color: #ffc107;
                color: #212529;
            }
            .status-confirmed {
                background-color: #28a745;
                color: #fff;
            }
            .status-canceled {
                background-color: #dc3545;
                color: #fff;
            }
            .btn-update {
                font-size: 0.9rem;
                font-weight: 600;
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

        <div class="container">
            <h1>Quản Lý Đặt Chỗ</h1>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID Đặt Chỗ</th>
                            <th>Ngày Đặt</th>
                            <th>Trạng Thái</th>
                            <th>Tên Người Dùng</th>
                            <th>Email Người Dùng</th>
                            <th>Tên Nghệ Sĩ</th>
                            <th>Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}">
                            <tr>
                                <td>${booking.bookingID}</td>
                                <td>${booking.bookingDate}</td>
                                <td>
                                    <span class="status-label
                                          <c:choose>
                                              <c:when test="${booking.status == 'Pending'}">status-pending</c:when>
                                              <c:when test="${booking.status == 'Confirmed'}">status-confirmed</c:when>
                                              <c:when test="${booking.status == 'Canceled'}">status-canceled</c:when>
                                          </c:choose>">
                                        ${booking.status}
                                    </span>
                                </td>
                                <td>${booking.user.fullname}</td>
                                <td>${booking.user.email}</td>
                                <td>${booking.artist.artistName}</td>
                                <td>
                                    <form action="BookController" method="post" class="form-inline">
                                        <input type="hidden" name="action" value="updateBookingStatus">
                                        <input type="hidden" name="bookingID" value="${booking.bookingID}">
                                        <select name="status" class="form-control mr-2">
                                            <option value="Pending" <c:if test="${booking.status == 'Pending'}">selected</c:if>>Chờ Xử Lý</option>
                                            <option value="Confirmed" <c:if test="${booking.status == 'Confirmed'}">selected</c:if>>Xác Nhận</option>
                                            <option value="Canceled" <c:if test="${booking.status == 'Canceled'}">selected</c:if>>Đã Hủy</option>
                                            </select>
                                            <button type="submit" class="btn btn-primary btn-update">Cập Nhật</button>
                                        </form>
                                    </td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
