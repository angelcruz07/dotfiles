return {
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("better-ts-errors").setup({
        keymaps = {
          toggle = "<leader>dd", -- Tecla rápida para alternar la vista de errores
          go_to_definition = "<leader>dx", -- Tecla rápida para ir a la definición de tipos en los errores
        },
      })
    end,
  },
}
