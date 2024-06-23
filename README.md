#### Start
```zsh
git clone git@github.com:FukeKazki/nvim-term.git ~/.config/nvim-term
NVIM_APPNAME=nvim-term nvim
```

#### Structure

```mermaid
graph TD;
  init.lua --> lazy.nvim --> plugins/init.lua
  init.lua -->  mappings.lua
  init.lua -->  autocmd.lua
```

#### Link

- https://github.com/FukeKazki/nvim-term/tree/main
