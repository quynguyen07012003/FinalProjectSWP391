<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify Your Email</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for Animation -->
    <style>
        .spinner-border {
            width: 5rem;
            height: 5rem;
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .fade-in {
            animation: fadeIn 1.5s ease-in;
        }

        .waiting-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        .waiting-box {
            text-align: center;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in;
        }

        .waiting-box h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .waiting-box p {
            font-size: 1.2rem;
            color: #6c757d;
        }

        .verify-email-link {
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="waiting-container">
        <div class="waiting-box">
            <!-- Animation Spinner -->
            <div class="spinner-border text-primary mb-4 fade-in" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            
            <!-- Main Message -->
            <h1 class="fade-in">Verify Your Email</h1>
            <p class="fade-in">We have sent a verification link to your email address.</p>
            <p class="fade-in">Please check your inbox and follow the link to complete your registration.</p>

            <!-- Extra Info -->
            <p class="fade-in">Didn't receive the email? <a href="#" class="verify-email-link">Resend verification email</a>.</p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
