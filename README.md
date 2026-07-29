# gh-nika

> Nika · intent-as-code for AI workflows: author a reviewable DAG in YAML,
> audit cost/permits **before** running, keep tamper-evident traces after.

A [GitHub CLI](https://cli.github.com) extension for the
[Nika workflow engine](https://github.com/supernovae-st/nika): the whole
`nika` CLI behind `gh`, with zero separate install step.

```sh
gh extension install supernovae-st/gh-nika

gh nika check flow.nika.yaml   # static audit · DAG, cost floor, secret flows, permits
gh nika run   flow.nika.yaml   # execute · budget-cappable · hash-chained trace
gh nika trace verify .nika/traces/*.ndjson
```

## How it resolves the binary

1. A `nika` already on your `PATH` wins · the extension is a pass-through.
2. Otherwise it downloads the **latest release binary once** (macOS/Linux ·
   x64/arm64), verifies it against the release `SHA256SUMS`, caches it under
   `${XDG_DATA_HOME:-~/.local/share}/gh-nika/`, and runs it from there.
   `GH_NIKA_DIR` overrides the cache location.

Handy where `gh` is already the tooling spine · Actions runners, Codespaces,
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

<!-- city:map -->
## The city · where this repo sits

```
📜 nika-spec ──── the civil code · the law tables, the corpus, the exam
    │ sync-pack: byte-gated mirror        │ projectors: drift-gated
    ▼                                     ▼
⚙️ nika ───────── the engine + the catalog (the yellow pages)
    │ the release train                  🖥️ nika.sh · 📖 nika-docs
    ▼                                     the showroom · the manual
📦 homebrew-tap · npm · Docker ── the docks
🔌 nika-client · 🎨 nika-vscode · 🤖 nika-agents · ⚡ gh-nika ── the doors   ◀── you are here
🏭 nika-action · 🧪 nika-actions-starter ── the CI district
🏪 nika-registry ── the market · 🏛 nika-estate ── the land registry
```

**This building** · THE GH DOOR · `gh nika check` and `gh nika run` from any terminal that already has the GitHub CLI.

**Root** · neither · this building is a shim. It finds the ENGINE or fetches it, then gets out of the way · nothing authoritative is typed here.

**Consumes** · `nika` on PATH when present · otherwise the latest release asset, verified against the release SHA256SUMS before it is ever executed.

**Serves** · every `gh` user · CI runners that already carry the GitHub CLI.

**Truth lives** · the binary answers, this script only routes · an asset missing from SHA256SUMS makes the install refuse rather than guess.

All the buildings: [nika-spec](https://github.com/supernovae-st/nika-spec) · [nika](https://github.com/supernovae-st/nika) · [nika.sh](https://github.com/supernovae-st/nika.sh) · [nika-docs](https://github.com/supernovae-st/nika-docs) · [nika-client](https://github.com/supernovae-st/nika-client) · [nika-vscode](https://github.com/supernovae-st/nika-vscode) · [nika-agents](https://github.com/supernovae-st/nika-agents) · [gh-nika](https://github.com/supernovae-st/gh-nika) · [homebrew-tap](https://github.com/supernovae-st/homebrew-tap) · [nika-action](https://github.com/supernovae-st/nika-action) · [nika-actions-starter](https://github.com/supernovae-st/nika-actions-starter) · [nika-registry](https://github.com/supernovae-st/nika-registry) · [nika-estate](https://github.com/supernovae-st/nika-estate)

Every fact has one home · everything else is a gated projection.
The living map: [nika.sh/map](https://nika.sh/map).
<!-- /city:map -->
