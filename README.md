# Chill

A muted forest nature-inspired minimalist color scheme for Neovim.

## Features

- Soft, natural colors inspired by forest environments
- Minimalist design with reduced visual noise
- Support for various plugins and languages
- Both dark and light variants (dark is the default)

## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'ethan/chill'
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'ethan/chill',
  lazy = false,
  priority = 1000,
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'ethan/chill'
```

## Usage

```vim
" Vim Script
colorscheme chill
```

```lua
-- Lua
vim.cmd.colorscheme 'chill'
```

## Configuration

```lua
-- Default configuration
require('chill').setup({
  variant = 'dark', -- 'dark' or 'light'
  transparent = false, -- Enable transparent background
  italics = true, -- Use italics for comments and certain syntax elements
  dim_inactive = false, -- Dim inactive windows
})

-- Apply colorscheme
vim.cmd.colorscheme 'chill'
```

## Screenshots

[Coming soon]

## License

MIT
