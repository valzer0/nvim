return {
  -- nvim-treesitter 本体
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",                     -- プラグインインストール後に Tree-sitter パーサーを自動更新
    event = { "BufReadPost", "BufNewFile" }, -- ファイル読み込み時または新規作成時に読み込む（起動を高速化）
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {  -- インストールする言語パーサーのリスト
          "lua",              -- Lua 言語の構文解析（Neovim 設定などに必要）
          "vim",              -- Vim script の構文解析
          "vimdoc",           -- Vim ヘルプファイル用構文解析
          "bash",             -- Bash スクリプト用
          "html",             -- HTML 構文解析
          "css",              -- CSS スタイルシート用
          "scss",             -- SCSS（Sass）構文解析
          "javascript",       -- JavaScript 言語
          "typescript",       -- TypeScript 言語
          "json",             -- JSON データ構文解析
          "tsx",              -- React JSX + TypeScript 用
          "go",               -- Go 言語
          "python",           -- Python 言語
          "markdown",         -- Markdown 用構文解析
          "cpp",              -- C++言語
        },
        sync_install = false, -- true: 同期でパーサーをインストール（遅くなる可能性あり）
        auto_install = true,  -- buffer を開いたときに必要なパーサーを自動でインストール
        ignore_install = {},  -- インストールしないパーサーを指定（例: { "php" }）
        modules = {},         -- Tree-sitter モジュールの上書き設定（通常は空でOK）

        highlight = {
          enable = true,                             -- Tree-sitter による構文ハイライトを有効化
          additional_vim_regex_highlighting = false, -- Vim の従来のハイライト方式を併用するか（false 推奨）
        },
        indent = {
          enable = true, -- Tree-sitter によるインデント処理を有効化（言語によって精度が異なる）
        },
      })
    end,
  },


  -- 現在のスコープ（関数など）をウィンドウ上部に固定表示する
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("treesitter-context").setup({
        enable = true,            -- 有効化
        max_lines = 3,            -- 表示する最大行数
        min_window_height = 0,    -- ウィンドウの高さによる制限なし
        line_numbers = true,      -- 行番号表示
        multiline_threshold = 20, -- これ以上長いと折りたたみ
        trim_scope = 'outer',     -- 外側のスコープを表示
        mode = 'cursor',          -- カーソル位置に応じて表示
        separator = nil,          -- 区切り線（nilでなし）
        zindex = 20,              -- UIの重なり順（高いほど前面）
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", -- v3 から `ibl` モジュール名に変更された
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│", -- インデントに使う文字。好みに応じて "│", ┊", "¦", "┆", "·" など
        tab_char = nil, -- タブに別の文字を使う場合はこちらに設定
        smart_indent_cap = true, -- 段落終わりのインデントを賢く判断
      },
      scope = {
        enabled = true, -- 現在のスコープをハイライト
        show_start = true,
        show_end = false,
        highlight = { "Function", "Label" }, -- 好みに合わせて変えてください
      },
      exclude = {
        filetypes = {
          "help", "alpha", "dashboard", "neo-tree", "Trouble",
          "lazy", "mason", "notify", "toggleterm", "lazyterm",
        },
        buftypes = { "terminal", "nofile", "quickfix" },
      },
      whitespace = {
        remove_blankline_trail = true, -- 末尾の空白行にラインを引かない
      },
    },
  }
}
