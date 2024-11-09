<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Page Title -->
        <title>Artist's Songs</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- FontAwesome for Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Custom CSS -->
        <link type="text/css" rel="stylesheet" href="css/style.css">

        <!-- Custom CSS for interactive cards -->

    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <style>
            .song-card {
                cursor: pointer;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                position: relative;
                padding: 20px;
                background-color: #007bff; /* Adjust to match the background */
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                color: white; /* Set text color to white */
            }
            .song-card:hover {
                transform: scale(1.02);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }
            .song-details {
                color: #e0e0e0;
                margin-bottom: 5px;
            }
            .bringer-portfolio-card > a {
                position: absolute;
                left: unset;
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
            .song-title {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 10px;
            }
        </style>
        <!-- Page Main -->
        <main id="bringer-main">
            <div class="stg-container">
                <!-- Section: Page Title -->
                <section class="backlight-bottom">
                    <div class="stg-row">
                        <div class="stg-col-6 stg-offset-3">
                            <div class="align-center">
                                <h1 class="bringer-page-title" data-appear="fade-up" data-unload="fade-up">Khám phá kho âm nhạc</h1>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Songs Grid -->
                <section>
                    <div class="bringer-grid-3cols bringer-tp-grid-2cols bringer-tp-centered-last-item stg-normal-gap bringer-parallax-media" data-stagger-appear="fade-up" data-threshold="0.5" data-stagger-delay="150" data-stagger-unload="fade-up">
                        <c:forEach var="song" items="${songs}">
                            <div class="bringer-block bringer-portfolio-card song-card">
                                <!-- Make the song title a link to the song -->
                                <h4 class="song-title">
                                    <a href="${song.linkToSong}" target="_blank" style="color: inherit; text-decoration: none;">
                                        ${song.songName}
                                    </a>
                                </h4>
                                <p class="song-details">Ngày phát hành: ${song.releaseDate}</p>
                                <p class="song-details">Thể loại: ${song.genreString}</p>

                                <!-- Button for listening -->
                                <button class="view-detail-btn" style="left: unset; background: none; border: none; padding: 0; cursor: pointer;" onclick="window.open('${song.linkToSong}', '_blank');">
                                    <i class="fas fa-play-circle"></i>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                </section>


            </div><!-- .stg-container -->

            <!-- Footer -->
            <jsp:include page="footer.jsp" />
        </main>

        <!-- Dynamic Backlight -->
        <div class="bringer-backlight"></div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
