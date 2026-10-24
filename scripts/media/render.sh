#!/usr/bin/env bash
# render.sh — render a gh-nika tape with the real GitHub CLI, the real
# extension and the real engine release. Same honesty contract as the
# engine's render-tape.sh: every command is real, every line of output is
# gh's, the extension's or the engine's own.
#
# The sandbox (/tmp/nika-gh-demo) holds gh's data directory (where gh
# installs extensions and gh-nika caches the engine) and an empty project
# folder, so the install and the first fetch happen for real and nothing
# lands in your own gh data. HOME stays yours: gh reads its login from your
# keyring. The PATH is short and holds no nika, so the extension takes its
# download path; NIKA_KEYCHAIN=off keeps the OS keychain out.
# Usage: bash scripts/media/render.sh [tape-name]
#   TRANSCRIPT  also write the final screen, as text, to this file
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
NAME="${1:-first-call}"
TAPE="$ROOT/scripts/media/$NAME.tape"
[ -f "$TAPE" ] || { echo "no tape at $TAPE" >&2; exit 1; }
command -v vhs >/dev/null || { echo "vhs not installed (brew install vhs)" >&2; exit 1; }
GH="$(command -v gh)" || { echo "gh not on PATH" >&2; exit 1; }
GIT="$(command -v git)" || { echo "git not on PATH" >&2; exit 1; }
"$GH" auth status >/dev/null 2>&1 || { echo "gh must be logged in (gh auth login)" >&2; exit 1; }

SANDBOX=/tmp/nika-gh-demo
rm -rf "$SANDBOX"
mkdir -p "$SANDBOX/bin" "$SANDBOX/data" "$SANDBOX/work"
ln -s "$GH" "$SANDBOX/bin/gh"
ln -s "$GIT" "$SANDBOX/bin/git"

cat > "$SANDBOX/shell.zsh" <<EOF
export XDG_DATA_HOME=$SANDBOX/data TMPDIR=/tmp NIKA_KEYCHAIN=off
export GH_NO_UPDATE_NOTIFIER=1 GH_NO_EXTENSION_UPDATE_NOTIFIER=1 GH_PROMPT_DISABLED=1
export PATH=$SANDBOX/bin:/usr/bin:/bin:/usr/sbin:/sbin
unset -m '*API_KEY*' '*SECRET*' 2>/dev/null
setopt interactive_comments
cd $SANDBOX/work
EOF

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK" "$SANDBOX"' EXIT
cp "$TAPE" "$WORK/$NAME.tape"
[ -z "${TRANSCRIPT:-}" ] || printf 'Output %s.txt\n' "$NAME" >> "$WORK/$NAME.tape"
(cd "$WORK" && vhs "$NAME.tape")
[ -z "${TRANSCRIPT:-}" ] || cp "$WORK/$NAME.txt" "$TRANSCRIPT"

mkdir -p "$ROOT/media"
OUT="$ROOT/media/$NAME.gif"
if command -v gifsicle >/dev/null; then
  gifsicle -O3 --lossy=40 "$WORK/$NAME.gif" -o "$OUT"
else
  cp "$WORK/$NAME.gif" "$OUT"
fi
SIZE_MB=$(du -m "$OUT" | cut -f1)
[ "$SIZE_MB" -le 8 ] || { echo "✖ $OUT is ${SIZE_MB}MB (budget 8MB)" >&2; exit 1; }
echo "→ $OUT (${SIZE_MB}MB · budget 8MB)"
