// package com.example.users.service;

// import com.example.users.dto.CreateUserRequest;
// import com.example.users.dto.UserResponse;
// import com.example.users.entity.User;
// import com.example.users.exception.EmailAlreadyUsedException;
// import com.example.users.mapper.UserMapper;
// import com.example.users.repository.UserRepository;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.stereotype.Service;
// import org.springframework.transaction.annotation.Transactional;

// @Service
// public class UserService {
//     private final UserRepository userRepository;
//     private final PasswordEncoder passwordEncoder;
//     private final UserMapper userMapper;

//     public UserService(
//             UserRepository userRepository,
//             PasswordEncoder passwordEncoder,
//             UserMapper userMapper
//     ) {
//         this.userRepository = userRepository;
//         this.passwordEncoder = passwordEncoder;
//         this.userMapper = userMapper;
//     }

//     @Transactional
//     public UserResponse createUser(CreateUserRequest request) {
//         if (userRepository.existsByEmail(request.email())) {
//             throw new EmailAlreadyUsedException(request.email());
//         }

//         User user = new User();
//         user.setEmail(request.email());
//         user.setDisplayName(request.displayName());
//         user.setPasswordHash(passwordEncoder.encode(request.password()));

//         return userMapper.toResponse(userRepository.save(user));
//     }
// }
