# Neovim 快捷键指南

本文档记录了 Neovim 的原生快捷键、自定义快捷键以及插件默认快捷键。

## 目录

- [基础编辑](#基础编辑)
- [导航与移动](#导航与移动)
- [窗口与标签页](#窗口与标签页)
- [缓冲区管理](#缓冲区管理)
- [搜索与替换](#搜索与替换)
- [文件操作](#文件操作)
- [终端操作](#终端操作)
- [LSP 相关](#lsp-相关)
- [插件特定快捷键](#插件特定快捷键)
  - [Telescope](#telescope)
  - [Neo-tree](#neo-tree)
  - [Hop.nvim](#hopnvim)
  - [ToggleTerm](#toggleterm)
  - [VSCode 扩展](#vscode-扩展)

---

## 基础编辑

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `i` | Normal | 进入插入模式 | |
| `Esc` | Insert | 退出插入模式 | |
| `dd` | Normal | 删除当前行 | |
| `yy` | Normal | 复制当前行 | |
| `p` | Normal | 粘贴 | |
| `P` | Normal | 在光标前粘贴 | |
| `u` | Normal | 撤销 | |
| `Ctrl+r` | Normal | 重做 | |
| `.` | Normal | 重复上一次操作 | |
| `x` | Normal | 删除光标下的字符 | |
| `X` | Normal | 删除光标前的字符 | |
| `J` | Normal | 合并下一行 | |

---

## 导航与移动

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `h/j/k/l` | Normal | 左/下/上/右移动 | |
| `w` | Normal | 移动到下一个单词开头 | |
| `b` | Normal | 移动到上一个单词开头 | |
| `e` | Normal | 移动到当前单词末尾 | |
| `0` | Normal | 移动到行首 | |
| `$` | Normal | 移动到行尾 | |
| `gg` | Normal | 移动到文件开头 | |
| `G` | Normal | 移动到文件末尾 | |
| `Ctrl+u` | Normal | 向上滚动半页 | |
| `Ctrl+d` | Normal | 向下滚动半页 | |
| `Ctrl+b` | Normal | 向上滚动一页 | |
| `Ctrl+f` | Normal | 向下滚动一页 | |

---

## 窗口与标签页

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `:sp` | Normal | 水平分割窗口 | |
| `:vsp` | Normal | 垂直分割窗口 | |
| `Ctrl+w+h/j/k/l` | Normal | 在窗口间移动 | |
| `Ctrl+w+c` | Normal | 关闭当前窗口 | |
| `Ctrl+w+q` | Normal | 退出当前窗口 | |
| `[t` | Normal | 切换到上一个标签页 | 自定义 |
| `]t` | Normal | 切换到下一个标签页 | 自定义 |
| `:tabnew` | Normal | 创建新标签页 | |
| `:tabclose` | Normal | 关闭当前标签页 | |

---

## 缓冲区管理

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader>v` | Normal | 关闭当前缓冲区 | 自定义 |
| `<leader>c` | Normal | 关闭当前缓冲区（带保存提示） | 自定义 |
| `<leader>fb` | Normal | 查找缓冲区 | Telescope |
| `<b` | Normal | 左移当前缓冲区 | 自定义 |
| `>b` | Normal | 右移当前缓冲区 | 自定义 |

---

## 搜索与替换

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `/` | Normal | 向前搜索 | |
| `?` | Normal | 向后搜索 | |
| `n` | Normal | 跳转到下一个搜索结果 | |
| `N` | Normal | 跳转到上一个搜索结果 | |
| `:%s/old/new/g` | Normal | 全局替换 | |
| `:%s/old/new/gc` | Normal | 全局替换（带确认） | |
| `<leader>fw` | Normal | 实时搜索文本 | Telescope |
| `<leader>fW` | Normal | 实时搜索文本（包括隐藏文件） | Telescope |
| `<leader>fC` | Normal | 搜索光标下的单词 | Telescope |
| `<leader>h` | Normal | 取消高亮 | 自定义 |

---

## 文件操作

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader>w` | Normal | 保存当前文件 | 自定义 |
| `<leader>ff` | Normal | 查找文件 | Telescope |
| `<leader>fF` | Normal | 查找所有文件（包括隐藏文件） | Telescope |
| `<leader>fe` | Normal | 打开文件浏览器（根目录） | Neo-tree |
| `<leader>fE` | Normal | 打开文件浏览器（当前目录） | Neo-tree |
| `<leader>e` | Normal | 打开文件浏览器（根目录） | Neo-tree |
| `<leader>E` | Normal | 打开文件浏览器（当前目录） | Neo-tree |
| `:CpRelativePath` | Normal | 复制相对路径 | 自定义命令 |
| `:CpFileName` | Normal | 复制文件名 | 自定义命令 |
| `:CpAbsolutePath` | Normal | 复制绝对路径 | 自定义命令 |

---

## 终端操作

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<F7>` | Normal | 切换终端 | ToggleTerm |
| `<leader>th` | Normal | 水平分割终端 | 自定义 |
| `<leader>tv` | Normal | 垂直分割终端 | 自定义 |
| `<leader>tf` | Normal | 浮动终端 | 自定义 |
| `<leader>tt` | Normal | 标签页终端 | 自定义 |
| `<C-S-l>` | Terminal | 清屏 | 自定义 |
| `<leader>py` | Normal | 运行 Python 文件 | 自定义 |
| `<leader>rc` | Normal | 运行 CMake 脚本 | 自定义 |
| `<leader>ru` | Normal | 运行 Rust 项目 | 自定义 |

---

## LSP 相关

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader>la` | Normal, Visual | 代码操作 | 自定义 |
| `<leader>lA` | Normal | 源代码操作 | 自定义 |
| `<leader>ld` | Normal | 显示行诊断信息 | 自定义 |
| `<leader>lf` | Normal, Visual | 格式化 | 自定义 |
| `<leader>lF` | Normal, Visual | 格式化注入的语言 | 自定义 |
| `<leader>ll` | Normal | 显示 LSP 信息 | 自定义 |
| `<leader>lm` | Normal | 打开 Mason 插件管理器 | 自定义 |
| `<leader>lr` | Normal | 重命名 | 自定义 |
| `gd` | Normal | 跳转到定义 | |
| `gD` | Normal | 跳转到声明 | |
| `gr` | Normal | 查找引用 | |
| `gi` | Normal | 跳转到实现 | |
| `K` | Normal | 显示悬停信息 | |

---

## 插件特定快捷键

### Telescope

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader>ff` | Normal | 查找文件 | |
| `<leader>fF` | Normal | 查找所有文件（包括隐藏文件） | |
| `<leader>fw` | Normal | 实时搜索文本 | |
| `<leader>fW` | Normal | 实时搜索文本（包括隐藏文件） | |
| `<leader>fc` | Normal | 查找命令 | |
| `<leader>fC` | Normal | 搜索光标下的单词 | |
| `<leader>fb` | Normal | 查找缓冲区 | |
| `<leader>fs` | Normal | 搜索历史会话 | |

### Neo-tree

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader>fe` | Normal | 打开文件浏览器（根目录） | |
| `<leader>fE` | Normal | 打开文件浏览器（当前目录） | |
| `<leader>e` | Normal | 打开文件浏览器（根目录） | |
| `<leader>E` | Normal | 打开文件浏览器（当前目录） | |
| `<leader>ge` | Normal | 打开 Git 浏览器 | |
| `<leader>be` | Normal | 打开缓冲区浏览器 | |

### Hop.nvim

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader><leader>w` | Normal, Visual | 跳转到光标后的任一单词开头 | |
| `<leader><leader>e` | Normal, Visual | 跳转到光标后的任一单词末尾 | |
| `<leader><leader>b` | Normal, Visual | 跳转到光标前的任一单词开头 | |
| `<leader><leader>v` | Normal, Visual | 跳转到光标前的任一单词末尾 | |
| `<leader><leader>l` | Normal, Visual | 跳转到光标后的驼峰命名单词开头 | |
| `<leader><leader>h` | Normal, Visual | 跳转到光标前的驼峰命名单词开头 | |
| `<leader><leader>a` | Normal, Visual | 跳转到屏幕上的任一字符 | |
| `<leader><leader>j` | Normal, Visual | 跳转到光标下的任一行 | |
| `<leader><leader>k` | Normal, Visual | 跳转到光标上的任一行 | |

### ToggleTerm

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<F7>` | Normal | 切换终端 | |
| `<leader>th` | Normal | 水平分割终端 | |
| `<leader>tv` | Normal | 垂直分割终端 | |
| `<leader>tf` | Normal | 浮动终端 | |
| `<leader>tt` | Normal | 标签页终端 | |
| `<C-S-l>` | Terminal | 清屏 | |

### VSCode 扩展

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader><leader>q` | Normal | 退出 VSCode | |
| `<leader>qq` | Normal | 退出 VSCode | |
| `<leader>c` | Normal | 关闭当前标签页 | |
| `<leader>e` | Normal | 切换侧边栏可见性 | |
| `<leader>E` | Normal | 在资源管理器中显示当前活动文件 | |
| `<leader>a` | Normal | 切换活动栏可见性 | |
| `<leader>js` | Normal | 使用 node 运行 JS/TS 代码 | |
| `<leader>py` | Normal | 运行 Python 脚本 | |
| `<leader>dd` | Normal | 将文件转换为 Windows 格式 | |
| `<leader>du` | Normal | 将文件转换为 Unix 格式 | |

---

## 其他自定义快捷键

| 快捷键 | 模式 | 功能 | 备注 |
|--------|------|------|------|
| `<leader><leader>t` | Normal | 切换光标颜色 | |
| `<F11>` | Normal | 切换全屏（仅限 Neovide） | |
| `p` | Visual | 粘贴（解决选中粘贴只能粘贴一次的问题） | |
