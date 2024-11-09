<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Artist</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body { 
                background-color: #f2f5f9;
                color: #495057;
                font-family: 'Montserrat', sans-serif;
            }
            .container {
                
                margin-top: 120px;
                max-width: 800px;
                background-color: black;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #007bff;
                font-weight: 700;
                text-align: center;
                margin-bottom: 30px;
            }
            .table {
                background-color: white;
                overflow: hidden;
            }
            .table th {
                background-color: #007bff;
                color: #ffffff;
                font-weight: 600;
                text-align: center;
            }
            .table td {
                color: #495057;
                vertical-align: middle;
                font-size: 0.9rem;
                padding: 15px;
                text-align: center;
            }
            .btn-group {
                display: flex;
                justify-content: center;
                gap: 10px;
            }
            .btn {
                font-size: 0.85rem;
                font-weight: 600;
                border-radius: 5px;
                padding: 8px 15px;
                transition: all 0.2s;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-info {
                background-color: #17a2b8;
                border: none;
            }
            .btn-warning {
                background-color: #ffc107;
                border: none;
                color: #212529;
            }
            .btn:hover {
                opacity: 0.85;
            }
            .table tbody tr:hover {
                background-color: #f0f4fa;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="btn-group">
                                <a href="song?artistID=${artist.artistID}" class="btn btn-primary btn-sm">Edit Song</a>
                                <a href="album?artistID=${artist.artistID}" class="btn btn-info btn-sm">Edit Album</a>
                                <a href="ArtistMangeController?action=editSocial&artistID=${artist.artistID}" class="btn btn-warning btn-sm">Edit Social Media</a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp" />
        
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>  
