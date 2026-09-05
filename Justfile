grammar_repository := `sed -n '/^\[grammars\.whim\]$/,/^\[/s/^repository = "\(.*\)"$/\1/p' extension.toml`
grammar_commit := `sed -n '/^\[grammars\.whim\]$/,/^\[/s/^commit = "\(.*\)"$/\1/p' extension.toml`

@sync-scm:
    #!/usr/bin/env bash
    set -euo pipefail

    temporary_repository="$(mktemp -d)"
    query="$(mktemp languages/whim/highlights.scm.XXXXXX)"
    trap 'rm -rf "${temporary_repository}"; rm -f "${query}"' EXIT

    git init --bare --quiet "${temporary_repository}"
    git -C "${temporary_repository}" fetch --quiet --depth=1 "{{ grammar_repository }}" "{{ grammar_commit }}"
    git -C "${temporary_repository}" show FETCH_HEAD:queries/highlights.scm > "${query}"
    mv "${query}" languages/whim/highlights.scm

    printf 'Synced highlights.scm from tree-sitter-whim at %s.\n' "{{ grammar_commit }}"
