return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer", "prettier" },
      html = { "prettier" },
      blade = { "blade-formatter" },
    },
  },
}
