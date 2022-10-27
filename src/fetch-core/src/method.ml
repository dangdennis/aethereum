type standard =
  [ `CONNECT
  | `DELETE
  | `GET
  | `HEAD
  | `OPTIONS
  | `POST
  | `PUT
  | `PATCH
  | `TRACE ]

type t = [ standard | `Other of string ]

let of_string c =
  match c with
  | "CONNECT" -> `CONNECT
  | "DELETE" -> `DELETE
  | "GET" -> `GET
  | "HEAD" -> `HEAD
  | "OPTIONS" -> `OPTIONS
  | "POST" -> `POST
  | "PUT" -> `PUT
  | "TRACE" -> `TRACE
  | "PATCH" -> `PATCH
  | s -> `Other s

let to_string c =
  match c with
  | `CONNECT -> "CONNECT"
  | `DELETE -> "DELETE"
  | `GET -> "GET"
  | `HEAD -> "HEAD"
  | `OPTIONS -> "OPTIONS"
  | `POST -> "POST"
  | `PUT -> "PUT"
  | `PATCH -> "PATCH"
  | `TRACE -> "TRACE"
  | `Other v -> v
