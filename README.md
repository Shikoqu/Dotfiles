```
    __         __    ___ __ __               TM        ╱|、_
.--|  |.-----.|  |_.'  _|__|  |.-----.-----.          (` - /
|  _  ||  _  ||   _|   _|  |  ||  -__|__ --|          |、⁻ 〵   ,
|_____||_____||____|__| |__|__||_____|_____|          じし _,)ノ
```


# Dotfiles

A place where most developers spend too much time to save a few minutes in the future...

<!-- TODO -->
TOOLS TO USE:
- [antidote](https://github.com/getantidote/antidote) - cli plugin manager
- dotfiles manager:
  - [ansible](https://www.ansible.com/) - preferred option (rest is just for dotfiles and learning it wouldn't profit anywhere else)
  - [yadm](https://yadm.io/)
  - [dotbot](https://github.com/anishathalye/dotbot)
- brew - packet manager
- aerospace - tiling window manager
- [ghostty](https://ghostty.org/) - terminal
- ...

TO REMEMBER:
- use `.config/` directory - to reduce number of single files in home directory
- use already built tools (do not attempt to create your own config manager - it already exists somewhere and is undoubtedly better than what you would came up with!)
- configure your machine first then try to optimize it for dotfiles - it should be only a tool not the goal in itself
- make it as obvious as possible
- use `.zshrc`, `.zshenv`, `.zprofile` and `.zlogin` - [read more](https://mac.install.guide/terminal/zshrc-zprofile)

USEFUL LINKS:
- [ansible tutorial](https://phelipetls.github.io/posts/introduction-to-ansible/)
- [antidote](https://getantidote.github.io)

NICE TOOLS:
- xdg-ninja (already brew installed)

NOTES:
- eza is not zsh-plugin - it's brew installed
- same goes for fzf
- project uses gnu stow, just cd to project root and type `stow dotfiles`
