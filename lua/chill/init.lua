local M = {}

local defaults = {
  variant = 'dark', -- 'dark' or 'light'
  transparent = false, -- Enable transparent background
  italics = true, -- Use italics for comments and certain syntax elements
  dim_inactive = false, -- Dim inactive windows
}

local config = defaults

function M.setup(user_config)
  config = vim.tbl_deep_extend("force", defaults, user_config or {})
  return config
end

function M.load()
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  vim.g.colors_name = 'chill'
  vim.o.termguicolors = true

  local theme = require('chill.theme').generate(config)
  
  -- Apply theme highlights
  for group, color in pairs(theme) do
    if color.link then
      vim.api.nvim_set_hl(0, group, { link = color.link })
    else
      vim.api.nvim_set_hl(0, group, color)
    end
  end

  -- Apply custom autocmds if needed
  if config.dim_inactive then
    vim.api.nvim_create_augroup('ChillHighlight', { clear = true })
    vim.api.nvim_create_autocmd('WinEnter', {
      group = 'ChillHighlight',
      callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_option(win_id, 'winhighlight', '')
      end,
    })
    
    vim.api.nvim_create_autocmd('WinLeave', {
      group = 'ChillHighlight',
      callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_option(
          win_id,
          'winhighlight',
          'Normal:NormalDim,SignColumn:SignColumnDim'
        )
      end,
    })
  end
end

return M
