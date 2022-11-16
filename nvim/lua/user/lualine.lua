local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lspinfo = {function()
    -- Lsp server name .
    local msg = 'None'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  -- color = { fg = '#ffffff', gui = 'bold' },
}

local termline = {function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    if buf_ft == "toggleterm" then
      return "Terminal " ..vim.b.toggle_number
    end
    return ""
    end
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "tokyonight",
    -- component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {"branch"},
    lualine_c = { diagnostics, termline  },
    lualine_x = { diff, spaces, "encoding", filetype, lspinfo },
    lualine_y = { location },
    lualine_z = { "progress" },
    -- lualine_z = {lspinfo},
  },
}
