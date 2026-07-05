local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.undolevels = 5000
opt.updatetime = 200
opt.timeoutlen = 300
opt.confirm = true
opt.inccommand = "split"
opt.jumpoptions = "stack"
opt.matchpairs:append("<:>")


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
opt.infercase = true

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
