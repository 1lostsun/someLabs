package org.example.src.interfaces;

import org.example.src.User;

public interface UserRepository {
	User findById(String id);
	void save(User user);
}