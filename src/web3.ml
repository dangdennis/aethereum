let sha3 ~url hashable =
  let req_body =
    {
      Request.jsonrpc = "2.0";
      _method = "web3_sha3";
      params = [ hashable ];
      (* what should id be *)
      id = 64;
    }
  in
  let body = Request.jsonaf_of_request req_body |> Jsonaf.to_string in
  Fetch_eio.post ~body url

(* let%expect_test "sha3" =
   let () = Eio_main.run @@ fun env -> Web3.sha3 env "" in
   [%expect {| |}] *)
