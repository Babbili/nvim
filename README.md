# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## requirements

- Neovim >= 0.11.2 https://github.com/neovim/neovim
- Nerd Font installed https://www.nerdfonts.com/font-downloads 

install Nerd Font with the script

```bash
#!/usr/bin/env bash

fontLinks="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/3270.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Agave.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/AdwaitaMono.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/D2Coding.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Mononoki.zip
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip"

for fontLink in $fontLinks; do
	wget -P ~/.local/share/fonts $fontLink \
	&& cd ~/.local/share/fonts \
	&& unzip $(basename $fontLink) \
	&& rm $(basename $fontLink) \
	&& fc-cache -fv
done


```
