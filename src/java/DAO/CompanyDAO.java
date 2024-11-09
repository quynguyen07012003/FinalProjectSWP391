/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;



import entity.Company;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyDAO extends DBContext{

    // Lấy tất cả các công ty
    public List<Company> getAllCompanies() {
        List<Company> companies = new ArrayList<>();
        String query = "SELECT * FROM Company";
        
        try (
             PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Company company = new Company();
                company.setCompanyID(rs.getInt("CompanyID"));
                company.setCompanyName(rs.getString("CompanyName"));
                company.setAddress(rs.getString("Address"));
                company.setPhoneNumber(rs.getString("PhoneNumber"));
                company.setEmail(rs.getString("Email"));
                companies.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companies;
    }

    // Lấy một công ty dựa trên ID
    public Company getCompanyByID(int companyID) {
        Company company = null;
        String query = "SELECT * FROM Company WHERE CompanyID = ?";
        
        try (
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, companyID);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                company = new Company();
                company.setCompanyID(rs.getInt("CompanyID"));
                company.setCompanyName(rs.getString("CompanyName"));
                company.setAddress(rs.getString("Address"));
                company.setPhoneNumber(rs.getString("PhoneNumber"));
                company.setEmail(rs.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return company;
    }

    // Thêm một công ty mới
    public boolean addCompany(Company company) {
        String query = "INSERT INTO Company (CompanyName, Address, PhoneNumber, Email) VALUES (?, ?, ?, ?)";
        
        try (
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, company.getCompanyName());
            statement.setString(2, company.getAddress());
            statement.setString(3, company.getPhoneNumber());
            statement.setString(4, company.getEmail());         
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật thông tin công ty
    public boolean updateCompany(Company company) {
        String query = "UPDATE Company SET CompanyName = ?, Address = ?, PhoneNumber = ?, Email = ? WHERE CompanyID = ?";
        
        try (
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, company.getCompanyName());
            statement.setString(2, company.getAddress());
            statement.setString(3, company.getPhoneNumber());
            statement.setString(4, company.getEmail());
            statement.setInt(5, company.getCompanyID());
            
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa một công ty
    public boolean deleteCompany(int companyID) {
        String query = "DELETE FROM Company WHERE CompanyID = ?";
        
        try (
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, companyID);
            
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

