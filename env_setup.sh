#!/usr/bin/env bash

rustup default nightly
cargo install cargo-watch
# `cargo-watch` monitors your source code to trigger commands every time a file changes.
cargo install cargo-tarpaulin
rustup component add clippy
rustup component add rustfmt
cargo install cargo-audit
cargo install cargo-expand
cargo install --version="~0.8.1" sqlx-cli --no-default-features --features rustls,postgres
cargo install cargo-deny
cargo install cargo-udeps
cargo deny check advisories
