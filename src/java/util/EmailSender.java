/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import entity.Cart;
import entity.Product;
import java.math.BigDecimal;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailSender {

    private static final String HOST = "smtp.gmail.com";
    private static final String PORT = "587"; // Cổng cho TLS
    private static final String USER_NAME = "phevaicut03112004@gmail.com"; // Thay thế bằng email của bạn
    private static final String PASSWORD = "gsvu tvmt ltyk zalg"; // Thay thế bằng mật khẩu của bạn

    // Phương thức gửi email
    public static void sendEmail(String toAddress, String subject, String message) throws MessagingException {

        // Thiết lập các thuộc tính cho kết nối SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.host", HOST);
        properties.put("mail.smtp.port", PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER_NAME, PASSWORD);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // Tạo email
        Message msg = new MimeMessage(session);

        // Thiết lập người gửi
        msg.setFrom(new InternetAddress(USER_NAME));

        // Thiết lập người nhận
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);

        // Thiết lập chủ đề email
        msg.setSubject(subject);

        // Thiết lập nội dung email
        msg.setSentDate(new java.util.Date());
        msg.setText(message);

        // Gửi email
        Transport.send(msg);

        System.out.println("Email đã được gửi thành công.");
    }

    public static void sendOrderEmail(String toAddress, String fullName, String phoneNumber, String address,
            int totalItems, double totalPrice, List<Cart> cartItems) throws MessagingException {

        // Thiết lập thuộc tính SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.host", HOST);
        properties.put("mail.smtp.port", PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Xác thực tài khoản email
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER_NAME, PASSWORD);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // Tạo email
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(USER_NAME));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject("Thông tin đơn hàng của bạn");
        msg.setSentDate(new java.util.Date());

        // Xây dựng nội dung HTML cho đơn hàng với CSS inline
        StringBuilder content = new StringBuilder();
        content.append("<h3>Chào ").append(fullName).append(",</h3>");
        content.append("<p>Cảm ơn bạn đã đặt hàng! Dưới đây là thông tin chi tiết đơn hàng của bạn:</p>");
        content.append("<p><strong>Số điện thoại:</strong> ").append(phoneNumber).append("</p>");
        content.append("<p><strong>Địa chỉ:</strong> ").append(address).append("</p>");
        content.append("<p><strong>Tổng số lượng sản phẩm:</strong> ").append(totalItems).append("</p>");
        content.append("<p><strong>Tổng giá trị:</strong> ").append(String.format("%.0f", totalPrice)).append(" &#8363;</p>");

// Tạo bảng thông tin sản phẩm với CSS inline
        content.append("<h4>Thông tin sản phẩm:</h4>");
        content.append("<table border='1' cellpadding='5' cellspacing='0' style='border-collapse:collapse; width:100%; font-family: Arial, sans-serif;'>");
        content.append("<tr><th style='padding:8px;'>Sản phẩm</th><th style='padding:8px;'>Mô tả</th><th style='padding:8px;'>Số lượng</th><th style='padding:8px;'>Đơn giá</th><th style='padding:8px;'>Thành tiền</th></tr>");

        for (Cart item : cartItems) {
            Product product = item.getProduct();
            int quantity = item.getQuantity();
            BigDecimal totalItemPrice = product.getPrice().multiply(BigDecimal.valueOf(quantity));

            content.append("<tr>");
            content.append("<td style='padding:8px;'>").append(product.getProductName()).append("</td>");
            content.append("<td style='padding:8px;'>")
                    .append("<a href='productDetailPageUrl'>")
                    .append("<img src='").append(product.getProductImage()).append("' alt='Product Image' style='width: 80px; height: auto; border:1px solid #ddd;'>")
                    .append("</a>")
                    .append("</td>");
            content.append("<td style='padding:8px;'>").append(quantity).append("</td>");
            content.append("<td style='padding:8px;'>").append(String.format("%.0f", product.getPrice())).append(" &#8363;</td>");
            content.append("<td style='padding:8px;'>").append(String.format("%.0f", totalItemPrice)).append(" &#8363;</td>");
            content.append("</tr>");
        }

        content.append("</table>");
        content.append("<br><p>Xin cảm ơn bạn đã tin tưởng và mua sắm cùng chúng tôi!</p><br>");
        content.append("<p>Trân trọng,</p><p>Bye Bye!</p>");

        // Thiết lập nội dung email là HTML
        msg.setContent(content.toString(), "text/html; charset=UTF-8");

        // Gửi email
        Transport.send(msg);

        System.out.println("Email đơn hàng đã được gửi thành công.");
    }

    public static void main(String[] args) {
        // Thông tin email
        String toAddress = "dinhdau200@gmail.com"; // Email người nhận
        String subject = "Thử nghiệm gửi email qua Java";
        String message = "Đây là email được gửi từ chương trình Java.";

        try {
            // Tạo đối tượng Product
            Product product = new Product(USER_NAME, subject, message, BigDecimal.ONE);

            // Tạo đối tượng CartItem từ Product với số lượng là 1
            Cart cartItem = new Cart(1, product);

            // Tạo danh sách CartItem và thêm CartItem vào danh sách
            List<Cart> cartItems = new ArrayList<>();
            cartItems.add(cartItem);

            // Gọi phương thức sendOrderEmail với danh sách CartItem
            sendOrderEmail(toAddress, "Nguyễn Đình Quý", "0981939946", toAddress, cartItems.size(), 234, cartItems);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
