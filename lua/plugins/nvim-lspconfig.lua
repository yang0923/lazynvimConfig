-- lua/plugins/nvim-lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps")
    -- disable a keymap
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cc", false }
    keys[#keys + 1] = { "<leader>cC", false }
    keys[#keys + 1] = { "<leader>cR", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>cs", false }
    keys[#keys + 1] = { "<leader>cS", false }
  end,
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", false },
        },
      },
      rust_analyzer = {
        -- Rust 特定配置
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      pyright = {
        -- Python 特定配置
        before_init = function(_, config)
          -- 优先使用 .venv 虚拟环境
          local venv_path = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
          if venv_path ~= "" then
            config.settings.python.pythonPath = venv_path .. "/bin/python"
            return
          end

          -- 如果 .venv 不存在，尝试查找 venv
          venv_path = vim.fn.finddir("venv", vim.fn.getcwd() .. ";")
          if venv_path ~= "" then
            config.settings.python.pythonPath = venv_path .. "/bin/python"
            return
          end

          -- 如果虚拟环境都不存在，使用系统 Python
          config.settings.python.pythonPath = vim.fn.exepath("python3") or vim.fn.exepath("python")
        end,
        settings = {
          pyright = {
            -- 使用虚拟环境中的 Python 解释器
            venvPath = ".",
          },
          python = {
            analysis = {
              -- 自动搜索虚拟环境
              autoSearchPaths = true,
              -- 使用虚拟环境中的类型存根
              useLibraryCodeForTypes = true,
              -- 诊断级别
              diagnosticMode = "openFilesOnly",
              -- 分析类型
              typeCheckingMode = "basic",
            },
          },
        },
      },
    },
  },
}
