-- smart_gd.lua
-- TypeScript向け: 複数候補から「実装っぽい場所」を優先してジャンプする gd 代替

local M = {}

-- 候補に点数をつけて「実装」を優先
local function score_uri(uri, current_dir)
  local path = vim.uri_to_fname(uri)

  -- 低優先: 型定義や@types
  if path:match("%.d%.ts$") then return -1000 end -- foo.d.ts
  if path:match("/@types/") then return -900 end  -- node_modules/@types/...
  if path:match("index%.d%.ts$") then return -1200 end

  -- そこそこ低優先: node_modules 配下（ただし実装ファイルなら許容）
  local score = 0
  if path:match("/node_modules/") then score = score - 50 end

  -- 高優先: 実装拡張子
  if path:match("%.tsx?$") then score = score + 120 end -- .ts / .tsx
  if path:match("%.jsx?$") then score = score + 80 end  -- .js / .jsx

  -- 少し加点: カレントプロジェクト配下
  if current_dir and path:find(current_dir, 1, true) then
    score = score + 30
  end

  return score
end

-- Location | LocationLink → (uri, range) の配列に正規化
local function normalize_results(result)
  local out = {}

  local function push(loc)
    if loc.uri and loc.range then                 -- Location
      table.insert(out, { uri = loc.uri, range = loc.range })
    elseif loc.targetUri and loc.targetRange then -- LocationLink
      table.insert(out, { uri = loc.targetUri, range = loc.targetRange })
    end
  end

  if vim.tbl_islist(result) then
    for _, loc in ipairs(result) do push(loc) end
  elseif result then
    push(result)
  end

  return out
end

function M.goto_definition_smart()
  local params = vim.lsp.util.make_position_params(0, "utf-8")
  local cwd = vim.fn.getcwd()

  vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx)
    if err then
      vim.notify(("LSP error: %s"):format(err.message or err), vim.log.levels.ERROR)
      return
    end

    local locs = normalize_results(result or {})
    if #locs == 0 then
      -- 定義が無いなら実装へフォールバック
      return vim.lsp.buf.implementation()
    end

    -- スコアリングして最良にジャンプ
    table.sort(locs, function(a, b)
      return score_uri(a.uri, cwd) > score_uri(b.uri, cwd)
    end)

    -- 1位が .d.ts で、他にも候補がある場合は .d.ts を飛ばす
    if locs[1] and locs[1].uri:match("%.d%.ts$") then
      for i = 2, #locs do
        if not locs[i].uri:match("%.d%.ts$") then
          table.remove(locs, 1)
          break
        end
      end
    end

    -- ジャンプ
    vim.lsp.util.show_document(locs[1], 'utf-8', { focus = true })
    -- vim.lsp.util.jump_to_location(locs[1], "utf-8")

    -- もし「実装候補」が他にもある場合、quickfix に入れておくと見比べられて便利
    if #locs > 1 then
      local items = vim.lsp.util.locations_to_items(locs, "utf-8")
      vim.fn.setqflist({}, " ", { title = "LSP Definitions (ranked)", items = items })
      -- 必要なら自動で開く:
      -- vim.cmd.copen()
    end
  end)
end

return M
