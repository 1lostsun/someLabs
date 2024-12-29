package org.example.src;

import org.example.src.interfaces.UserRepository;

public class UserService {
	private final UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public User getUserById(String id) {
		return userRepository.findById(id);
	}

	public void createUser(String id, String name) {
		User user = new User(id, name);
		userRepository.save(user);
	}
}
