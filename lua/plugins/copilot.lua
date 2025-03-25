-- return {
-- "zbirenbaum/copilot.lua",
-- cmd = "Copilot",
-- build = ":Copilot auth",
-- event = "BufReadPost",
-- opts = {
--   suggestion = {
--     enabled = not vim.g.ai_cmp,
--     auto_trigger = true,
--     hide_during_completion = vim.g.ai_cmp,
--     keymap = {
--       accept = false, -- handled by nvim-cmp / blink.cmp
--       next = "<M-]>",
--       prev = "<M-[>",
--     },
--   },
--   panel = { enabled = false },
--   filetypes = {
--     markdown = true,
--     help = true,
--   },
-- },
-- }
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true, -- Enable auto-suggestions
          keymap = {
            -- accept = "<Tab>", -- Accept suggestion with Tab
            accept = "C-m>",
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-e>",
          },
        },
      })
    end,
  },
}
