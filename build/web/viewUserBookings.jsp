<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Tiêu đề trang -->
        <title>Các Đặt Chỗ Của Bạn</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet">
        <!-- Cấu hình -->
        <link type="text/css" rel="stylesheet" href="css/config.css">
        <!-- Thư viện -->
        <link type="text/css" rel="stylesheet" href="css/libs.css">
        <!-- Styles Mẫu -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <!-- Responsive -->
        <link type="text/css" rel="stylesheet" href="css/responsive.css">

        <!-- Favicon -->
        <link rel="icon" href="img/favicon.png" sizes="32x32">
        <!-- Styles Tùy Chỉnh -->
        <style>
            .booking-card {
                background-color: #ffffff;
                border: 1px solid #ced4da;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .booking-card:hover {
                transform: scale(1.02);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }
            .booking-header {
                font-size: 1.5rem;
                font-weight: 700;
                color: #343a40; /* Màu đen đậm */
            }
            .booking-details {
                margin-top: 10px;
                font-size: 1.1rem;
                color: #495057; /* Màu xám đậm */
            }
            .status-pending {
                color: #ffca2c; /* Màu vàng đậm cho "Chờ xử lý" */
            }
            .status-confirmed {
                color: #198754; /* Màu xanh đậm cho "Đã xác nhận" */
            }
            .status-canceled {
                color: #dc3545; /* Màu đỏ cho "Đã hủy" */
            }
            .btn-primary {
                margin-top: 20px;
                background-color: #007bff;
                border-color: #007bff;
                font-size: 1.1rem;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Phần chính trang -->
        <main id="bringer-main">
            <div class="stg-container">
                <!-- Phần: Tiêu đề trang -->
                <section class="backlight-bottom">
                    <div class="stg-row">
                        <div class="stg-col-6 stg-offset-3">
                            <div class="align-center">
                                <h1 class="bringer-page-title" data-appear="fade-up" data-unload="fade-up">CÁC NGHỆ SĨ CỦA CÔNG TY</h1>
                                <p class="bringer-large-text" data-appear="fade-up" data-delay="100" data-unload="fade-up">Khám Phá Các Nghệ Sĩ Tài Năng</p>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container">
                    <h1 class="text-center my-4">Các Đặt Chỗ Của Bạn</h1>

                    <c:forEach var="booking" items="${bookings}">
                        <div class="booking-card">
                            <div class="booking-header">
                                Mã Đặt Chỗ: ${booking.bookingID}
                            </div>
                            <div class="booking-details">
                                <p>Mã Nghệ Sĩ: ${booking.artistID}</p>
                                <p>Ngày Đặt: ${booking.bookingDate}</p>
                                <p>Tên người đặt: ${booking.user.fullname}</p>
                                <p>Email người đặt: ${booking.user.email}</p>
                                <p>Tên Nghệ Sĩ: ${booking.artist.artistName}</p>
                                <p>Trạng Thái:
                                    <span class="status-${booking.status.toLowerCase()}">${booking.status}</span>
                                </p>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="text-center">
                        <a href="company" class="btn btn-primary">Đặt Nghệ Sĩ Khác</a>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp" />
        </main>

        <!-- Ánh sáng nền động -->
        <div class="bringer-backlight"></div>

        <!-- JS Scripts -->
        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/libs.js"></script>
        <script src="js/contact_form.js"></script>
        <script src="js/st-core.js"></script>
        <script src="js/classes.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
