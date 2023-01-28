-- -- rosepine setup
-- -- local colorscheme = "rose-pine"
-- -- local status_ok, rose = pcall(require, "rose-pine")
-- -- if not status_ok then
-- -- 	return
-- -- end
-- -- rose.setup({
-- -- 	dark_variant = 'moon',
-- --   disable_background = true,
-- -- })
--
-- -- nightfox setup
-- -- local colorscheme = "duskfox"
-- -- local status_ok, fox = pcall(require, "nightfox")
-- -- if not status_ok then
-- -- 	return
-- -- end
-- -- fox.setup({
-- -- 	options = {
-- -- 		transparent = true,
-- -- 	},
-- -- })
--
-- -- tokyonight setup
local colorscheme = "tokyonight-moon"
local status_ok, tokyo = pcall(require, "tokyonight")
if not status_ok then
	return
end
tokyo.setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

local comm_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not comm_ok then
	return
end
