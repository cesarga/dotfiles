# cesarga dotfiles

## Installation

## From  WSL2 Ubuntu-18.04
```bash
curl -sfL https://git.io/cesarga | bash && exec $(which zsh) -l
```

## From zero (PowerShell)
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/cesarga-powershell'))
```

## Resources
+ [XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
+ [zsh startup files](http://zsh.sourceforge.net/Intro/intro_3.html)

## TODO:
- [x] Migrate configuration to WSL2
- [x] Integrate the Nix package manager
- [x] Configure Docker WSL2 preview
- [x] Create a reproducible development environment
- [ ] Bootstrap the initial Windows 10 actions
- [ ] Integrate the bootstrap infinity framework
- [ ] Enforce DRY using helper functions
- [ ] Refactor to templates to allow multiple configurations
- [ ] Create interactive ssh configuration
- [ ] Create non-interactive ssh configuration
- [ ] Create upgrade scripts for the Ubuntu distibution
- [ ] Document the different dotfile workflows
- [ ] Create a demo Docker image to showcase the dotfiles

## Try in Docker (not implemented)
```bash
docker run -it --rm cesarga/dotfiles
```
