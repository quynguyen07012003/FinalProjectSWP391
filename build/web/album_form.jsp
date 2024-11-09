<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .form-header {
            background-color: #28a745;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group label {
            font-weight: 600;
        }
        .btn-custom {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
            border-radius: 25px;
            padding: 8px 20px;
            font-size: 1rem;
        }
        .btn-custom:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-secondary {
            border-radius: 25px;
            font-size: 1rem;
        }
    </style>
</head>
<body>

    <!-- Main Container -->
    <div class="container">
        <div class="form-container">
            <form action="album" method="post">
                <input type="hidden" name="action" value="${param.albumID != null ? "update" : "create"}">
                <input type="hidden" name="artistID" value="${param.artistID}">
                <c:if test="${param.albumID != null}">
                    <input type="hidden" name="albumID" value="${param.albumID}">
                </c:if>
                    
                <div class="form-group">
                    <label for="albumName">Tên Album:</label>
                    <input type="text" class="form-control" id="albumName" name="albumName" value="${album != null ? album.albumName : ''}" required>
                </div>

                <div class="form-group">
                    <label for="releaseDate">Ngày Phát Hành:</label>
                    <input type="date" class="form-control" id="releaseDate" name="releaseDate" value="${album != null ? album.releaseDate : ''}" required>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-custom">
                        ${param.albumID != null ? "Cập Nhật Album" : "Tạo Album"}
                    </button>
                    <a href="album?action=view&artistID=${param.artistID}" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS và các thư viện -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
