return {
  {
    "OlegGulevskyy/better-ts-errors.nvim", -- Plugin name and repository
    dependencies = { "MunifTanjim/nui.nvim" }, -- Dependencies required for the plugin
    config = function()
      require("better-ts-errors").setup({
        keymaps = {
          toggle = "<leader>dd", -- Quick key to toggle the error view
          go_to_definition = "<leader>dx", -- Quick key to go to the type definition in errors
        },
      })
    end,
  },
}
