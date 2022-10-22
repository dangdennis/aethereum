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

(package
 (name cohttp)
 (synopsis "An OCaml library for HTTP clients and servers")
 (description
  "Cohttp is an OCaml library for creating HTTP daemons. It has a portable\nHTTP parser, and implementations using various asynchronous programming\nlibraries.\n\nSee the cohttp-async, cohttp-lwt, cohttp-lwt-unix, cohttp-lwt-jsoo and\ncohttp-mirage libraries for concrete implementations for particular\ntargets.\n\nYou can implement other targets using the parser very easily. Look at the `IO`\nsignature in `lib/s.mli` and implement that in the desired backend.\n\nYou can activate some runtime debugging by setting `COHTTP_DEBUG` to any\nvalue, and all requests and responses will be written to stderr.  Further\ndebugging of the connection layer can be obtained by setting `CONDUIT_DEBUG`\nto any value.\n")
 (depends
  (http
   (= :version))
  (ocaml
   (>= 4.08))
  (re
   (>= 1.9.0))
  (uri
   (>= 2.0.0))
  uri-sexp
  sexplib0
  (ppx_sexp_conv
   (>= v0.13.0))
  stringext
  (base64
   (>= 3.1.0))
  (fmt :with-test)
  (alcotest :with-test)))

(package
 (name cohttp-eio)
 (synopsis "CoHTTP implementation with eio backend")
 (description
  "A CoHTTP server and client implementation based on `eio` library. `cohttp-eio`features a multicore capable HTTP 1.1 server. The library promotes and is built with direct style of coding as opposed to a monadic.")
 (depends
  base-domains
  (eio
   (>= 0.6))
  (eio_main :with-test)
  (mdx :with-test)
  (uri :with-test)
  fmt
  (http
   (= :version))))

(package
 (name http)
 (synopsis "Type definitions of HTTP essentials")
 (description
  "This package contains essential type definitions used in Cohttp. It is designed\nto have no dependencies and make it easy for other packages to easily\ninteroperate with Cohttp.")
 (depends
  (ocaml
   (>= 4.08))
  (ppx_expect :with-test)
  (alcotest :with-test)
  (base_quickcheck :with-test)
  (ppx_assert :with-test)
  (ppx_sexp_conv :with-test)
  (ppx_compare :with-test)
  (ppx_here :with-test)
  (core
   (and
    :with-test
    (>= v0.13.0)))
  (core_bench :with-test)
  (crowbar
   (and
    :with-test
    (>= 0.2)))
  (sexplib0 :with-test)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
