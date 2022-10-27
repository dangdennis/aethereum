module Headers = Http.Header
module Method = Http.Method
module Status = Http.Status

exception InvalidRequest of string

module Config = struct
  type t = { base_url : string option; headers : Headers.t } [@@deriving make]
end

let create = Config.make

let fetch ?body ?(headers = []) ?(meth = `GET) (config : Config.t) url =
  print_endline (config.base_url |> Option.value ~default:"");

  let body =
    match body with
    | Some body -> Cohttp_eio.Body.Fixed body
    | None -> Cohttp_eio.Body.Empty
  in

  (*  merge headers from config *)
  let headers = Headers.add_list config.headers headers in

  Eio_main.run @@ fun env ->
  Eio.Switch.run @@ fun sw ->
  let uri =
    match config.base_url with
    | None -> Uri.of_string url
    | Some base_url -> Uri.of_string base_url
  in
  let port =
    match Uri.port uri with
    | Some port -> port
    | None -> (
        match Uri.scheme uri with
        | None -> raise (InvalidRequest "scheme is missing")
        | Some scheme -> (
            match scheme with
            | "https" -> 443
            | "http" -> 40
            | s ->
                raise (InvalidRequest (Format.sprintf "%s is not supported" s)))
        )
  in
  let hostname = Uri.host_with_default ~default:"localhost" uri in
  let he = Unix.gethostbyname hostname in
  let addr = `Tcp (Eio_unix.Ipaddr.of_unix he.h_addr_list.(0), port) in
  let conn = Eio.Net.connect ~sw env#net addr in
  let res =
    Cohttp_eio.Client.call ~meth ~conn ~headers ~body (hostname, Some port) "/"
  in
  Cohttp_eio.Client.read_fixed res

let get = fetch ~meth:`GET
let post = fetch ~meth:`POST
let put = fetch ~meth:`PUT
let delete = fetch ~meth:`DELETE
