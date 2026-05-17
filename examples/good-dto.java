// package com.example.users.dto;

// import jakarta.validation.constraints.Email;
// import jakarta.validation.constraints.NotBlank;
// import jakarta.validation.constraints.Size;

// record CreateUserRequest(
//         @NotBlank
//         @Email
//         String email,

//         @NotBlank
//         @Size(max = 120)
//         String displayName,

//         @NotBlank
//         @Size(min = 8, max = 100)
//         String password
// ) {
// }

// record UserResponse(
//         Long id,
//         String email,
//         String displayName
// ) {
// }

// record ApiResponse<T>(
//         boolean success,
//         String message,
//         T data
// ) {
//     public static <T> ApiResponse<T> success(String message, T data) {
//         return new ApiResponse<>(true, message, data);
//     }
// }
