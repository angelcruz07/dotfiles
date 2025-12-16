-- This file contains the configuration for disabling specific Neovim plugins.

return {
  {
    -- Plugin: bufferline.nvim
    -- URL: https://github.com/akinsho/bufferline.nvim
    -- Description: A snazzy buffer line (with tabpage integration) for Neovim.
    "akinsho/bufferline.nvim",
    enabled = false, -- Disable this plugin
  },
  -- {
  --   -- Plugin para mejorar la experiencia de edición en Neovim
  --   -- URL: https://github.com/yetone/avante.nvim
  --   -- Description: Este plugin ofrece una serie de mejoras y herramientas para optimizar la edición de texto en Neovim.
  --   "yetone/avante.nvim",
  --   enabled = false,
  -- },

  -- Java languague tools
  {
    "nvim-java/nvim-java",
    enabled = false,
  },

  -- IA pligins
  {
    -- Plugin para mejorar la experiencia de edición en Neovim
    -- URL: https://github.com/yetone/avante.nvim
    -- Description: Este plugin ofrece una serie de mejoras y herramientas para optimizar la edición de texto en Neovim.
    "yetone/avante.nvim",
    enabled = false,
  },

  -- Copilot avoid conflicts with avante
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
  },
}
