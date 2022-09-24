
let () =
  let pub_key = "02f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c3532337877619" in
  let hex_pub_key = pub_key |> Aethereum.Hex.encode  in 
  hex_pub_key|> print_endline ;
  let dig = Aethereum.Hash.digest `SHA3_KEC pub_key in
  Aethereum.Hex.encode dig |> String.uppercase_ascii |> print_endline;
  ()