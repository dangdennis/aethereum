type conn_meta = { hostname : string; port : int }

let make_conn ~env ~sw ~uri =
  let hostname, port =
    ( Uri.host_with_default ~default:"localhost" uri,
      Option.value ~default:8545 (Uri.port uri) )
  in
  let he = Unix.gethostbyname hostname in
  let addr = `Tcp (Eio_unix.Ipaddr.of_unix he.h_addr_list.(0), port) in
  Eio.Net.connect ~sw env#net addr

type request = {
  jsonrpc : string;
  _method : string; [@key "method"]
  params : string list;
  id : int;
}
[@@deriving jsonaf]