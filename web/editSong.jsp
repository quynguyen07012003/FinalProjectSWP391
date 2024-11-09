<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Song</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <form action="song" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="songID" value="${song.songID}">
                     <input type="hidden" name="artistID" value="${song.artistID}">
                    
                    <!-- Song Name -->
                    <div class="form-group">
                        <label for="songName">Tên bài hát:</label>
                        <input type="text" class="form-control" id="songName" name="songName" value="${song.songName}" required>
                    </div>

                    <!-- Link to Song -->
                    <div class="form-group">
                        <label for="linkToSong">Đường dẫn:</label>
                        <input type="url" class="form-control" id="linkToSong" name="linkToSong" value="${song.linkToSong}" required>
                    </div>

                    <!-- Release Date -->
                    <div class="form-group">
                        <label for="releaseDate">Ngày phát hành:</label>
                        <input type="date" class="form-control" id="releaseDate" name="releaseDate" value="${song.releaseDate}" required>
                    </div>

                    <!-- Select Album -->
                    <div class="form-group">
                        <label for="albumID">Chọn Album:</label>
                        <select class="form-control" id="albumID" name="albumID" required>
                            <c:forEach var="album" items="${albums}">
                                <option value="${album.albumID}" ${album.albumID == song.albumID ? 'selected' : ''}>${album.albumName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Genres -->
                    <div class="form-group">
                        <label for="genres">Thể loại:</label>
                        <div>
                            <c:forEach var="genre" items="${genres}">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="genre_${genre.genreID}" name="genreIDs" value="${genre.genreID}"
                                           <c:forEach var="songGenre" items="${song.genres}">
                                               <c:if test="${songGenre.genreID == genre.genreID}">checked</c:if>
                                           </c:forEach>>
                                    <label class="form-check-label" for="genre_${genre.genreID}">${genre.genreName}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <a href="javascript:history.back()" class="btn btn-secondary">Quay lại</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
