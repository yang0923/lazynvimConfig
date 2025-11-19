-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local Util = require("lazyvim.util")

-- 去掉 <leader><leader> 来搜索文件的映射，转移到 lazy.lua 中去去除
-- unmap("n", "<leader><space>", { desc = "Find Files (root dir)" })
-- remove the mapping of <leader>w
-- map("n", "<leader>q", "<cmd>q<cr>", { desc = "Faster \[Q\]uit" })
-- map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Faster \[W\]rite" })
unmap("n", "<leader>w", { desc = "Windows" }) -- This is optional, does not has the real effect, the effective code is located in which-key.lua file
unmap("n", "<leader>wd", { desc = "Windows" })
unmap("n", "<leader>wm", { desc = "Windows" })
-- 保存当前更改
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current change", remap = true })

unmap("n", "<leader>l", { desc = "Lazy" })

--
-- VSCode releated
--
if vim.g.vscode then
  unmap("n", "<leader>qq")
  map(
    "n",
    "<leader>qq",
    "<Cmd>lua require('vscode').call('workbench.action.closeWindow')<CR>",
    { desc = "Quit VSCode" }
  )
end

-- toggle color between 雷姆蓝 and 拉姆粉
local color_switch = 0
local function toggle_color()
  if color_switch == 1 then
    color_switch = 0
    vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")
  else
    color_switch = 1
    vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#91bef0")
  end
end
map("n", "<leader><leader>t", function()
  toggle_color()
end, { desc = "Toggle gui cursor color" })

