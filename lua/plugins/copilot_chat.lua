return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- suggestion = { enabled = true }, -- Enable suggestions
      -- panel = { enabled = true }, -- Enable panel
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot", { noremap = true, silent = true } },
      { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code", { noremap = true, silent = true } },
      { "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code", { noremap = true, silent = true } },
      { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues", { noremap = true, silent = true } },
      {
        "<leader>zo",
        ":CopilotChatOptimize<CR>",
        mode = "v",
        desc = "Optimize Code",
        { noremap = true, silent = true },
      },
      { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs", { noremap = true, silent = true } },
      { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests", { noremap = true, silent = true } },
      {
        "<leader>zm",
        ":CopilotChatCommit<CR>",
        mode = "n",
        desc = "Generate Commit Message",
        { noremap = true, silent = true },
      },
      {
        "<leader>zs",
        ":CopilotChatCommit<CR>",
        mode = "v",
        desc = "Generate Commit Message",
        { noremap = true, silent = true },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
