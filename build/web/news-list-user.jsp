<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Page Title -->
        <title>Tin Tức Mới Nhất</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- FontAwesome for Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Custom CSS -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <style>
            .news-card {
                cursor: pointer;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                position: relative;
                padding: 20px;
                background-color: #007bff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                color: white;
            }
            .news-card:hover {
                transform: scale(1.02);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }
            .news-details {
                color: #e0e0e0;
                margin-bottom: 5px;
            }
            .view-detail-btn {
                position: absolute;
                top: 10px;
                right: 20px;
                background-color: transparent;
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
                font-size: 1.5rem;
            }
            .view-detail-btn:hover {
                color: #ffd700;
            }
            .news-title {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Page Main -->
        <main id="bringer-main">
            <div class="stg-container">
                <!-- Section: Page Title -->
                <section class="backlight-bottom">
                    <div class="stg-row">
                        <div class="stg-col-6 stg-offset-3">
                            <div class="align-center">
                                <h1 class="bringer-page-title" data-appear="fade-up" data-unload="fade-up">Tin Tức Mới Nhất</h1>
                                <p class="bringer-large-text" data-appear="fade-up" data-delay="100" data-unload="fade-up">Luôn cập nhật với các tin tức mới nhất</p>
                            </div>
                        </div>
                    </div>
                </section>
                <form action="SearchNews" method="post" class="search-form">
                    <input type="text" name="txt" placeholder="Tìm kiếm một bài báo..." class="search-input">
                    <button type="submit" class="search-button">Tìm kiếm</button>
                </form>

                <!-- Section: News Grid -->
                <section>
                    <div class="bringer-grid-3cols bringer-tp-grid-2cols bringer-tp-centered-last-item stg-normal-gap bringer-parallax-media" data-stagger-appear="fade-up" data-threshold="0.5" data-stagger-delay="150" data-stagger-unload="fade-up">
                        <c:forEach var="news" items="${newsList}">
                            <div class="bringer-block bringer-portfolio-card news-card">
                                <h4 class="news-title">${news.title}</h4>
                                <p class="news-details">Ngày đăng: ${news.createdAt}</p>
<!--                                <p class="news-details">${fn:substring(news.content, 0, 100)}...</p>-->
                                <a href="newsUser?action=view&id=${news.newsID}" class="view-detail-btn">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </div><!-- .stg-container -->

            <!-- Footer -->
            <jsp:include page="footer.jsp" />
        </main>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
