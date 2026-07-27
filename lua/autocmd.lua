local autocmd = vim.api.nvim_create_autocmd

-- 保存時フォーマットは lua/plugins/init.lua の conform.nvim (format_on_save) に委譲。
-- プロジェクトごとのフォーマッタ切り替え(biome/oxfmt/prettierd)や、どれも無い場合の
-- LSPフォーマットへのフォールバックは conform 側の設定で完結する。

-- switch denols / ts_ls
autocmd("LspAttach", {
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local curr_client = vim.lsp.get_client_by_id(args.data.client_id)
    if not curr_client then return end

    if curr_client.name == "denols" then
      for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr, name = "ts_ls" }) do
        vim.lsp.stop_client(client.id, true)
      end
    elseif curr_client.name == "ts_ls" then
      if next(vim.lsp.get_clients { bufnr = bufnr, name = "denols" }) then
        vim.lsp.stop_client(curr_client.id, true)
      end
    end
  end,
})

-- nvim-treesitter (master branch) の #set-lang-from-*! ディレクティブは
-- match[capture_id] が単一の TSNode である前提で書かれているが、Neovim 0.11+
-- では常に TSNode[] が渡されるため node:range() が nil.range() 呼び出しで落ちる
-- (markdown のコードフェンス言語判定などで発生)。ここで同等の実装を
-- force = true で上書きし、先頭ノードを取り出すように修正する。
do
  local ts_query = vim.treesitter.query

  local html_script_type_languages = {
    ["importmap"] = "json",
    ["module"] = "javascript",
    ["application/ecmascript"] = "javascript",
    ["text/ecmascript"] = "javascript",
  }

  local non_filetype_match_injection_language_aliases = {
    ex = "elixir",
    pl = "perl",
    sh = "bash",
    uxn = "uxntal",
    ts = "typescript",
  }

  local function get_parser_from_markdown_info_string(injection_alias)
    local match = vim.filetype.match { filename = "a." .. injection_alias }
    return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
  end

  local function first_node(nodes)
    return type(nodes) == "table" and nodes[1] or nodes
  end

  ts_query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
    local node = first_node(match[pred[2]])
    if not node then return end
    local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
    local configured = html_script_type_languages[type_attr_value]
    if configured then
      metadata["injection.language"] = configured
    else
      local parts = vim.split(type_attr_value, "/", {})
      metadata["injection.language"] = parts[#parts]
    end
  end, { force = true })

  ts_query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
    local node = first_node(match[pred[2]])
    if not node then return end
    local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
    metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias)
  end, { force = true })
end
