let protocol_version t =
  let req = Request.make ~params:[] ~meth:Eth_ProtocolVersion in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"