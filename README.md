# gh-nika

> Nika — intent-as-code for AI workflows: author a reviewable DAG in YAML,
> audit cost/permits **before** running, keep tamper-evident traces after.

A [GitHub CLI](https://cli.github.com) extension for the
[Nika workflow engine](https://github.com/supernovae-st/nika): the whole
`nika` CLI behind `gh`, with zero separate install step.

```sh
gh extension install supernovae-st/gh-nika

gh nika check flow.nika.yaml   # static audit — DAG, cost floor, secret flows, permits
gh nika run   flow.nika.yaml   # execute · budget-cappable · hash-chained trace
gh nika trace verify .nika/traces/*.ndjson
```

## How it resolves the binary

1. A `nika` already on your `PATH` wins — the extension is a pass-through.
2. Otherwise it downloads the **latest release binary once** (macOS/Linux ·
   x64/arm64), verifies it against the release `SHA256SUMS`, caches it under
   `${XDG_DATA_HOME:-~/.local/share}/gh-nika/`, and runs it from there.
   `GH_NIKA_DIR` overrides the cache location.

Handy where `gh` is already the tooling spine — Actions runners, Codespaces,
locked-down laptops:

```yaml
- run: |
    gh extension install supernovae-st/gh-nika
    gh nika check flows/report.nika.yaml
  env:
    GH_TOKEN: ${{ github.token }}
```

(For PR comments with the check verdict + DAG, the purpose-built
[nika-action](https://github.com/supernovae-st/nika-action) is the richer lane.)

## Uninstall

```sh
gh extension remove nika
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/gh-nika"
```

## License

Apache-2.0 (this wrapper). The engine it fetches is
[AGPL-3.0-or-later](https://github.com/supernovae-st/nika/blob/main/LICENSE);
the language spec is [Apache-2.0](https://github.com/supernovae-st/nika-spec).

---
🦋 [SuperNovae Studio](https://supernovae.studio) · [nika.sh](https://nika.sh) · [docs.nika.sh](https://docs.nika.sh)
