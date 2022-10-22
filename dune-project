(lang dune 3.4)

(name aethereum)

(using mdx 0.3)

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
  cohttp
  cohttp-eio
  eio_main
  dune
  ez_hash
  jsonaf
  hex
  ocaml
  ppx_expect
  ppx_inline_test
  ppx_jane
  ppx_jsonaf_conv
  secp256k1-internal)
 (tags
  (topics "to describe" your project)))
