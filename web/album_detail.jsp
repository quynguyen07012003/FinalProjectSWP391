<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Album</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        .card {
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-body {
            padding: 20px;
        }
        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table thead th {
            background-color: #4c4c6d;
            color: white;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        .btn-secondary {
            border-radius: 25px;
            font-size: 1rem;
            padding: 8px 20px;
        }
        .btn-listen {
            background-color: #28a745;
            color: white;
            border-radius: 25px;
            font-size: 0.9rem;
            padding: 5px 15px;
        }
        .btn-listen:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <!-- Nội dung chính -->
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Tên Album: ${album.albumName}</h5>
                <p class="card-text">Ngày Phát Hành: ${album.releaseDate}</p>
            </div>
        </div>

        <div class="table-container mt-5">
            <h2>Các Bài Hát Trong Album</h2>
            <table class="table table-striped mt-3">
                <thead class="thead-dark">
                    <tr>
                        <th>Tên Bài Hát</th>
                        <th>Ngày Phát Hành</th>
                        <th>Liên Kết</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="song" items="${album.listSong}">
                        <tr>
                            <td>${song.songName}</td>
                            <td>${song.releaseDate}</td>
                            <td>
                                <a href="${song.linkToSong}" target="_blank" class="btn btn-listen">
                                    <i class="fas fa-play-circle"></i> Nghe
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="mt-4">
            <a href="album?action=view&artistID=${param.artistID}" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Quay Lại 
            </a>
        </div>
    </div>

    <!-- Bootstrap JS và các thư viện cần thiết -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
