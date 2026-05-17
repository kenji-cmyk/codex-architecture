// import { useEffect, useState } from "react";
// import { createUser, type CreateUserInput, type UserResponse } from "./good-api-client";

// type Status =
//   | { state: "idle" }
//   | { state: "loading" }
//   | { state: "success"; user: UserResponse }
//   | { state: "error"; message: string };

// export function CreateUserForm() {
//   const [form, setForm] = useState<CreateUserInput>({
//     email: "",
//     displayName: "",
//     password: "",
//   });
//   const [status, setStatus] = useState<Status>({ state: "idle" });

//   useEffect(() => {
//     if (status.state !== "success") {
//       return;
//     }

//     setForm({ email: "", displayName: "", password: "" });
//   }, [status]);

//   async function handleSubmit(event: React.FormEvent<HTMLFormElement>) {
//     event.preventDefault();
//     setStatus({ state: "loading" });

//     try {
//       const user = await createUser(form);
//       setStatus({ state: "success", user });
//     } catch (error) {
//       setStatus({
//         state: "error",
//         message: error instanceof Error ? error.message : "Unable to create user",
//       });
//     }
//   }

//   return (
//     <form onSubmit={handleSubmit} aria-busy={status.state === "loading"}>
//       <label>
//         Email
//         <input
//           type="email"
//           value={form.email}
//           onChange={(event) => setForm({ ...form, email: event.target.value })}
//           required
//         />
//       </label>

//       <label>
//         Display name
//         <input
//           value={form.displayName}
//           onChange={(event) => setForm({ ...form, displayName: event.target.value })}
//           required
//         />
//       </label>

//       <label>
//         Password
//         <input
//           type="password"
//           value={form.password}
//           onChange={(event) => setForm({ ...form, password: event.target.value })}
//           minLength={8}
//           required
//         />
//       </label>

//       <button type="submit" disabled={status.state === "loading"}>
//         {status.state === "loading" ? "Creating..." : "Create user"}
//       </button>

//       {status.state === "error" && <p role="alert">{status.message}</p>}
//       {status.state === "success" && <p>User created: {status.user.email}</p>}
//     </form>
//   );
// }
