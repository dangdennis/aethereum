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
  ocaml
  ppx_expect
  ppx_jane
  ppx_inline_test
  secp256k1-internal)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
