# zsh-ghq-skim

Jump into ghq local repository with skim fuzzy finding.

## Usage

Key binding | Behavior
--- | ---
Ctrl-g | Search local repository with `sk --tmux` (falls back to `sk-tmux`)

## Installation
### Nix flakes

```nix:flake.nix
{
    inputs = {
        zsh-ghq-skim = {
            url = "github:Pranc1ngPegasus/zsh-ghq-skim";
            flake = false;
        };
    };
}
```

```nix:zsh.nix
{inputs, ...}: {
    programs.zsh = {
        enable = true;
        plugins = [
            {
                name = "zsh-ghq-skim";
                src = inputs.zsh-ghq-skim;
            }
        ];
    };
}
```
