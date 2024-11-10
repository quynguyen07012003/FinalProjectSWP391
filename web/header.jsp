<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt Lịch Nghệ Sĩ</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet">
        <!-- Config -->
        <link type="text/css" rel="stylesheet" href="css/config.css">
        <!-- Libraries -->
        <link type="text/css" rel="stylesheet" href="css/libs.css">
        <!-- Template Styles -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <!-- Responsive -->
        <link type="text/css" rel="stylesheet" href="css/responsive.css">
        <link rel="icon" href="img/favicon.png" sizes="32x32">
    </head>
    <!-- Thêm CSS cho dropdown -->
    <style>
        .profile-dropdown {
            position: relative;
            display: inline-block;
        }

        .profile-dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .profile-dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .profile-dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .profile-dropdown:hover .profile-dropdown-content {
            display: block;
        }
        /* CSS cho dropdown menu */
        .profile-dropdown-content {
            display: none;
            position: absolute;
            background-color: #ffffff; /* Màu nền trắng */
            min-width: 180px;
            border-radius: 8px; /* Bo tròn các góc */
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15); /* Đổ bóng nhẹ */
            z-index: 1;
            padding: 8px 0; /* Thêm khoảng cách trên và dưới */
        }

        /* Xóa định dạng mặc định của danh sách và căn chỉnh đẹp hơn */
        .profile-dropdown-content li {
            list-style: none; /* Loại bỏ dấu chấm */
            padding: 0;
            margin: 0;
        }

        .profile-dropdown-content li a {
            color: #333; /* Màu chữ đậm */
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            font-size: 16px; /* Tăng kích thước chữ */
            font-weight: 500;
            transition: background-color 0.3s ease; /* Hiệu ứng hover mượt */
        }

        .profile-dropdown-content li a:hover {
            background-color: #f4f4f4; /* Màu nền khi hover */
        }

        /* Định dạng cho link đăng xuất */
        .profile-dropdown-content a[href="logout"] {
            color: #d9534f; /* Màu chữ đỏ cho đăng xuất */
            font-weight: bold;
            padding: 12px 16px;
            display: block;
            border-top: 1px solid #eaeaea; /* Đường viền ngăn cách phía trên */
        }

        .profile-dropdown-content a[href="logout"]:hover {
            background-color: #f4f4f4; /* Màu nền khi hover cho đăng xuất */
        }

        /* Hiển thị dropdown khi hover */
        .profile-dropdown:hover .profile-dropdown-content {
            display: block;
        }

    </style>
    <body>
        <header id="bringer-header" class="is-frosted is-sticky" data-appear="fade-down" data-unload="fade-up">
            <div class="bringer-header-inner">
                <div class="bringer-header-lp">
                    <a href="home.jsp" class="bringer-logo">
                        <img src="img/logo.png" alt="bringer." width="88" height="24">
                    </a>
                </div>
                <div class="bringer-header-mp">
                    <nav class="bringer-nav">
                        <ul class="main-menu" data-stagger-appear="fade-down" data-stagger-delay="75">
                            <li><a href="newsUser">Tin Tức</a></li>
                            <li><a href="artist">Nghệ Sĩ</a></li>
                            <li><a href="company">Công Ty</a></li>
                            <li><a href="viewProducts">Sản Phẩm</a></li>
                            <li><a href="calendar.jsp">Lịch Trình</a></li>
                                <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 2}">
                                <li><a href="UserBookController?action=viewUserBookings">Xem Đặt Lịch</a></li>
                                <li><a href="cart">Xem Giỏ Hàng</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 3}">
                                <a href="BookController">Quản Lí</a>
                            </c:if>
                        </ul>
                    </nav>
                </div>

                <div class="bringer-header-rp">
                    <c:choose>
                        <c:when test="${empty sessionScope.acc}">
                            <a style="margin-right: 10px;" href="logingg.jsp" class="bringer-button">Đăng Nhập</a>
                            <a href="signup.jsp" class="bringer-button">Đăng Ký</a>
                        </c:when>
                        <c:otherwise>
                            <div class="profile-dropdown">
                                <button class="bringer-button" id="profileButton">
                                    Hồ Sơ 
                                </button>
                                <div class="profile-dropdown-content">
                                    <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 2}">
                                        <li><a href="profileClient?pid=${sessionScope.acc.id}">Chi Tiết Hồ Sơ</a></li>
                                        <li><a href="myOrders?pid=${sessionScope.acc.id}">Đơn Đã Mua</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 3}">
                                        <li><a href="profileAgent?pid=${sessionScope.acc.id}">Chi Tiết Hồ Sơ</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.acc != null && sessionScope.acc.role == 4}">
                                        <li><a href="profileArtist?pid=${sessionScope.acc.id}">Chi Tiết Hồ Sơ</a></li>
                                        </c:if>


                                    <a href="logout">Đăng Xuất</a> <!-- Điều hướng đến LogoutServlet -->
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </header>

        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/libs.js"></script>
        <script src="js/contact_form.js"></script>
        <script src="js/st-core.js"></script>
        <script src="js/classes.js"></script>
        <script src="js/main.js"></script>


    </body>
</html>
