open Cohttp_eio

let sha3 ~env ~sw ~url hashable =
  let uri = Uri.of_string url in
  let conn = Request.make_conn ~env ~sw ~uri in
  let host = (Uri.host_with_default ~default:"localhost" uri, Uri.port uri) in
  let headers = Http.Header.of_list [ ("content-type", "application/json") ] in
  let req_body =
    {
      Request.jsonrpc = "2.0";
      _method = "web3_sha3";
      params = [ hashable ];
      id = 64;
      (* what should id be *)
    }
  in
  let body =
    Body.Fixed (Request.jsonaf_of_request req_body |> Jsonaf.to_string)
  in
  let res = Client.post ~conn ~headers ~body host "/" in
  Client.read_fixed res

(* let%expect_test "sha3" =
   let () = Eio_main.run @@ fun env -> Web3.sha3 env "" in
   [%expect {| |}] *)
