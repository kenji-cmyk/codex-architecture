// package com.example.users.exception;

// import java.util.List;

// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.MethodArgumentNotValidException;
// import org.springframework.web.bind.annotation.ExceptionHandler;
// import org.springframework.web.bind.annotation.RestControllerAdvice;

// @RestControllerAdvice
// public class GlobalExceptionHandler {
//     @ExceptionHandler(EmailAlreadyUsedException.class)
//     public ResponseEntity<ErrorResponse> handleEmailAlreadyUsed(EmailAlreadyUsedException ex) {
//         return ResponseEntity
//                 .status(HttpStatus.CONFLICT)
//                 .body(ErrorResponse.of("Email is already in use"));
//     }

//     @ExceptionHandler(MethodArgumentNotValidException.class)
//     public ResponseEntity<ErrorResponse> handleValidation(MethodArgumentNotValidException ex) {
//         List<FieldErrorResponse> errors = ex.getBindingResult()
//                 .getFieldErrors()
//                 .stream()
//                 .map(error -> new FieldErrorResponse(error.getField(), error.getDefaultMessage()))
//                 .toList();

//         return ResponseEntity
//                 .badRequest()
//                 .body(ErrorResponse.withErrors("Validation failed", errors));
//     }
// }

// record ErrorResponse(
//         boolean success,
//         String message,
//         List<FieldErrorResponse> errors
// ) {
//     static ErrorResponse of(String message) {
//         return new ErrorResponse(false, message, List.of());
//     }

//     static ErrorResponse withErrors(String message, List<FieldErrorResponse> errors) {
//         return new ErrorResponse(false, message, errors);
//     }
// }

// record FieldErrorResponse(
//         String field,
//         String message
// ) {
// }
