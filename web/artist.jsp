<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Page Title -->
        <title>Portfolio</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet">
        <!-- Config -->
        <link type="text/css" rel="stylesheet" href="css/config.css">
        <!-- Libraries -->
        <link type="text/css" rel="stylesheet" href="css/libs.css">
        <!-- Template Styles -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <!-- Responsive -->
        <link type="text/css" rel="stylesheet" href="css/responsive.css">

        <!-- Favicon -->
        <link rel="icon" href="img/favicon.png" sizes="32x32">
    </head>
    <style>
        
    </style>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Page Main -->
        <main id="bringer-main">
            <div class="stg-container">
                <!-- Section: Search Form -->


                <section class="backlight-bottom">
                    <div class="stg-row">
                        <div class="stg-col-6 stg-offset-3">
                            <div class="align-center">
                                <h1 class="bringer-page-title" data-appear="fade-up" data-unload="fade-up">OUR ARTISTS</h1>
                                <p class="bringer-large-text" data-appear="fade-up" data-delay="100" data-unload="fade-up">Meet Our Talented Team</p>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="stg-row">
                        <div class="stg-col-12">
                            <form action="artist" method="GET" class="search-form">
                                <input type="text" name="search"  class="search-input">
                                <button type="submit" class="search-button">Tìm kiếm</button>
                            </form>
                        </div>
                    </div>
                </section>
                <!-- Section: Grid -->
                <section>
                    <div class="bringer-grid-3cols bringer-tp-grid-2cols bringer-tp-centered-last-item stg-normal-gap bringer-parallax-media" data-stagger-appear="fade-up" data-threshold="0.5" data-stagger-delay="150" data-stagger-unload="fade-up">
                        <c:forEach var="a" items="${listOfArtist}">
                            <div class="bringer-block bringer-portfolio-card">
                                <div class="bringer-portfolio-card-image">
                                    <img class="bringer-lazy" src="${a.image}" data-src="${a.image}" alt="${a.artistName}" width="1200" height="1200">
                                </div>
                                <div class="bringer-portfolio-card-footer">
                                    <div class="bringer-portfolio-card-title">
                                        <span class="bringer-meta">${a.artistName}</span>
                                        <h6>${a.stageName}</h6>
                                    </div>
                                    <span class="bringer-icon bringer-icon-explore"></span>
                                </div>
                                <a href="artistdetail?aid=${a.artistID}"></a>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </div>

            <!-- Footer -->
            <jsp:include page="footer.jsp" />
        </main>

        <!-- Dynamic Backlight -->
        <div class="bringer-backlight"></div>

        <!-- JS Scripts -->
        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/libs.js"></script>
        <script src="js/contact_form.js"></script>
        <script src="js/st-core.js"></script>
        <script src="js/classes.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
