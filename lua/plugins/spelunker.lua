return {
  -- 変数・関数などのスペルチェックをする
  {
    "kamykn/spelunker.vim", -- :contentReference[oaicite:4]{index=4}
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact"
    },
    config = function()
      vim.g.enable_spelunker_vim = 1          -- 有効化
      vim.g.spelunker_check_type = 2          -- 表示中のみ高速チェック
      vim.g.spelunker_target_min_char_len = 3 -- 3 文字以上を対象に
    end,
  },
  -- ── ノーマルモード 基本操作 ────────────────────────────────
  -- ]s          → 次のミススペルへジャンプ
  -- [s          → 前のミススペルへジャンプ
  -- z=          → カーソル下の単語に候補リストを表示
  -- 1z= / 2z=   → 1 番目 / 2 番目の候補で即置換
  -- zg / zG     → 単語を「正しい単語」として登録
  --               zg = 永続ファイルに保存 / zG = 今回のセッションのみ
  -- zw / zW     → 単語を「常に誤り」として登録
  -- zug / zuG   → 直前の zg / zG を取り消し
  -- zuw / zuW   → 直前の zw / zW を取り消し

  -- ── 挿入モード 補助操作 ────────────────────────────────────
  -- <C-X> s     → 入力中の単語にスペル候補ポップアップを表示
  -- <C-N> / <C-P> → 候補を次 / 前へ巡回

  -- ── スペルチェックの切り替え ───────────────────────────────
  -- :setlocal spell!   → 現在バッファでスペルチェック ON/OFF トグル
  -- :set nospell       → 全体で一時的に無効化（必要時再度 :set spell）
  -- Markdown 等で     <!-- vim: nospell --> を書くと自動で無効化

  -- ── kamykn/spelunker.vim 導入時の追加ショートカット ───────
  -- ZL / Zl     → バッファ全体 / 現在の単語をメニューから一括修正
  -- ZC / Zc     → 手入力でバッファ全体 / 現在の単語を置換
  -- ZF / Zf     → 候補 1 番目で即置換（「おまかせ修正」）
  -- ZN / ZP     → 次 / 前のミススペルへ高速ジャンプ（spelunker 版）
  -- Zg / ZG     → zg / zG のラッパー（同じ動作）
  -- Zw / ZW     → zw / zW のラッパー
  -- ZUG / ZUW   → zg / zw 系の取り消しラッパー
  -- ZT / Zt     → spelunker 全体 / カレントバッファを ON/OFF
  -- :SpelunkerAddAll → 未登録単語をすべて spellfile に一括追加
  -- :CtrlPSpell      → ミススペル一覧を Fuzzy 検索＆ジャンプ
}
