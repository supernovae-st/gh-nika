# first-call.tape — gh nika from nothing, in ~40 seconds: install the
# extension, make a first call that fetches the latest engine release and
# checks it against the release's SHA256SUMS, then write and audit a first
# workflow through gh. Every command is real; scripts/media/render.sh stages
# a sandbox for gh's data directory and the project folder, and writes the
# shell.zsh sourced below. House theme = the engine's nika-hero palette.
Output first-call.gif

Set Shell zsh
Set FontFamily "JetBrains Mono"
Set FontSize 21
Set Width 1420
Set Height 940
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
Type ". /tmp/nika-gh-demo/shell.zsh && clear"
Enter
Show

Type "# the GitHub CLI you already have · no nika on the PATH yet"
Enter
Sleep 600ms
Type "gh extension install supernovae-st/gh-nika"
Enter
Wait@60s
Sleep 1200ms
Type "gh nika --version"
Enter
Wait@120s
Sleep 4500ms

Type "clear"
Enter
Type "# every nika command, behind gh · write a first workflow, audit it"
Enter
Sleep 600ms
Type "gh nika compile hello hello.nika"
Enter
Wait@30s
Sleep 1500ms
Type "gh nika check hello.nika"
Enter
Wait@30s
Sleep 6000ms
