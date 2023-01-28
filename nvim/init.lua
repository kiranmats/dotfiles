--
--  ██ ▄█▀ ███▄ ▄███▓ ▄▄▄     ▄▄▄█████▓  ██████ 
--  ██▄█▒ ▓██▒▀█▀ ██▒▒████▄   ▓  ██▒ ▓▒▒██    ▒ 
-- ▓███▄░ ▓██    ▓██░▒██  ▀█▄ ▒ ▓██░ ▒░░ ▓██▄   
-- ▓██ █▄ ▒██    ▒██ ░██▄▄▄▄██░ ▓██▓ ░   ▒   ██▒
-- ▒██▒ █▄▒██▒   ░██▒ ▓█   ▓██▒ ▒██▒ ░ ▒██████▒▒
--
-- Neovim rc w/ basic IDE essentials. WIP :)

require("kmats.impatient")    -- lua bytecode cache for fast plugins loading 
require("kmats.options")      -- opts configuration for optimal vim sets
require("kmats.keymaps")      -- keymaps configuration 
require("kmats.plugins")      -- packer configuration 
require("kmats.autocommands") -- autocmd configuration 


-- plugins setup config in dir "after/plugin" (auto sourced)
-- after
-- └─ plugin
--    └─ initial  (dep sourced first)
--    └─ other


-- TODO: 
-- 1. Replace plugins manager, packer -> lazy.nvim
-- 2. Customize DAP UI for better debugging
-- 3. Integrate tmux actions in neovim
