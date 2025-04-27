return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
      }
    end,
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        function()
          local custom_prompt =
            "Rename the selected variable to a more meaningful name based on the context of the code."
          require("CopilotChat").ask(custom_prompt)
        end,
        desc = "Auto Rename Variable (CopilotChat)",
        mode = { "n", "v" },
      },
      -- {
      --   "<leader>ac",
      --   function()
      --     vim.ui.input({
      --       prompt = "Custom Prompt: ",
      --     }, function(input)
      --       if input ~= "" then
      --         local custom_prompt = "You are a Neovim expert. " .. input
      --         require("CopilotChat").ask(custom_prompt)
      --       end
      --     end)
      --   end,
      --   desc = "Custom Prompt (CopilotChat)",
      --   mode = { "n", "v" },
      -- },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
    -- keys = {
    --   { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot", { noremap = true, silent = true } },
    --   { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code", { noremap = true, silent = true } },
    --   { "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code", { noremap = true, silent = true } },
    --   { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues", { noremap = true, silent = true } },
    --   {
    --     "<leader>zo",
    --     ":CopilotChatOptimize<CR>",
    --     mode = "v",
    --     desc = "Optimize Code",
    --     { noremap = true, silent = true },
    --   },
    --   { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs", { noremap = true, silent = true } },
    --   { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests", { noremap = true, silent = true } },
    --   {
    --     "<leader>zm",
    --     ":CopilotChatCommit<CR>",
    --     mode = "n",
    --     desc = "Generate Commit Message",
    --     { noremap = true, silent = true },
    --   },
    -- },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
