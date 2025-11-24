package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
