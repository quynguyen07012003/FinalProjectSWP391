<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Model.*" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Quản Lý - Thể Loại</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <jsp:include page="sidebar.jsp" />
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #1d2634;
                color: #9e9ea4;
                font-family: 'Montserrat', sans-serif;
            }

            .container {
                margin-top: 40px;
                color: #fff;
            }

            .form-header {
                margin-bottom: 30px;
            }

            .form-header h1 {
                color: #fff;
                text-align: center;
            }

            .table {
                background-color: #2a2f45;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .table thead th {
                background-color: #4c4c6d;
                color: #fff;
                border-bottom: 2px solid #3a3f57;
            }

            .table tbody td {
                color: #fff;
                border-color: #3a3f57;
            }

            .table tbody tr:hover {
                background-color: #3a3f57;
            }

            .btn {
                border-radius: 20px;
                font-size: 0.9rem;
                padding: 5px 20px;
                transition: all 0.3s;
            }

            .btn-warning {
                background-color: #ffc107;
                border-color: #ffc107;
                color: #fff;
            }

            .btn-warning:hover {
                background-color: #e0a800;
                border-color: #d39e00;
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }

            .btn-danger:hover {
                background-color: #c82333;
                border-color: #bd2130;
            }

            .alert {
                border-radius: 8px;
            }

            .content {
                margin-left: 260px;
                padding: 30px;
            }
        </style>
    </head>
    <body>

        <!-- Nội Dung Chính -->
        <div class="content">
            <div class="container">
                <div class="form-header">
                    <h1>Quản Lý Thể Loại</h1>
                </div>

                <!-- Thông Báo Lỗi -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        ${error}
                    </div>
                </c:if>

                <!-- Form Thêm/Cập Nhật Thể Loại -->
                <form action="genre" method="post" class="mb-4">
                    <input type="hidden" name="action" value="${genre != null ? 'update' : 'add'}">
                    <input type="hidden" name="id" value="${genre != null ? genre.genreID : ''}">

                    <div class="form-group">
                        <label for="genreName">Tên Thể Loại:</label>
                        <input type="text" class="form-control" id="genreName" name="genreName" required value="${genre != null ? genre.genreName : ''}">
                    </div>
                    <button type="submit" class="btn btn-primary">
                        ${genre != null ? 'Cập Nhật Thể Loại' : 'Thêm Thể Loại'}
                    </button>
                </form>

                <!-- Bảng Thể Loại Hiện Tại -->
                <h2>Danh Sách Thể Loại</h2>
                <table class="table table-striped table-hover mt-3">
                    <thead class="thead-dark">
                        <tr>
                            <th>Tên Thể Loại</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="genre" items="${genres}">
                            <tr>
                                <td>${genre.genreName}</td>
                                <td>
                                    <!-- Nút Chỉnh Sửa -->
                                    <a href="genre?action=edit&id=${genre.genreID}" class="btn btn-warning">
                                        <i class="fas fa-edit"></i> Sửa
                                    </a>
                                    <!-- Nút Xóa -->
                                    <a href="genre?action=delete&id=${genre.genreID}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa thể loại này?');">
                                        <i class="fas fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS và các thư viện liên quan -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
