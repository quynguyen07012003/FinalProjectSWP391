package controller;

import DAO.ProductDAO;
import entity.EventDetails;
import entity.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.math.BigDecimal;
import java.util.ArrayList;
import util.Upload;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/product")
public class ProductController extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action != null ? action : "";

        if ("edit".equals(action)) {
            handleEditProduct(request, response);
        } else if ("deactivate".equals(action)) {
            handleDeactiveProduct(request, response);
        } else if ("activate".equals(action)) {
            handleActivateProduct(request, response);
        } else if ("add".equals(action)) {
            showAddProductForm(request, response);
        } else if ("search".equals(action)) {
            handleSearchProducts(request, response);
        } else {
            handleViewProducts(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        action = action != null ? action : "";
        if ("update".equals(action)) {
            handleUpdateProduct(request, response);
        } else if ("add".equals(action)) {
            handleAddProduct(request, response);
        } else {
            handleViewProducts(request, response);
        }
    }

    private void handleViewProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int itemsPerPage = 5;

        List<Product> allProducts = productDAO.getAllProductsWithEvent();

        int totalItems = allProducts.size();
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, totalItems);

        List<Product> pagedProducts = allProducts.subList(startIndex, endIndex);

        request.setAttribute("products", pagedProducts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Chuyển tiếp tới trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProducts.jsp");
        dispatcher.forward(request, response);
    }

    private void handleSearchProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int itemsPerPage = 5;
        String searchKeyword = request.getParameter("search");
        List<Product> products;

        if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
            handleViewProducts(request, response);
        } else {
            products = productDAO.searchProducts(searchKeyword);

            int totalItems = products.size();
            int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

            int startIndex = (currentPage - 1) * itemsPerPage;
            int endIndex = Math.min(startIndex + itemsPerPage, totalItems);

            List<Product> pagedProducts = products.subList(startIndex, endIndex);

            request.setAttribute("products", pagedProducts);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("search", searchKeyword);

            RequestDispatcher dispatcher = request.getRequestDispatcher("viewProducts.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void handleEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.getProductByID(productID);
        List<EventDetails> events = productDAO.getAllEvents();

        request.setAttribute("product", product);
        request.setAttribute("events", events);

        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_product.jsp");
        dispatcher.forward(request, response);
    }

    private void handleDeactiveProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        boolean isDeactive = productDAO.deactivateProduct(productID);

        if (isDeactive) {
            request.setAttribute("message", "Sản phẩm đã được xóa thành công.");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra, không thể xóa sản phẩm.");
        }

        handleViewProducts(request, response);
    }

    private void handleActivateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        boolean isActivated = productDAO.activateProduct(productID);

        if (isActivated) {
            request.setAttribute("message", "Sản phẩm đã được kích hoạt thành công.");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra, không thể kích hoạt sản phẩm.");
        }

        handleViewProducts(request, response);
    }

    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        List<String> errors = validateProduct(request, product);

        if (!errors.isEmpty()) {
            List<EventDetails> events = productDAO.getAllEvents();
            request.setAttribute("errors", errors);
            request.setAttribute("product", product);
            request.setAttribute("events", events);
            RequestDispatcher dispatcher = request.getRequestDispatcher("edit_product.jsp");
            dispatcher.forward(request, response);
        } else {
            int id = Integer.parseInt(request.getParameter("productID"));
            product.setProductID(id);
            productDAO.updateProduct(product);
            response.sendRedirect("product");
        }
    }

    private void showAddProductForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<EventDetails> events = productDAO.getAllEvents();
        request.setAttribute("events", events);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_product.jsp");
        dispatcher.forward(request, response);
    }

    private void handleAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Product product = new Product();
            List<String> errors = validateProduct(request, product);

            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                showAddProductForm(request, response);
            } else {
                boolean isAdded = productDAO.addProduct(product);
                if (isAdded) {
                    response.sendRedirect("product");
                } else {
                    request.setAttribute("errorMessage", "Failed to add product.");
                    showAddProductForm(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private List<String> validateProduct(HttpServletRequest request, Product product) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();

        // Kiểm tra tên sản phẩm
        String productName = request.getParameter("productName");
        if (productName == null || productName.trim().isEmpty()) {
            errors.add("Product Name is required.");
        } else {
            product.setProductName(productName);
        }

        // Xử lý ảnh sản phẩm
        Upload upload = new Upload();
        Part part = request.getPart("productImage");
        String oldImage = request.getParameter("oldImage"); 

        if (part != null && part.getSize() > 0) {
            String filePath = "./uploads/product";
            String uploadPath = getServletContext().getRealPath(filePath);
            String newFile = upload.uploadFile(part, uploadPath); 
            String namePathSaveDB = filePath + "/" + newFile;
            product.setProductImage(namePathSaveDB); 
        } else {
            product.setProductImage(oldImage); 
        }

        // Kiểm tra mô tả
        String description = request.getParameter("description");
        if (description == null || description.trim().isEmpty()) {
            errors.add("Description is required.");
        } else {
            product.setDescription(description);
        }

        // Kiểm tra giá sản phẩm
        String priceStr = request.getParameter("price");
        try {
            BigDecimal price = new BigDecimal(priceStr);
            if (price.compareTo(BigDecimal.ZERO) <= 0) {
                errors.add("Price must be greater than 0.");
            } else {
                product.setPrice(price);
            }
        } catch (NumberFormatException e) {
            errors.add("Price must be a valid number.");
        }

        // Kiểm tra số lượng sản phẩm
        String stockStr = request.getParameter("stock");
        try {
            int stock = Integer.parseInt(stockStr);
            if (stock < 0) {
                errors.add("Stock must be 0 or greater.");
            } else {
                product.setStock(stock);
            }
        } catch (NumberFormatException e) {
            errors.add("Stock must be a valid integer.");
        }

        // Kiểm tra ID sự kiện
        String eventIDStr = request.getParameter("eventID");
        try {
            int eventID = Integer.parseInt(eventIDStr);
            product.setEventID(eventID);
        } catch (NumberFormatException e) {
            errors.add("Event is invalid.");
        }

        return errors;
    }

}
