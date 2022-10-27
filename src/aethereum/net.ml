let version t =
  let req =
    {
      Request.jsonrpc = "2.0";
      _method = "net_version";
      params = [ ];
      id = 64;
    }
  in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"

let listening t =
  let req =
    {
      Request.jsonrpc = "2.0";
      _method = "net_listening";
      params = [];
      id = 1;
    }
  in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"