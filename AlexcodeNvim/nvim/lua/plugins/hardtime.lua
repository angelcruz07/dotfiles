return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    disable_mouse = true,
    disabled_keys = {
      ["<Up>"] = false,
      ["<Down>"] = false,
    },
  },
}
