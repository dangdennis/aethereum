let sha3 t hashable =
  let req =
    {
      Request.jsonrpc = "2.0";
      _method = "web3_sha3";
      params = [ hashable ];
      (* what should id be *)
      id = 64;
    }
  in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"

let client_version t =
  let req =
    {
      Request.jsonrpc = "2.0";
      _method = "web3_clientVersion";
      params = [];
      id = 1;
    }
  in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"