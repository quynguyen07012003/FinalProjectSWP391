<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập Nhật Thông Tin Mạng Xã Hội</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Montserrat', sans-serif;
                color: #343a40;
            }
            .container {
                margin-top: 60px;
                max-width: 600px;
            }
            .form-header {
                font-weight: 700;
                color: #343a40;
                text-align: center;
                margin-bottom: 30px;
            }
            .form-group label {
                font-weight: 600;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                border-radius: 25px;
                padding: 10px 20px;
            }
            .btn-secondary {
                border-radius: 25px;
                padding: 10px 20px;
            }
            .btn {
                font-size: 1rem;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form action="ArtistMangeController" method="post">
                <input type="hidden" name="action" value="updateSocial">
                <input type="hidden" name="artistID" value="${artist.artistID}">

                <div class="form-group">
                    <label for="facebook">Facebook:</label>
                    <input type="text" class="form-control" id="facebook" name="facebook" 
                           value="${artist.facebook != null ? artist.facebook : ''}" >
                </div>

                <div class="form-group">
                    <label for="tiktok">TikTok:</label>
                    <input type="text" class="form-control" id="tiktok" name="tiktok" 
                           value="${artist.tiktok != null ? artist.tiktok : ''}" >
                </div>

                <div class="form-group">
                    <label for="instagram">Instagram:</label>
                    <input type="text" class="form-control" id="instagram" name="instagram" 
                           value="${artist.instagram != null ? artist.instagram : ''}">
                </div>

                <div class="form-group">
                    <label for="website">Website:</label>
                    <input type="text" class="form-control" id="website" name="website" 
                           value="${artist.website != null ? artist.website : ''}">
                </div>

                <div class="form-group">
                    <label for="twitter">Twitter:</label>
                    <input type="text" class="form-control" id="twitter" name="twitter" 
                           value="${artist.twitter != null ? artist.twitter : ''}">
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                    <a href="profileArtist?pid=${sessionScope.acc.id}" class="btn btn-secondary">Quay Lại</a>
                </div>
            </form>
        </div>
    </body>
</html>
