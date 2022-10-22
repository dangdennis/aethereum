module Web3 = struct
  open Eio
  open Cohttp_eio

  type sha_request = {
    jsonrpc : string;
    _method : string; [@key "method"]
    params : string list;
    id : int;
  }
  [@@deriving jsonaf]

  let sha3 env digest =
    print_endline "what is going on";
    Switch.run @@ fun sw ->
    print_endline digest;
    let hostname, port = ("localhost", 8545) in
    (* let hostname, port = ("www.google.com", 80) in *)
    let he = Unix.gethostbyname hostname in
    let addr = `Tcp (Eio_unix.Ipaddr.of_unix he.h_addr_list.(0), port) in
    let conn = Net.connect ~sw env#net addr in
    let host = (hostname, Some port) in
    let headers =
      Http.Header.of_list [ ("content-type", "application/json") ]
    in
    let req_body : sha_request =
      {
        jsonrpc = "2.0";
        _method = "web3_sha3";
        params =
          [
            "0xf7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c";
          ];
        id = 64;
      }
    in
    print_endline (jsonaf_of_sha_request req_body |> Jsonaf.to_string);
    let body =
      Body.Fixed (jsonaf_of_sha_request req_body |> Jsonaf.to_string)
    in
    let res = Client.post ~conn ~headers ~body host "/" in
    print_string @@ Client.read_fixed res

  let wuh () =
    Eio_main.run @@ fun env ->
    Switch.run @@ fun sw ->
    let hostname, port = ("www.example.org", 80) in
    let he = Unix.gethostbyname hostname in
    let addr = `Tcp (Eio_unix.Ipaddr.of_unix he.h_addr_list.(0), port) in
    let conn = Net.connect ~sw env#net addr in
    let host = (hostname, Some port) in
    let res = Client.get ~conn host "/" in
    print_string @@ Client.read_fixed res
end

let () =
  let _ = Web3.sha3 in
  ()

let%expect_test "wuh" =
  let _ = Web3.wuh in
  [%expect {| |}]
