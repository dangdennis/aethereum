# Aethereum

An OCaml SDK for developing against the Ethereum blockchain.

# Development

1. `opam install . --deps-only` to download all required deps from opam.
2. If cohttp-eio is not available, as is the case when this was written, run `opam pin add https://github.com/mirage/ocaml-cohttp.git --with-version 6.0.0~alpha0` to pin the dev branch for use.
3. Install geth
    ```
    brew tap ethereum/ethereum
    brew install ethereum
    ```
4. `geth --dev --http --http.api eth,web3,personal,net` for `localhost:8545`