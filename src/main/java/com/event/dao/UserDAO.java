package com.event.dao;

import java.util.List;

import com.event.dto.User;

public interface UserDAO {
	boolean registerUser(User user);
	User loginUser(String email, String password);
	
	
	List<User> getAllUsers();
	boolean updateUserStatus(int userId, String status);
	boolean deleteUser(int userId);
	List<User> searchUsers(String keyword);



}
