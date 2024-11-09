<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Songs of Artist</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
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
            padding: 15px 20px;
            border-radius: 5px;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            border-radius: 25px;
            padding: 8px 20px;
            font-size: 1rem;
            border: none;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .table-container {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #4c4c6d;
            color: white;
        }
        .btn-sm {
            padding: 5px 12px;
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
        <div class="d-flex justify-content-between align-items-center">
                <a href="song?action=add&artistID=${artistID}" class="btn btn-custom">
                    <i class="fas fa-plus"></i> Thêm bài hát
                </a>
            </div>
        <!-- Table Container -->
        <div class="table-container">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Tên Bài hát</th>
                        <th>Đường dẫn</th>
                        <th>Ngày phát hành</th>
                        <th>Thể loại</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="song" items="${songs}">
                        <tr>
                            <td>${song.songName}</td>
                            <td><a href="${song.linkToSong}" target="_blank">${fn:substring(song.linkToSong, 0, 30)}...</a></td>
                            <td>${song.releaseDate}</td>
                            <td>
                                <c:forEach var="genre" items="${song.genres}">
                                    ${genre.genreName}<c:if test="${fn:length(song.genres) > 1}">, </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="song?action=edit&id=${song.songID}" class="btn btn-primary btn-sm">
                                    <i class="fas fa-edit"></i> Chỉnh sửa
                                </a>
                                <a href="song?action=delete&id=${song.songID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this song?');">
                                    <i class="fas fa-trash-alt"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <!-- Back Button -->
        <div class="mt-4">
           
               <a href="profileArtist?pid=${sessionScope.acc.id}" class="btn btn-secondary">Back</a>
            
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
