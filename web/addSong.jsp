<%-- 
    Document   : addSong
    Created on : Oct 27, 2024, 12:01:51 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Song</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <form action="song" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="artistID" value="${artistID}">
            <div class="form-group">
                <label for="songName">Tên bài hát:</label>
                <input type="text" class="form-control" id="songName" name="songName" required>
            </div>
            <div class="form-group">
                <label for="linkToSong">Đường dẫn:</label>
                <input type="url" class="form-control" id="linkToSong" name="linkToSong" required>
            </div>
            <div class="form-group">
                <label for="releaseDate">Ngày phát hành:</label>
                <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
            </div>
            <div class="form-group">
                <label for="albumID">Chọn Album:</label>
                <select class="form-control" id="albumID" name="albumID" required>
                    <c:forEach var="album" items="${albums}">
                        <option value="${album.albumID}">${album.albumName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Thể loại:</label><br>
                <c:forEach var="genre" items="${genres}">
                    <input type="checkbox" name="genreIDs" value="${genre.genreID}"> ${genre.genreName}<br>
                </c:forEach>
            </div>
            <button type="submit" class="btn btn-success">Thêm bài hát</button>
            <a href="javascript:history.back()" class="btn btn-secondary">  Quay lại</a>
        </form>
    </div>
</body>
</html>

