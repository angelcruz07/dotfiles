return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,

  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },

  opts = {
    workspaces = {
      {
        name = "Notes", -- Name of the workspace
        path = os.getenv("HOME") .. "/Notes", -- Path to the notes directory
      },
    },

    completition = {
      blink = true,
    },

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },

    callbacks = {
      enter_note = function(_, note)
        -- Seguir links (gf)
        vim.keymap.set("n", "gf", function()
          return require("obsidian").util.gf_passthrough()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

        -- Toggle checkbox
        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, { buffer = note.bufnr, desc = "Toggle checkbox" })

        -- Navegar links con Tab y Shift-Tab
        vim.keymap.set("n", "<Tab>", function()
          require("obsidian.api").nav_link("next")
        end, { buffer = note.bufnr, desc = "Go to next link" })

        vim.keymap.set("n", "<S-Tab>", function()
          require("obsidian.api").nav_link("prev")
        end, { buffer = note.bufnr, desc = "Go to previous link" })

        -- 🔹 Nota: eliminé el mapping de <CR> para smart_action
      end,
    },

    -- Settings for templates
    templates = {
      subdir = "templates", -- Subdirectory for templates
      date_format = "%Y-%m-%d-%a", -- Date format for templates
      gtime_format = "%H:%M", -- Time format for templates
      tags = "", -- Default tags for templates
    },
  },
}
