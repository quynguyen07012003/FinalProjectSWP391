<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ Sơ Nghệ Sĩ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <!-- Stylesheets from template -->
    <link type="text/css" rel="stylesheet" href="css/config.css">
    <link type="text/css" rel="stylesheet" href="css/libs.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link type="text/css" rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
    /* Social Media Links */
    .social-media-links {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 10px;
    }

    .social-link {
        font-size: 1.5em;
        color: #333;
        transition: color 0.3s ease;
    }

    .social-link:hover {
        color: #007bff;
    }

    /* Albums Card */
    .bringer-albums {
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* General Styling */
    .bringer-album-name {
        font-size: 1.2em;
        font-weight: 500;
        color: #333;
    }

    .bringer-buttons {
        display: flex;
        gap: 15px;
        margin-top: 20px;
    }

    .bringer-btn {
        padding: 10px 20px;
        font-size: 1em;
        font-weight: 600;
        color: #ffffff;
        background-color: #007bff;
        border-radius: 6px;
        transition: all 0.3s ease;
    }

    .bringer-btn:hover {
        background-color: #0056b3;
    }
</style>

<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- Main Content -->
    <main id="bringer-main" class="stg-container">

        <!-- Artist Profile Section -->
        <div class="stg-row">
            <div class="stg-col-4">
                <div class="bringer-block bringer-portfolio-card bringer-card bringer-card-profile">
                    <div class="bringer-portfolio-card-image">
                        <img src="${detail.image}" alt="Nghệ Sĩ" class="rounded-circle" width="150" height="150">
                    </div>
                    <div class="bringer-portfolio-card-footer align-center">
                        <h4>${detail.stageName}</h4> 
                    </div>
                        <div class="social-media-links">
                            <a onclick="window.open('${detail.facebook}', '_blank');" class="social-link" target="_blank" rel="noopener noreferrer">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a onclick="window.open('${detail.instagram}', '_blank');" class="social-link" target="_blank" rel="noopener noreferrer">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a onclick="window.open('${detail.twitter}', '_blank');" class="social-link" target="_blank" rel="noopener noreferrer">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a onclick="window.open('${detail.tiktok}', '_blank');" class="social-link" target="_blank" rel="noopener noreferrer">
                                <i class="fab fa-tiktok"></i>
                            </a>
                        </div>
                </div>
            </div>

            <div class="stg-col-8">
                <div class="bringer-card mb-3">
                    <div class="card-body">
                        <!-- Artist Details -->
                        <div class="row">
                            <div class="col-sm-3">
                                <h6>Họ Tên</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">${detail.artistName}</div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6>Nghệ Danh</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">${detail.stageName}</div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6>Tiểu Sử</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">${detail.bio}</div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6>Ngày Sinh</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">${detail.dateOfBirth}</div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6>Thể Loại</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:forEach var="genre" items="${detail.genres}">
                                    <span>${genre.genreName}</span><br/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="bringer-buttons">
                    <a class="bringer-btn" href="viewSongs?id=${detail.artistID}">Xem Bài Hát</a>
                    <a class="bringer-btn" href="viewAlbums?id=${detail.artistID}">Xem Album</a>
                </div>

            </div>
        </div>
    </main>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

    <!-- JS Scripts from Template -->
    <script src="js/lib/jquery.min.js"></script>
    <script src="js/lib/libs.js"></script>
    <script src="js/contact_form.js"></script>
    <script src="js/st-core.js"></script>
    <script src="js/classes.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
