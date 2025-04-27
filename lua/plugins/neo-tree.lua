return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = {
    open_on_setup = false,
    open_on_setup_file = false,
    event_handlers = {
      {
        event = "vim_enter",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
