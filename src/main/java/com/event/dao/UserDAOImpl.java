package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.event.dto.User;
import com.event.util.DBConnection;

public class UserDAOImpl implements UserDAO {
	Connection con = null;

	@Override
	public boolean registerUser(User user) {
		con = DBConnection.ProvideConnection();
		String regsql = "INSERT INTO users(username, password, email, mobile, role, address)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = con.prepareStatement(regsql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getRole());
			ps.setString(6, user.getAddress());
			int count = ps.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public User loginUser(String email, String password) {
		con = DBConnection.ProvideConnection();
		String sqlquery = "SELECT * FROM users WHERE email = ? AND password = ?";

		try (
			PreparedStatement ps = con.prepareStatement(sqlquery)) {

			ps.setString(1, email);
			ps.setString(2, password);
			User user=null;
            System.out.println("syso");
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
                   System.out.println("I am inside if");
				    user = new User();
					user.setUserId(rs.getInt("user_id"));
					user.setUsername(rs.getString("username"));
					user.setEmail(rs.getString("email"));
					user.setMobile(rs.getString("mobile"));
					user.setRole(rs.getString("role"));
					user.setAddress(rs.getString("address"));
					user.setCreatedAt(rs.getTimestamp("created_at"));
					return user;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<User> getAllUsers() {
	    List<User> list = new ArrayList<>();
	    con = DBConnection.ProvideConnection();

	    String sql = "SELECT * FROM users ORDER BY created_at DESC";
	    try (PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            User u = new User();
	            u.setUserId(rs.getInt("user_id"));
	            u.setUsername(rs.getString("username"));
	            u.setEmail(rs.getString("email"));
	            u.setMobile(rs.getString("mobile"));
	            u.setRole(rs.getString("role"));
	            list.add(u);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public boolean deleteUser(int userId) {
	    con = DBConnection.ProvideConnection();
	    String sql = "DELETE FROM users WHERE user_id=?";
	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, userId);
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	@Override
	public List<User> searchUsers(String keyword) {

	    List<User> list = new ArrayList<>();
	    con = DBConnection.ProvideConnection();

	    String sql = "SELECT * FROM users WHERE username LIKE ? OR email LIKE ? OR role LIKE ?";
	    
	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, "%" + keyword + "%");
	        ps.setString(2, "%" + keyword + "%");
	        ps.setString(3, "%" + keyword + "%");
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            User u = new User();
	            u.setUserId(rs.getInt("user_id"));
	            u.setUsername(rs.getString("username"));
	            u.setEmail(rs.getString("email"));
	            u.setMobile(rs.getString("mobile"));
	            u.setRole(rs.getString("role"));
	            list.add(u);
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return list;
	}

	@Override
	public boolean updateUserStatus(int userId, String status) {
	    con = DBConnection.ProvideConnection();
	    String sql = "UPDATE users SET account_status=? WHERE user_id=?";

	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, status);
	        ps.setInt(2, userId);
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}


}
