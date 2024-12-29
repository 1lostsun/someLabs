package org.example.src.tests;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

class UserServiceTest {

	@Mock
	private UserRepository userRepository;

	private UserService userService;

	@BeforeEach
	void setUp() {
		MockitoAnnotations.openMocks(this);
		userService = new UserService(userRepository);
	}

	@Test
	void testGetUserById() {
		// Arrange
		User mockUser = new User("1", "John Doe");
		when(userRepository.findById("1")).thenReturn(mockUser);

		// Act
		User result = userService.getUserById("1");

		// Assert
		assertNotNull(result);
		assertEquals("John Doe", result.getName());
		verify(userRepository, times(1)).findById("1");
	}

	@Test
	void testCreateUser() {
		// Arrange
		User mockUser = new User("2", "Jane Doe");

		// Act
		userService.createUser("2", "Jane Doe");

		// Assert
		verify(userRepository, times(1)).save(mockUser);
	}
}
