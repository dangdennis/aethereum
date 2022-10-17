module Secp256k1 = Libsecp256k1.External

let ctx = Secp256k1.Context.create [ Sign; Verify ]

let buffer_of_hex s =
  let { Cstruct.buffer; _ } = Hex.to_cstruct (`Hex s) in
  buffer

let hex_of_buffer (b : Secp256k1.buffer) =
  let t = Cstruct.of_bigarray b in
  let h = Hex.of_cstruct t in
  Hex.show h

let prefix_with_hex s = "0x" ^ s

let compute_address pk =
  let buffer_of_uncompressed_pub_key =
    pk |> buffer_of_hex
    |> Secp256k1.Key.read_pk_exn ctx
    |> Secp256k1.Key.to_bytes ?compress:(Some false) ctx
  in
  let hex = hex_of_buffer buffer_of_uncompressed_pub_key in
  let san_prefix_pubkey = String.sub hex 2 (String.length hex - 2) in

  let buf = Buffer.create 64 in
  san_prefix_pubkey
  |> String.iteri (fun i _ ->
         match i with
         | i when i mod 2 = 0 ->
             "0x" ^ String.sub san_prefix_pubkey i 2
             |> int_of_string |> Buffer.add_int8 buf
         | _ -> ());
  let keccaked_pk =
    EzHash.SHA3KEC.hash_bytes (Buffer.to_bytes buf)
    |> EzHash.SHA3KEC.raw |> EzHex.Hex.encode
  in

  String.sub keccaked_pk 24 (String.length keccaked_pk - 24) |> prefix_with_hex

let%expect_test _ =
  let pub_key =
    "02f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c3532337877619"
  in
  let address = compute_address pub_key in
  print_string address;
  [%expect {| 0x1b64c49b4b6c195dc2475c41e3dd01cc5ba459c9 |}]


