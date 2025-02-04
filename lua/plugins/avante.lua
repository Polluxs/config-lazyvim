return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "claude",
      auto_suggestion_provider = "openai",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    keys = {},
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          mappings = {
            ask = "<leader>jj", -- Ask: <leader>uj
            edit = "<leader>je", -- Edit: <leader>uj
            refresh = "<leader>jr", -- Refresh: <leader>ur
            --- @class AvanteConflictMappings
            diff = {
              ours = "do", -- 'd' for diff, 'o' for ours
              theirs = "dt", -- 't' for theirs
              all_theirs = "da", -- 'a' for all
              both = "db", -- 'b' for both
              cursor = "dc", -- 'c' for cursor
              next = "<D-Down>", -- Command + Down for next diff
              prev = "<D-Up>", -- Command + Up for previous diff
            },
            suggestion = {
              accept = "<D-y>", -- Cmd + Y for accepting a suggestion
              next = "<D-Right>", -- Cmd + Right for next suggestion
              prev = "<D-Left>", -- Cmd + Left for previous suggestion
              dismiss = "<D-n>", -- Cmd + N for dismissing a suggestion
            },
            jump = {
              next = "{{",
              prev = "}}",
            },
            submit = {
              normal = "<CR>",
              insert = "<CR>",
            },
            sidebar = {
              apply_all = "da", -- 'd' for sidebar (diff-like), 'a' for apply all (similar to `all_theirs` in diff)
              apply_cursor = "dc", -- 'd' for sidebar, 'c' for apply at cursor (similar to `cursor` in diff)
              switch_windows = "<Tab>", -- Consistent with sidebar switching expectations
              reverse_switch_windows = "<S-Tab>", -- Shift + Tab for reverse switching
            },
          },
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
