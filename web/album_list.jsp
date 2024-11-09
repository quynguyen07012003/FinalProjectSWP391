<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Album</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f4f7f9;
            font-family: 'Montserrat', sans-serif;
            color: #343a40;
        }
        .navbar {
            background-color: #343a40;
            padding: 15px;
        }
        .navbar a {
            color: #f8f9fa;
            text-decoration: none;
            margin-right: 20px;
            font-weight: 600;
        }
        .navbar a:hover {
            color: #ffc107;
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
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            border-radius: 25px;
            padding: 8px 20px;
            font-size: 1rem;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .table thead th {
            background-color: #4c4c6d;
            color: white;
            text-align: center;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        .btn-sm {
            padding: 0.4rem 0.75rem;
            font-size: 0.875rem;
        }
        .back-button {
            background-color: #6c757d;
            color: white;
            border-radius: 25px;
        }
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <!-- Main Container -->
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <a href="album?action=new&artistID=${param.artistID}" class="btn btn-custom">
                    <i class="fas fa-plus"></i> Thêm Album
                </a>
        </div>
        <div class="table-container">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Tên Album</th>
                        <th>Ngày Phát Hành</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="album" items="${albums}">
                        <tr>
                            <td>${album.albumName}</td>
                            <td>${album.releaseDate}</td>
                            <td class="text-center">
                                <a href="album?action=edit&albumID=${album.albumID}&artistID=${param.artistID}" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Chỉnh Sửa
                                </a>
                                <a href="album?action=detail&albumID=${album.albumID}&artistID=${param.artistID}" class="btn btn-info btn-sm">
                                    <i class="fas fa-info-circle"></i> Chi Tiết
                                </a>
                                <a href="album?action=delete&albumID=${album.albumID}&artistID=${param.artistID}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa album này không?');">
                                    <i class="fas fa-trash-alt"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="mt-4">
            <a href="profileArtist?pid=${sessionScope.acc.id}" class="btn btn-secondary">Quay Lại</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
