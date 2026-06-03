return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/snacks.nvim",
    "ravitemer/codecompanion-history.nvim",
  },

  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
    "CodeCompanionCLI",
    "CodeCompanionCmd",
  },

  opts = {
    -- 注意：log_level / language 属于 config.opts.*，必须套在 opts 子表里。
    -- 写在根层级会被静默忽略（根层级只认 adapters/interactions/mcp/display/extensions/opts）。
    opts = {
      log_level = "INFO",

      -- LLM 非代码文本回复使用的语言（会写进默认 system prompt：
      -- "All non-code text responses must be written in the <language> language."）
      -- 默认是 "English"，所以发中文也会用英/日/韩回应，这里改成中文修正。
      language = "中文",
    },

    -- codecompanion-history.nvim：自动保存 / 恢复历史对话，误关 chat 可找回
    extensions = {
      history = {
        enabled = true,
        opts = {
          auto_save = true,
          expiration_days = 30,
          continue_last_chat = false,
          auto_generate_title = false,
          delete_on_clearing_chat = false,
          picker = "snacks",
          keymap = "gh", -- chat buffer 内：打开历史列表
          save_chat_keymap = "sc", -- chat buffer 内：手动保存
        },
      },
    },
    adapters = {
      acp = {
        opts = {
          show_presets = false,
        },

        -- 内置的 claude_code ACP adapter 已经会读取 CLAUDE_CODE_OAUTH_TOKEN
        -- 并在缺失时报错、存在时写入 vim.env，所以这里不需要覆写 auth。
        -- 只在确实要改 command / 参数时才 extend。
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {})
        end,
      },

      -- 注意：inline / cmd / background 这三类交互只支持 HTTP adapter
      -- （源码会对非 HTTP adapter 报 "Only HTTP adapters are supported"）。
      -- 当前只用 ACP 的 claude_code，所以没有配 http adapters。
      -- 等以后申请了 API key，再在这里加 http = { anthropic = ... } 即可。
    },
    interactions = {
      chat = {
        adapter = "claude_code",

        -- 这里可继续加聊天层面的 UI/行为定制
        -- 比如自动滚动、欢迎文案等；具体字段请按你版本文档微调
        -- slash_commands = { ... },
      },
      cli = {
        agent = "claude_code",

        agents = {
          claude_code = {
            cmd = "claude",
            args = {},
            description = "Claude Code CLI",
            provider = "terminal",
          },

          -- 可选：如果你以后装了别的 CLI agent，也可以并列加
          -- codex = {
          --   cmd = "codex",
          --   args = {},
          --   description = "OpenAI Codex CLI",
          --   provider = "terminal",
          -- },
        },

        keymaps = {
          next_chat = {
            modes = { n = "}" },
            callback = "keymaps.next_chat",
            description = "Next CLI interaction",
          },
          previous_chat = {
            modes = { n = "{" },
            callback = "keymaps.previous_chat",
            description = "Previous CLI interaction",
          },
        },

        opts = {
          auto_insert = true,
          reload = true, -- Claude Code 改了磁盘文件后自动 :checktime
        },
      },
    },
    display = {
      chat = {
        show_header_separator = true,
        separator = "~",

        window = {
          layout = "vertical",
          width = 0.45,
          height = 0.85,
          border = "rounded",
          opts = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
            wrap = true,
            linebreak = true,
          },
        },

        -- diff = {
        --   enabled = true,
        --   close_chat_at = 240,
        --   layout = "vertical",
        --   opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        -- },
      },

      cli = {
        window = {
          -- CLI 默认继承 chat.window；这里只覆写差异
          layout = "vertical",
          width = 0.45,
          height = 0.85,
          opts = {
            number = false,
            relativenumber = false,
          },
        },
      },
    },

    ----------------------------------------------------------------------
    -- 可选：MCP
    -- 如果你以后自己配 MCP servers，claude_code 可继承
    ----------------------------------------------------------------------
    mcp = {
      opts = {
        -- 是否让 ACP adapter 自动接 MCP
        acp_enabled = true,
      },

      -- servers = {
      --   ["sequential-thinking"] = {
      --     type = "stdio",
      --     command = "npx",
      --     args = { "-y", "@modelcontextprotocol/server-sequential-thinking" },
      --     env = {},
      --   },
      -- },
    },

    ----------------------------------------------------------------------
    -- 可选：策略 / Prompt / Tools / Slash Commands
    -- 这些能力很强，但具体 schema 版本变动相对频繁。
    -- 如果你只是先跑通 Claude Pro + Chat/CLI，建议后续逐步加。
    ----------------------------------------------------------------------
    -- prompt_library = { ... },
    -- extensions = { ... },
    -- strategies = { ... },
  },

  keys = {
    -- Chat
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    
    -- CLI
    { "<leader>aC", "<cmd>CodeCompanionCLI<cr>", desc = "CodeCompanion CLI" },

    -- 切换最近一次 chat/cli buffer
    {
      "<leader>at",
      function()
        require("codecompanion").toggle()
      end,
      desc = "CodeCompanion Toggle",
    },
  },
}
