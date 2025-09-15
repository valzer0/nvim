return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        mappings = {
          '<C-u>',                   -- 半画面分 上にスクロール
          '<C-d>',                   -- 半画面分 下にスクロール
          '<C-b>',                   -- 1画面分 上にスクロール
          '<C-f>',                   -- 1画面分 下にスクロール
          '<C-y>',                   -- 1行だけ 上にスクロール（カーソルは動かさない）
          '<C-e>',                   -- 1行だけ 下にスクロール（カーソルは動かさない）
          'zt',                      -- カーソル行をウィンドウの最上部に移動
          'zz',                      -- カーソル行をウィンドウの中央に移動
          'zb',                      -- カーソル行をウィンドウの最下部に移動
        },
        hide_cursor = true,          -- スクロール中にカーソルを非表示にする
        stop_eof = true,             -- 下方向にスクロールするとき、EOF（ファイルの終端）で止める
        respect_scrolloff = false,   -- カーソルが `scrolloff` の余白に到達したらスクロールを止める（falseの場合は無視する）
        cursor_scrolls_alone = true, -- ウィンドウがこれ以上スクロールできなくてもカーソルだけはスクロールさせ続ける
        duration_multiplier = 1.0,   -- スクロールアニメーションの全体的な時間倍率
        easing = 'quadratic',        -- デフォルトのイージング関数（アニメーションの滑らかさの種類）
        pre_hook = nil,              -- スクロールアニメーションが始まる前に実行される関数
        post_hook = nil,             -- スクロールアニメーションが終わった後に実行される関数
        performance_mode = false,    -- すべてのバッファで「パフォーマンスモード」を無効にする
        ignored_events = {           -- スクロール中に無視するイベント
          'WinScrolled', 'CursorMoved'
        },
      })
    end,
  }
}

-- "quadratic"	二次関数的な動き（加速→減速）。自然な動き。
-- "cubic"	三次関数的な動き（より滑らかな加速→減速）。
-- "quartic"	四次関数的（より強めの緩急）。
-- "quintic"	五次関数的（さらに緩急が強く、ドラマチックな動き）。
-- "sinusoidal"	サイン波的な動き（自然で滑らかな始まりと終わり）。
-- "exponential"	急激な加速→急激な減速（強い緩急）。
-- "circular"	円の動きに基づく。始めと終わりがとても滑らか。
-- "linear"	緩急なし。一定の速度で動く（easingなし）。
