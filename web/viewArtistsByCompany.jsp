<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Page Title -->
        <title>Artists in Company</title>

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

        <!-- Custom CSS for interactive cards -->
        <style>
            .artist-card {
                cursor: pointer;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                position: relative;
            }
            .artist-card.selected {
                border: 2px solid #007bff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transform: scale(1.05);
            }
            .artist-card:hover {
                transform: scale(1.02);
            }
            .hidden-input {
                display: none;
            }
            .view-detail-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: #007bff;
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
            }
            .view-detail-btn:hover {
                background-color: #0056b3;
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
                                <h1 class="bringer-page-title" data-appear="fade-up" data-unload="fade-up">ARTISTS IN COMPANY</h1>
                                <p class="bringer-large-text" data-appear="fade-up" data-delay="100" data-unload="fade-up">Discover Talented Artists</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Artists Grid with interactive cards -->
                <section>
                    <form action="UserBookController" method="post" id="bookingForm">
                        <input type="hidden" name="action" value="bookArtist"/>
                        <div class="bringer-grid-3cols bringer-tp-grid-2cols bringer-tp-centered-last-item stg-normal-gap bringer-parallax-media" data-stagger-appear="fade-up" data-threshold="0.5" data-stagger-delay="150" data-stagger-unload="fade-up">
                            <c:forEach var="artist" items="${artists}">
                                <div class="bringer-block bringer-portfolio-card artist-card" data-artist-id="${artist.artistID}" onclick="toggleSelection(this)">
                                    <div class="bringer-portfolio-card-footer">
                                        <div class="bringer-portfolio-card-title">
                                            <span class="bringer-meta">${artist.artistName}</span>
                                            <h6>${artist.stageName}</h6>
                                        </div>
                                        <a href="artistdetail?aid=${artist.artistID}" class="view-detail-btn">View Detail</a>
                                    </div>
                                    <input type="checkbox" name="artistIDs" value="${artist.artistID}" class="hidden-input">
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Booking Button -->
                        <div class="align-center" style="margin-top: 20px;">
                            <button type="submit" class="btn btn-primary">Book Selected Artists</button>
                        </div>
                    </form>
                </section>

            </div><!-- .stg-container -->

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

        <!-- JavaScript for interactive card selection -->
        <script>
                                    function toggleSelection(card) {
                                        const checkbox = card.querySelector('.hidden-input');

                                        if (card.classList.contains('selected')) {
                                            card.classList.remove('selected');
                                            checkbox.checked = false;
                                        } else {
                                            card.classList.add('selected');
                                            checkbox.checked = true;
                                        }
                                    }
        </script>
    </body>
</html>
