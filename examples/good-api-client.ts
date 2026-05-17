// export type ApiResponse<T> = {
//   success: boolean;
//   message: string;
//   data: T;
// };

// export type CreateUserInput = {
//   email: string;
//   displayName: string;
//   password: string;
// };

// export type UserResponse = {
//   id: number;
//   email: string;
//   displayName: string;
// };

// const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? "";

// export async function createUser(input: CreateUserInput): Promise<UserResponse> {
//   const response = await fetch(`${API_BASE_URL}/api/users`, {
//     method: "POST",
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify(input),
//   });

//   const body = (await response.json()) as ApiResponse<UserResponse>;

//   if (!response.ok || !body.success) {
//     throw new Error(body.message || "Request failed");
//   }

//   return body.data;
// }
