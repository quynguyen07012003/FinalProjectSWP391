<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Page Title -->
        <title>Companies</title>

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
                                <h1 class="bringer-page-title" data-appear="fade-up" data-unload="fade-up">COMPANIES</h1>
                                <p class="bringer-large-text" data-appear="fade-up" data-delay="100" data-unload="fade-up">Explore the Companies and Their Artists</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Companies Grid -->
                <section>
                    <div class="bringer-grid-3cols bringer-tp-grid-2cols bringer-tp-centered-last-item stg-normal-gap bringer-parallax-media" data-stagger-appear="fade-up" data-threshold="0.5" data-stagger-delay="150" data-stagger-unload="fade-up">
                        <c:forEach var="company" items="${companies}">
                            <div class="bringer-block bringer-portfolio-card">
                                <div class="bringer-portfolio-card-footer">
                                    <div class="bringer-portfolio-card-title">
                                        <span class="bringer-meta">${company.companyName}</span>
                                        <h6>${company.phoneNumber}</h6>
                                        <p>${company.email}</p>
                                        <p>${company.address}</p>
                                    </div>
                                    <span class="bringer-icon bringer-icon-explore"></span>
                                </div>
                                <a href="company?action=viewArtists&companyID=${company.companyID}"></a>
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

        <!-- JS Scripts -->
        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/libs.js"></script>
        <script src="js/contact_form.js"></script>
        <script src="js/st-core.js"></script>
        <script src="js/classes.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
