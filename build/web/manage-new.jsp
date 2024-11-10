<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản Lý Tin Tức</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f4f7f9;
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
            .header-title {
                background-color: #007bff;
                color: white;
                padding: 15px;
                border-radius: 8px;
                text-align: center;
                font-size: 24px;
                font-weight: 600;
                margin-bottom: 30px;
            }
            .table {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                color: #343a40;
            }
            .table thead th {
                background-color: #6c757d;
                color: #ffffff;
                text-align: center;
            }
            .table tbody td {
                text-align: center;
                vertical-align: middle;
            }
            .btn-custom {
                border-radius: 25px;
                padding: 8px 20px;
            }
            .btn-success {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
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
            <div class="header-title">Quản Lý Tin Tức</div>
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">Danh Sách Tin Tức</h2>
                <a href="manage-new?action=new" class="btn btn-success btn-custom">Thêm Tin Tức Mới</a>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu Đề</th>
                            <th>Tác Giả</th>
                            <th>Trạng Thái</th>
                            <th>Ngày Tạo</th>
                            <th>Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="news" items="${newsList}">
                            <tr>
                                <td>${news.newsID}</td>
                                <td>${news.title}</td>
                                <td>${news.author.username}</td>
                                <td>${news.status}</td>
                                <td>${news.createdAt}</td>
                                <td>
                                    <a href="manage-new?action=edit&id=${news.newsID}" class="btn btn-primary btn-sm btn-custom">
                                        <i class="fas fa-edit"></i> Sửa
                                    </a>
                                    <a href="manage-new?action=delete&id=${news.newsID}" class="btn btn-danger btn-sm btn-custom"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa tin tức này?');">
                                        <i class="fas fa-trash-alt"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
