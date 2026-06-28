local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.undolevels = 5000
opt.updatetime = 500
opt.timeoutlen = 300
opt.confirm = true
opt.inccommand = "split"
opt.jumpoptions = "stack"
opt.history = 1000
opt.matchpairs:append("<:>")

opt.autocomplete = true
opt.autocompletedelay = 250
opt.pumheight = 10
opt.pummaxwidth = 80
opt.pumborder = "rounded"
opt.completeopt = "menuone,noselect,fuzzy,popup"
opt.infercase = true

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.laststatus = 3
opt.winminwidth = 5
opt.smoothscroll = true
opt.display = "truncate,lastline"

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftround = true

opt.splitright = true
opt.splitbelow = true
opt.virtualedit = "block"
opt.wrap = false
opt.tildeop = true
opt.diffopt = "internal,filler,closeoff,indent-heuristic,inline:word,linematch:60"
opt.wildignore:append("*/.git/*,*/build/*")
opt.wildignorecase = true

opt.list = true
opt.listchars = {
  tab = "» ",
  leadtab = "│ ",
  leadmultispace = "│ ",
  trail = "•",
  extends = "#",
  precedes = "#",
  nbsp = "⍽"
}

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "▼",
  foldclose = "▶",
  foldinner = "│",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋"
}
