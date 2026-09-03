# Whim Language Support for Zed

[![CI](https://github.com/carthage-software/whim-zed/actions/workflows/ci.yml/badge.svg)](https://github.com/carthage-software/whim-zed/actions/workflows/ci.yml)

Language support for [Whim] in [Zed].

The extension:

- Recognizes `.whim` files and Whim shebangs.
- Highlights keywords through [tree-sitter-whim].
- Starts the language server built into the `whim` command.
- Provides semantic highlighting, completion, snippets, formatting, folding,
  selection ranges, and occurrence highlighting through the language server.

## Requirements

[Install Whim], then make sure `whim` is on the `PATH` inherited by Zed. The
extension does not download or bundle Whim.

## Semantic highlighting

Zed disables language-server semantic tokens by default. Add this to your Zed
settings for full Whim highlighting:

```json
{
  "languages": {
    "Whim": {
      "semantic_tokens": "full"
    }
  }
}
```

Without this setting, the Tree-sitter grammar still highlights Whim keywords.

## Development

Install Rust and the `wasm32-wasip2` target, then run:

```sh
cargo fmt --all --check
cargo clippy --locked --all-targets -- -D warnings
cargo test --locked
cargo build --locked --release --target wasm32-wasip2
```

To test the extension in Zed, open the Extensions page, choose
`Install Dev Extension`, and select this repository.

## License

Whim for Zed is available under the MIT License.

[Install Whim]: https://whim.carthage.software/usage/installation.html
[tree-sitter-whim]: https://github.com/carthage-software/tree-sitter-whim
[Whim]: https://github.com/carthage-software/whim
[Zed]: https://zed.dev/
