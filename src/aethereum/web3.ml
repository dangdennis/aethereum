let sha3 t hashable =
  let req = Request.make ~params:[ hashable ] ~meth:Web3_Sha3 in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"

let client_version t =
  let req = Request.make ~params:[] ~meth:Web3_ClientVersion in
  let body = Request.jsonaf_of_t req |> Jsonaf.to_string in
  Fetch.post ~body t "/"