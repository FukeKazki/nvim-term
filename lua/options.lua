vim.opt.title = true
vim.opt.swapfile = false
-- 行番号を表示
vim.opt.number = true
-- 相対行を表示
vim.opt.relativenumber = true
-- system の clipboard を使う
vim.opt.clipboard = "unnamedplus"
-- ステータスラインを一番下に固定
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
-- fold
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true

-- tabの表示名を "親ディレクトリ名/ファイル名" にする
function _G.nvim_term_tabline()
  local s = ""
  for i = 1, vim.fn.tabpagenr "$" do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local bufname = vim.fn.bufname(bufnr)

    local name
    if bufname == "" then
      name = "[No Name]"
    else
      local tail = vim.fn.fnamemodify(bufname, ":t")
      local parent = vim.fn.fnamemodify(bufname, ":h:t")
      name = (parent ~= "" and parent ~= ".") and (parent .. "/" .. tail) or tail
    end

    s = s .. "%" .. i .. "T"
    s = s .. (i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#")
    s = s .. " " .. i .. ": " .. name .. " "
  end
  s = s .. "%#TabLineFill#"
  return s
end

vim.opt.tabline = "%!v:lua.nvim_term_tabline()"
vim.opt.showtabline = 2
