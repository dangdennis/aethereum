let () =
  let t =
    Fetch.create
      ~headers:(Http.Header.of_list [ ("content-type", "application/json") ])
      ~base_url:"http://localhost:8545" ()
  in
  let resp =
    Aethereum.Jsonrpc.Web3.sha3 t
      "0xf7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c"
  in
  print_endline resp
