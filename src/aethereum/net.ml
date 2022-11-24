let version t =
  let req = Request.make ~params:[] ~meth:Net_Version in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"

let listening t =
  let req = Request.make ~params:[] ~meth:Net_Listening in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"

let peer_count t =
  let req = Request.make ~params:[] ~meth:Net_PeerCount in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"