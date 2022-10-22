let () =
  let url = "http://localhost:8545" in
  Eio_main.run @@ fun env ->
  Eio.Switch.run @@ fun sw ->
  let s =
    Aethereum.Jsonrpc.Web3.sha3 ~env ~sw ~url
      "0xf7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c"
  in
  print_endline s
