# gh-check.tape — the pass-through story in ~10 seconds: the whole nika
# CLI behind gh, zero separate install step. Every command is real (the
# extension resolves the released binary); the demo dir is staged by
# scripts/media/render.sh with the engine's green fixture. House theme =
# the engine's nika-hero palette.
Output gh-check.gif

Set Shell zsh
Set FontFamily "JetBrains Mono"
Set FontSize 21
Set Width 1420
Set Height 780
Set Padding 24
Set Margin 22
Set MarginFill "#4f86ff"
Set BorderRadius 14
Set WindowBar Colorful
Set WindowBarSize 42
Set Theme { "name": "nika", "background": "#08090b", "foreground": "#dbe3ee", "cursor": "#4f86ff", "black": "#10131a", "red": "#ff6b6b", "green": "#34d399", "yellow": "#f0b45b", "blue": "#4f86ff", "magenta": "#b07bff", "cyan": "#22d3ee", "white": "#dbe3ee", "brightBlack": "#5b6472", "brightRed": "#ff8f8f", "brightGreen": "#5ee6b0", "brightYellow": "#ffd08a", "brightBlue": "#8db4ff", "brightMagenta": "#c9a2ff", "brightCyan": "#67e3f5", "brightWhite": "#ffffff" }
Set TypingSpeed 30ms
Set PlaybackSpeed 1.0

Hide
Type "cd /tmp/ghdemo && export TMPDIR=/tmp && unset -m '*API_KEY*' '*_TOKEN*' '*SECRET*' 2>/dev/null; setopt interactive_comments && clear"
Enter
Show

Type "# the whole nika CLI behind gh · Actions runners · Codespaces · locked-down laptops"
Enter
Sleep 700ms
Type "gh extension install supernovae-st/gh-nika"
Enter
Sleep 2200ms

Type "# audit BEFORE a token is spent · the extension resolves the released binary"
Enter
Sleep 700ms
Type "gh nika check meeting-actions.nika.yaml"
Enter
Sleep 5200ms
Sleep 1400ms
