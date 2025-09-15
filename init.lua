-- =============================================================================
-- Neovim 初期化ファイル（init.lua など）の冒頭に置く基本設定
-- =============================================================================
-- <リーダーキー（leader key）設定>
-- <Space> をリーダーキーとして使用（例：<leader>w などのマッピング用）
vim.g.mapleader = " "
vim.g.maplocalleader = " "

_G.P = function(v)
  print(vim.inspect(v))
  return v
end

_G.N = function(v)
  vim.notify(vim.inspect(v))
  return v
end

---@param path string
---@return string
_G.Get_home_path = function(path)
  local home = vim.env.HOME
  local home_path, home_index = path:gsub("^" .. vim.pesc(home), "~")
  return home_path
end

-- <lazy.nvim のインストールチェックと読み込み>
-- lazy.nvim は Neovim 用のプラグインマネージャーです
-- プラグインを効率的に読み込むために使われます

-- データディレクトリに lazy.nvim が存在するかを確認
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- vim.uv.fs_stat は、指定パスのファイル/ディレクトリの情報を取得
-- nil を返す = 存在しない → GitHub からクローンして取得
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",     -- 履歴を省略して高速クローン
    "https://github.com/folke/lazy.nvim.git", -- リポジトリURL
    lazypath,                                 -- クローン先パス
  })
end

-- ランタイムパスに lazy.nvim を追加（最初に読み込むように）
vim.opt.rtp:prepend(lazypath)

-- <コア設定モジュールの読み込み>
-- 各種基本設定（オプション、キーマップ、自動コマンド、ハイライト）をモジュール化して読み込み
require("core.options")   -- Vimオプション設定（表示、インデント、検索など）
require("core.keymaps")   -- キーマッピング設定（ショートカット）
require("core.autocmds")  -- 自動実行コマンド（イベントフックなど）
require("core.highlight") -- ハイライト設定（色やテーマなど）




-- <lazy.nvim を使ってプラグインをセットアップ>
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- plugins フォルダ内の設定をインポート
  },
  checker = {
    enabled = true, -- プラグインの更新チェックを有効化
    -- concurrency = 1,      -- 同時にチェックするプラグイン数（デフォルトで十分）
    -- notify = false,       -- 通知を無効化（必要ならコメントアウト）
    frequency = 60 * 60 * 24, -- チェック間隔（秒）→ 1日ごと（オプション）
  },
})
