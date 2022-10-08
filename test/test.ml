let ctx = Secp256k1.Context.create [ Sign; Verify ]

let pub_key =
  "02f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c3532337877619"

let make_pub_key_from_hex () =
  let buff = pub_key |> Aethereum.Address.buffer_of_hex in
  Secp256k1.Key.read_pk_exn ctx buff

let make_pub_key_from_int_arr () =
  let int_arr =
    [
      247;
      115;
      126;
      69;
      180;
      61;
      206;
      136;
      176;
      58;
      14;
      251;
      163;
      119;
      183;
      51;
      220;
      33;
      166;
      85;
      89;
      253;
      169;
      240;
      21;
      195;
      83;
      35;
      55;
      135;
      118;
      25;
      39;
      83;
      236;
      186;
      20;
      8;
      154;
      3;
      37;
      183;
      120;
      143;
      237;
      114;
      101;
      86;
      143;
      148;
      63;
      227;
      245;
      95;
      115;
      138;
      121;
      34;
      79;
      69;
      21;
      209;
      61;
      76;
    ]
  in
  let b = Buffer.create 64 in
  let () = List.iter (fun i -> Buffer.add_int8 b i) int_arr in
  Buffer.to_bytes b

let () =
  let pub_key_js =
    EzHash.SHA3KEC.hash_bytes (make_pub_key_from_int_arr ())
    |> EzHash.SHA3KEC.raw |> EzHex.Hex.encode
  in

  let api_hash = Aethereum.Address.compute_address pub_key in

  if api_hash = pub_key_js then print_endline "pubkey matches"
  else print_endline "pk no match";

  ()

(* compressed pub key 0x02f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c3532337877619 *)
(* uncompressed pub key 0x04f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c *)
(* uncompressed pub key without prefix 0xf7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c *)
(* full uint8array rep passed into etherjs keccak [247, 115, 126, 69, 180, 61, 206, 136, 176, 58, 14, 251, 163, 119, 183,
     51, 220, 33, 166, 85, 89, 253, 169, 240, 21, 195, 83, 35, 55, 135, 118, 25, 39, 83,
      236, 186, 20, 8, 154, 3, 37, 183, 120, 143, 237, 114, 101, 86, 143, 148, 63,
      227, 245, 95, 115, 138, 121, 34, 79, 69, 21, 209, 61, 76] *)
(* hex of full uint8array f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c *)
(* hash 0xfcbb4a426e3d0e2e02362d401b64c49b4b6c195dc2475c41e3dd01cc5ba459c9 *)
(* address 0x1b64C49b4B6C195DC2475C41E3DD01Cc5bA459C9 *)

(* signed message "0x54c9e2ac1da4bbe572f4d26e84802839b089edf8e0dbccc61286be5aba9f26a4106ffefc1bd83d5ebb94b92faf47801aaf9da1f0b1f72e2c9776c8a456a832f31b" *)
(* signed tx "0x02f87481898085070218df4785070218df58825208941b64c49b4b6c195dc2475c41e3dd01cc5ba459c9872386f26fc1000080c080a0a55181db2941aac64cfc729428ff9eab753cb4cc6e8fe5ca9a2f09d63f890ab9a01e9b5ea17f6597604fca1f9dd8b4478c7baecf452d47e213e1eafe8c248479b1" *)
