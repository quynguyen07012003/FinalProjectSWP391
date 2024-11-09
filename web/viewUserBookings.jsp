<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Page Title -->
        <title>Your Bookings</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
        <!-- Custom Styles -->
        <style>
            .booking-card {
                background-color: #ffffff;
                border: 1px solid #ced4da;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .booking-card:hover {
                transform: scale(1.02);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }
            .booking-header {
                font-size: 1.5rem;
                font-weight: 700;
                color: #343a40; /* Đổi màu thành đen đậm */
            }
            .booking-details {
                margin-top: 10px;
                font-size: 1.1rem;
                color: #495057; /* Màu xám đậm */
            }
            .status-pending {
                color: #ffca2c; /* Màu vàng đậm hơn cho "Pending" */
            }
            .status-confirmed {
                color: #198754; /* Màu xanh đậm hơn cho "Confirmed" */
            }
            .status-canceled {
                color: #dc3545; /* Giữ màu đỏ cho "Canceled" */
            }
            .btn-primary {
                margin-top: 20px;
                background-color: #007bff;
                border-color: #007bff;
                font-size: 1.1rem;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>
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
                <div class="container">
                    <h1 class="text-center my-4">Your Bookings</h1>

                    <c:forEach var="booking" items="${bookings}">
                        <div class="booking-card">
                            <div class="booking-header">
                                Booking ID: ${booking.bookingID}
                            </div>
                            <div class="booking-details">
                                <p>Artist ID: ${booking.artistID}</p>
                                <p>Booking Date: ${booking.bookingDate}</p>
                                <p>Name book: ${booking.user.fullname}<p>
                                <p>Email book: ${booking.user.email}<p>
                                <p>Artist Name: ${booking.artist.artistName}<p>
                                <p>Status:
                                    <span class="status-${booking.status.toLowerCase()}">${booking.status}</span>
                                </p>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="text-center">
                        <a href="company" class="btn btn-primary">Book Another Artist</a>
                    </div>
                </div>
            </div>
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
