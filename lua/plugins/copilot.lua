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
