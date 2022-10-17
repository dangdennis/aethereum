(lang dune 3.4)

(name aethereum)

(generate_opam_files true)

(source
 (github dangdennis/aethereum))

(authors "Dennis Dang")

(maintainers "Dennis Dang")

(license MIT)

(documentation https://url/to/documentation)

(package
 (name aethereum)
 (synopsis "OCaml SDK for Ethereum development inspired by etherjs")
 (description "")
 (depends
  alcotest
  base
  dune
  ez_hash
  hex
  lwt
  ocaml
  ppx_expect
  ppx_jane
  ppx_inline_test
  secp256k1-internal)
 (tags
  (topics "to describe" your project)))

; (package
;  (name ez_hash)
;  (synopsis "Hash functions: sha3, sha256, blake2b")
;  (description "\nHash functions: sha3, sha256, blake2b\n")
;  (depends
;   (ocaml
;    (>= 4.08.0))
;   blake2
;   ppx_inline_test
;   ppx_expect
;   odoc
;   ocamlformat))

; (package
;  (name secp256k1)
;  (synopsis "Hash functions: sha3, sha256, blake2b")
;  (description "\nHash functions: sha3, sha256, blake2b\n")
;  (depends
;   (ocaml
;    (>= 4.08.0))
;   blake2
;   ppx_inline_test
;   ppx_expect
;   odoc
;   ocamlformat))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