-- for hop.nvim
-- [[ hop.nvim 快速跳转插件定制 ]]
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local positions = require("hop.hint").HintPosition
-- leader leader w: 跳转到光标后的任一单词开头
map({ "n", "v" }, "<leader><leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words" })
-- leader leader e: 跳转到光标后的任一单词末尾
map({ "n", "v" }, "<leader><leader>e", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any end of words" })
-- leader leader b: 跳转到光标前的任一单词开头
map({ "n", "v" }, "<leader><leader>b", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })
-- leader leader v: 跳转到光标前的任一单词末尾
map({ "n", "v" }, "<leader><leader>v", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any end of words" })
-- leader leader l: 跳转到光标后的驼峰命名单词开头
map({ "n", "v" }, "<leader><leader>l", function()
  hop.hint_camel_case({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words considering camel case." })
-- leader leader h: 跳转到光标前的驼峰命名单词开头
map({ "n", "v" }, "<leader><leader>h", function()
  hop.hint_camel_case({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to next any begining of words considering camel case." })

-- suppress useless warning here (禁用无用的诊断警告)
---@diagnostic disable: missing-fields
-- leader leader a: 跳转到屏幕上的任一字符
map({ "n", "v" }, "<leader><leader>a", function()
  hop.hint_anywhere({})
end, { desc = "Go to any char" })
---@diagnostic enable: missing-fields

-- leader leader j: 跳转到光标下的任一行
map({ "n", "v" }, "<leader><leader>j", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to line below" })
-- leader leader k: 跳转到光标上的任一行
map({ "n", "v" }, "<leader><leader>k", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to line above" })

-- [[ 标签页 (Tab) 切换 ]]
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" }) -- [t: 切换到下一个标签页
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous Tab" }) -- ]t: 切换到上一个标签页

-- [[ Buffer (缓冲区) 关闭 ]]
map("n", "<leader>v", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Close current buffer" })

-- [[ toggleterm 终端管理 ]]
-- toggleterm
-- -- 水平分割终端 (占 15% 宽度)
map("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
-- 浮动终端
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
-- 标签页终端
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", { desc = "ToggleTerm float" })
-- 垂直分割终端 (占 80% 宽度)
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })

-- programming language about [[ 编程语言运行快捷键 ]]
if not vim.g.vscode then
  -- 如果不在 VSCode 环境下
  -- run single python codes  运行当前 Python 文件
  map("n", "<leader>py", '<cmd>TermExec cmd="python %"<cr>', { desc = "Run python codes" })
  -- run single cmake codes 运行当前 CMake 脚本
  map("n", "<leader>rc", '<cmd>TermExec cmd="cmake -P %"<cr>', { desc = "Run cmake codes" })
  -- execute "cargo run" 运行 Rust 项目 (cargo run)
  map("n", "<leader>ru", '<cmd>TermExec cmd="cargo run"<cr>', { desc = "Run cargo codes" })
end

-- 移动 buffer
local moveBy = function(dir)
  if dir == "left" then
    dir = -1
  else
    dir = 1
  end
  local moveBy = vim.v.count
  if moveBy == 0 then
    moveBy = 1
  end
  local myBufferline = require("bufferline")
  for _ = 1, moveBy, 1 do
    myBufferline.move(dir)
  end
end

vim.keymap.set("n", "<b", function()
  moveBy("left") -- <b: 左移当前 buffer (可带数字前缀)
end, { desc = "Move current buffer to left" })
vim.keymap.set("n", ">b", function()
  moveBy("right") -- >b: 右移当前 buffer (可带数字前缀)
end, { desc = "Move current buffer to right" })

-- for persisted 搜索历史会话
map("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Search history sessions" })

-- for cancel of highlight 取消高亮 (例如搜索结果的高亮)
map("n", "<leader>h", "<cmd>noh<cr>", { desc = "Cancel highlight" })

-- lsp about
-- unmap("n", "<leader>cl") -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap({ "n", "v" }, "<leader>ca", { desc = "Code Action" }) -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cA", { desc = "Source Action" }) -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cr") -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cm") -- 这个在 mason 插件配置中进行取消映射
-- unmap({ "n", "v" }, "<leader>cF") -- 这个在 conform 插件配置中进行取消映射

unmap("n", "<leader>cd") -- 取消默认的跳转定义/声明等
unmap({ "n", "v" }, "<leader>cf") -- 取消默认的格式化

-- <leader>lA: Source Action (源代码操作，如组织导入)
map("n", "<leader>lA", function()
  vim.lsp.buf.code_action({
    context = {
      only = {
        "source", -- 限定只进行源代码类别的操作
      },
      diagnostics = {},
    },
  })
end, { desc = "Source Action" })

-- <leader>la: Code Action (普通代码操作，如快速修复)
map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

-- <leader>ld: Line Diagnostics (行诊断信息)
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- formatting:  格式化
if vim.g.vscode then
  -- VSCode 环境下调用 VSCode 的格式化命令
  map("n", "<leader>lf", "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR>", { desc = "Format" })
  map("v", "<leader>lf", "<Cmd>lua require('vscode').call('editor.action.formatSelection')<CR>", { desc = "Format" })
else
  -- Neovim 环境下调用 LazyVim 的格式化工具 (conform.nvim)
  map({ "n", "v" }, "<leader>lf", function()
    Util.format({ force = true }) -- <leader>lf: 格式化整个文件或选中区域
  end, { desc = "Format" })
end

-- <leader>lF: 格式化注入的语言 (如 Markdown 中的代码块)
map({ "n", "v" }, "<leader>lF", function()
  require("conform").format({ formatters = { "injected" } })
end, { desc = "Format Injected Langs" })

-- <leader>ll: 查看 LSP 信息
map("n", "<leader>ll", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })

-- <leader>lm: 打开 Mason 插件管理器
map("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })

-- <leader>lr: 重命名
if require("lazyvim.util").has("inc-rename.nvim") then
  map("n", "<leader>lr", function()
    -- 如果安装了 inc-rename 插件，使用其增量重命名功能
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
  end, { desc = "Rename" })
else
  -- 否则使用 LSP 的标准重命名
  map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
end

-- 解决 visual 选中粘贴替换只能粘贴一次的问题
map("x", "p", "P")

-- [[ Neovide GUI 客户端定制 ]]
if vim.g.neovide then
  -- 如果在 Neovide 环境下
  -- Ctrl + = / Ctrl + 减号 / Ctrl + 0 调整窗口缩放比例
  vim.keymap.set({ "n", "v" }, "<c-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<c-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<c-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

-- [[ 终端清屏函数 ]]
function ClearTerm(reset)
  -- notice here: 0 is invalid, so we need to use 1
  -- 注意：vim.opt_local.scrollback 0 是无效的，所以需要用 1
  vim.opt_local.scrollback = 1
  vim.api.nvim_command("startinsert") -- 切换到插入模式
  if reset == 1 then
    vim.api.nvim_feedkeys("reset", "t", false) -- 发送 'reset' 命令 (清屏并重置终端状态)
  else
    vim.api.nvim_feedkeys("clear", "t", false) -- 发送 'clear' 命令 (清屏)
  end
  -- 发送回车键执行清屏命令
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<cr>", true, false, true), "t", true)
  vim.opt_local.scrollback = 10000 -- 恢复滚屏历史大小
end

-- 映射 C-Shift-L 到清屏函数 (在终端模式下)
map("t", "<C-S-l>", function()
  ClearTerm()
end, { desc = "Clear terminal buffer" })
