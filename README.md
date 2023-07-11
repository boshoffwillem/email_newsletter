# email_newsletter

## Tools

### Quicker Compilation Feedback

```bash
cargo install cargo-watch
```

`cargo-watch` monitors your source code to trigger commands every time a file changes.

### Code Coverage

```bash
cargo install cargo-tarpaulin
```

### Code Linting

```bash
rustup component add clippy
```

### Code Formatting

```bash
rustup component add rustfmt
```

### Code Security

```bash
cargo install cargo-audit
```

### Macro Expansion

```bash
cargo install cargo-expand
```

### Sqlx CLI

```bash
cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
```
