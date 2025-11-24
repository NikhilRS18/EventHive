package com.event.dao;

import com.event.dto.User;

public interface UserDAO {
	boolean registerUser(User user);
	User loginUser(String email, String password);


}
