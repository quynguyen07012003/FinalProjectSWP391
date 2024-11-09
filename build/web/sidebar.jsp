<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Trị - Quản Lý Thể Loại</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom Styles -->
    <style>
        body {
            background-color: #1d2634;
            color: #9e9ea4;
            font-family: 'Montserrat', sans-serif;
        }
        .container {
            color: #fff;
        }
        #sidebar {
            background-color: #263043;
            padding-top: 20px;
            padding-left: 0;
            position: fixed;
            height: 100%;
            width: 260px;
            overflow-y: auto;
            transition: 0.3s;
            z-index: 5;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar-title {
            padding: 20px;
            color: #fff;
            font-size: 1.2rem;
            font-weight: 600;
            text-align: center;
            border-bottom: 1px solid #3a3f57;
        }
        .sidebar-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar-list-item {
            padding: 15px 30px;
            display: block;
            transition: background-color 0.3s ease;
        }
        .sidebar-list-item:hover {
            background-color: #4c4c6d;
            cursor: pointer;
        }
        .sidebar-list-item a {
            color: #9e9ea4;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 1rem;
        }
        .sidebar-list-item a:hover {
            color: #fff;
            text-decoration: none;
        }
        .sidebar-list-item a .material-icons-outlined, .sidebar-list-item a i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        .content {
            margin-left: 260px;
            padding: 30px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div id="sidebar">
        <div class="sidebar-title">
            Bảng Điều Khiển Admin
        </div>
        <ul class="sidebar-list">
            <li class="sidebar-list-item">
                <a href="sidebar.jsp"><i class="fas fa-tachometer-alt"></i> Trang Chính</a>
            </li>
            <li class="sidebar-list-item">
                <a href="usermanage"><i class="fas fa-user-cog"></i> Quản Lý Tài Khoản</a>
            </li>
            <li class="sidebar-list-item">
                <a href="product"><i class="fas fa-box-open"></i> Quản Lý Sản Phẩm</a>
            </li>
            <li class="sidebar-list-item">
                <a href="orderManagement"><i class="fas fa-box-open"></i> Quản Lý Đơn Hàng</a>
            </li>
            <li class="sidebar-list-item">
                <a href="CompanyManage"><i class="fas fa-building"></i> Quản Lý Công Ty</a>
            </li>
            <li class="sidebar-list-item">
                <a href="genre"><i class="fas fa-building"></i> Quản Lý Thể Loại</a>
            </li>
            <li class="sidebar-list-item">
                <a href="logout"><i class="fas fa-home"></i> Đăng Xuất</a>
            </li>
        </ul>
    </div>


    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
