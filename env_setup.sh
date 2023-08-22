#!/usr/bin/env bash

cargo install cargo-watch
`cargo-watch` monitors your source code to trigger commands every time a file changes.
cargo install cargo-tarpaulin
rustup component add clippy
rustup component add rustfmt
cargo install cargo-audit
cargo install cargo-expand
cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
cargo install cargo-deny
cargo deny check advisories
