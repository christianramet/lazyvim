-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Zettelkasten keybinds
local zet_path = "~/Nextcloud/zet"

vim.keymap.set("n", "<leader>zf", LazyVim.pick("files", { cwd = zet_path }), { desc = "Find Zettel" })
vim.keymap.set("n", "<leader>z/", LazyVim.pick("live_grep", { cwd = zet_path }), { desc = "Grep Zettel" })
vim.keymap.set("n", "<leader>zn", function()
  vim.ui.input({ prompt = "Zettel title: " }, function(title)
    if not title or title == "" then
      return
    end
    local slug = title:gsub(" ", "-")
    local filename = string.format("%s/%s-%s.md", zet_path, os.date("%Y%m%d%H%M"), slug)
    vim.cmd("e " .. filename)
  end)
end, { desc = "New Zettel" })
