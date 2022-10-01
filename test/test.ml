let ctx = Secp256k1.Context.create [ Sign; Verify ]

let buffer_of_hex s =
  let { Cstruct.buffer; _ } = Hex.to_cstruct (`Hex s) in
  buffer

let hex_of_buffer (b : Secp256k1.buffer) =
  let t = Cstruct.of_bigarray b in
  let h = Hex.of_cstruct t in
  Hex.show h

let cstruct_testable = Alcotest.testable Cstruct.hexdump_pp Cstruct.equal

let assert_eq_cstruct a b =
  let a = Cstruct.of_bigarray a in
  let b = Cstruct.of_bigarray b in
  assert (Alcotest.equal cstruct_testable a b)

let make_pub_key_from_hex () =
  let pub_key =
    "02f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c3532337877619"
  in
  let buff = pub_key |> buffer_of_hex in
  let pk = Secp256k1.Key.read_pk_exn ctx buff in
  pk

let make_pub_key_from_int_arr () =
  let int_arr =
    [
      2;
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
    ]
  in
  let b = Buffer.create 32 in
  let () = List.iter (fun i -> Buffer.add_int8 b i) int_arr in
  Buffer.to_bytes b |> EzHex.Hex.encode_bytes

let () =
  let hex_pubkey = make_pub_key_from_hex () in
  let buff = Secp256k1.Key.to_bytes ctx hex_pubkey in
  let s = hex_of_buffer buff in
  s |> Format.printf "hex_pubkey %s\n";

  let intarr_pubkey = make_pub_key_from_int_arr () in
  Format.printf "intarr_pubkey %s\n" intarr_pubkey;

  if s = intarr_pubkey then 
  ()

(*compressed pub key 0x02f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c3532337877619 *)

(*uncompressed pub key 0x04f7737e45b43dce88b03a0efba377b733dc21a65559fda9f015c35323378776192753ecba14089a0325b7788fed7265568f943fe3f55f738a79224f4515d13d4c *)

(*address "0x1b64C49b4B6C195DC2475C41E3DD01Cc5bA459C9" *)

(* signed message "0x54c9e2ac1da4bbe572f4d26e84802839b089edf8e0dbccc61286be5aba9f26a4106ffefc1bd83d5ebb94b92faf47801aaf9da1f0b1f72e2c9776c8a456a832f31b" *)
(* signed tx "0x02f87481898085070218df4785070218df58825208941b64c49b4b6c195dc2475c41e3dd01cc5ba459c9872386f26fc1000080c080a0a55181db2941aac64cfc729428ff9eab753cb4cc6e8fe5ca9a2f09d63f890ab9a01e9b5ea17f6597604fca1f9dd8b4478c7baecf452d47e213e1eafe8c248479b1" *)

(* https://github.com/dakk/secp256k1-ml/blob/master/test/test.ml *)
