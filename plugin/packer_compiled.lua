-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/victor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/victor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/victor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/victor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/victor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/victor/.local/share/nvim/site/pack/packer/opt/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2�'\0\3\0002\0\a�6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0�L\0\2\0L\0\2\0\1�\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2�'\0\3\0002\0\a�6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0�L\0\2\0L\0\2\0\1�\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim�\2\1\1\b\0\20\0#6\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\4\0006\5\5\0'\a\6\0B\5\2\0029\5\a\0055\6\b\0=\0\t\6B\1\5\0016\1\n\0009\1\v\0019\1\6\0016\2\0\0009\2\1\0029\2\2\0025\4\f\0'\5\r\0003\6\14\0005\a\15\0=\0\t\aB\2\5\0016\2\0\0009\2\1\0029\2\2\0025\4\16\0'\5\17\0003\6\18\0005\a\19\0=\0\t\aB\2\5\0012\0\0�K\0\1\0\1\0\2\tdesc\26Jump to previous hunk\texpr\2\0\a[c\1\3\0\0\6n\6v\1\0\2\tdesc\22Jump to next hunk\texpr\2\0\a]c\1\3\0\0\6n\6v\vloaded\fpackage\vbuffer\1\0\1\tdesc\21Preview git hunk\17preview_hunk\rgitsigns\frequire\15<leader>hp\6n\bset\vkeymap\bvim�\2\1\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0023\3\18\0=\3\19\2B\0\2\1K\0\1\0\14on_attach\0\nsigns\1\0\0\14untracked\1\0\1\ttext\b┆\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\b‾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\b│\badd\1\0\0\1\0\1\ttext\b│\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["local-highlight.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/local-highlight.nvim",
    url = "https://github.com/tzachar/local-highlight.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rwinwidth\afn\bvim�\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\v�\21\2\1\0)\3\0\0\1\3\2\0X\2\4�\21\2\1\0\21\3\0\0\0\2\3\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b�\3\0\0\4\1\"\0E5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\16\1=\1\17\0-\1\0\0009\1\18\1=\1\19\0-\1\0\0009\1\18\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\0\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0005\1 \0006\2\29\0009\2\30\0029\2\31\2B\2\1\0028\2\2\0=\2!\1L\1\2\0\1�\afg\1\0\0\tmode\afn\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bred\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=�\2\0\0\r\0\14\1&'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1�L\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\14�9\b\t\a9\b\n\b\15\0\b\0X\t\n�6\t\1\0009\t\v\t9\t\f\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2�9\t\r\aL\t\2\0E\6\3\3R\6�\127L\0\2\0\tname\nindex\afn\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp����\31\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\r\1\0\f\0\\\0�\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0004\5\0\0=\5\14\0044\5\0\0=\5\15\0044\5\0\0=\5\16\0044\5\0\0=\5\17\0044\5\0\0=\5\18\0044\5\0\0=\5\19\4=\4\20\0035\4\21\0004\5\0\0=\5\14\0044\5\0\0=\5\15\0044\5\0\0=\5\16\0044\5\0\0=\5\17\0044\5\0\0=\5\18\0044\5\0\0=\5\19\4=\4\22\0033\4\23\0003\5\24\0\18\6\4\0005\b\29\0003\t\25\0>\t\1\b5\t\27\0009\n\26\1=\n\28\t=\t\30\b5\t\31\0=\t \bB\6\2\1\18\6\4\0005\b#\0003\t!\0>\t\1\b3\t\"\0=\t\30\b5\t$\0=\t \bB\6\2\1\18\6\4\0005\b%\0009\t\5\2=\t&\bB\6\2\1\18\6\4\0005\b'\0009\t\5\2=\t&\b5\t)\0009\n(\1=\n\28\t=\t\30\bB\6\2\1\18\6\4\0005\b*\0B\6\2\1\18\6\4\0005\b+\0005\t,\0009\n\28\1=\n\28\t=\t\30\bB\6\2\1\18\6\4\0005\b-\0005\t.\0=\t/\b5\t0\0=\t1\b5\t4\0005\n3\0009\v2\1=\v\28\n=\n5\t5\n7\0009\v6\1=\v\28\n=\n8\t5\n:\0009\v9\1=\v\28\n=\n;\t=\t<\bB\6\2\1\18\6\4\0004\b\3\0003\t=\0>\t\1\bB\6\2\1\18\6\4\0005\b?\0003\t>\0>\t\1\b5\t@\0=\t\30\bB\6\2\1\18\6\5\0005\bA\0006\tB\0009\tC\t=\tD\b9\t\a\2=\t&\b5\tF\0009\nE\1=\n\28\t=\t\30\bB\6\2\1\18\6\5\0005\bG\0006\tB\0009\tC\t=\tD\b5\tH\0009\nE\1=\n\28\t=\t\30\bB\6\2\1\18\6\5\0005\bI\0005\tK\0009\nJ\1=\n\28\t=\t\30\bB\6\2\1\18\6\5\0005\bL\0005\tM\0=\t1\b5\tO\0005\nN\0009\vE\1=\v\28\n=\nP\t5\nR\0009\vQ\1=\v\28\n=\nS\t5\nT\0009\v2\1=\v\28\n=\nU\t=\tV\b9\t\a\2=\t&\bB\6\2\1\18\6\5\0005\bY\0003\tW\0>\t\1\b5\tX\0009\n\26\1=\n\28\t=\t\30\b5\tZ\0=\t \bB\6\2\0019\6[\0\18\b\3\0B\6\2\0012\0\0�K\0\1\0\nsetup\1\0\1\tleft\3\1\1\0\0\1\0\0\0\15diff_color\fremoved\1\0\0\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\1\0\3\fremoved\t \nadded\t \rmodified\n󰝤 \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\b\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\ngreen\bfmt\nupper\vstring\1\2\0\0\15o:encoding\1\0\2\afg\f#ffffff\bgui\tbold\1\0\1\ticon\r LSP:\0\0\22diagnostics_color\15color_info\1\0\0\tcyan\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\bred\fsymbols\1\0\3\twarn\t \tinfo\t \nerror\t \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\1\nright\3\1\1\0\0\0\0\fpadding\1\0\2\nright\3\1\tleft\3\0\ncolor\1\0\0\afg\1\0\0\tblue\0\0\0\22inactive_sections\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\1\0\3\ntreme\fonedark\23section_separators\5\25component_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\rdarkblue\f#081633\fmagenta\f#c678dd\tcyan\f#008080\tblue\f#51afef\vyellow\f#ECBE7B\bred\f#ec5f67\afg\f#bbc2cf\abg\f#202328\vviolet\f#a9a1e1\vorange\f#FF8800\ngreen\f#98be65\flualine\frequire\0" },
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    config = { "\27LJ\2\n0\0\1\2\0\2\0\a9\1\0\0\6\1\1\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\fnull-ls\tname`\1\0\4\1\b\0\v6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\1�\vfilter\0\nbufnr\1\0\1\nasync\2\vformat\bbuf\blsp\bvim�\1\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0�K\0\1\0\0\0\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\1\1\0\5\1\t\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\3B\1\2\0016\1\0\0'\3\6\0B\1\2\0029\1\2\0015\3\a\0004\4\0\0=\4\b\3B\1\2\1K\0\1\0\1�\rhandlers\1\0\0\18mason-null-ls\14on_attach\1\0\0\0\nsetup\fnull-ls\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/victor/.local/share/nvim/site/pack/packer/opt/mason-null-ls.nvim",
    url = "https://github.com/jay-babu/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { "\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\vwindow\rmappings\1\0\2\6h\15close_node\6l\topen\1\0\1\rposition\fcurrent\15filesystem\1\0\0\24follow_current_file\1\0\1\fenabled\2\1\0\2\16bind_to_cwd\1\27use_libuv_file_watcher\2\nsetup\rneo-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/victor/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\b\0\0\6c\blua\bvim\vvimdoc\nquery\15javascript\thtml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\t\0&\0,6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4$\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\6\b\0056\6\t\0009\6\n\0069\6\v\6=\6\v\0055\6\f\0=\6\r\0055\6\15\0005\a\14\0=\a\16\0065\a\17\0=\a\18\6=\6\19\0055\6\29\0005\a\21\0009\b\20\1=\b\22\a9\b\23\1=\b\24\a9\b\25\1=\b\26\a9\b\27\1=\b\28\a=\a\30\0065\a \0009\b\31\1=\b!\a=\a\"\6=\6#\5=\5%\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\6q\1\0\0\nclose\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<C-p>\23cycle_history_prev\n<C-n>\1\0\0\23cycle_history_next\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\vheight\4����\t����\3\19preview_cutoff\3x\nwidth\4����\3����\3\1\0\2\20prompt_position\btop\18preview_width\4����\t����\3\17path_display\1\2\0\0\rtruncate\18git_worktrees\6g\bvim\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\25file_ignore_patterns\1\0\3\20selection_caret\6>\18prompt_prefix\a> \21sorting_strategy\14ascending\1\a\0\0\21node%_modules/.*\15%lock.json\14%.venv/.*\fvenv/.*\fdist/.*\r%.git/.*\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\vstyles\1\0\2\rsidebars\16transparent\vfloats\16transparent\1\0\1\16transparent\2\nsetup\15tokyonight\frequire!colorscheme tokyonight-night\bcmd\bvim\0" },
    loaded = true,
    path = "/home/victor/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["transparent.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\22TransparentEnable\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/victor/.local/share/nvim/site/pack/packer/opt/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\b\0\0\6c\blua\bvim\vvimdoc\nquery\15javascript\thtml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rwinwidth\afn\bvim�\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\v�\21\2\1\0)\3\0\0\1\3\2\0X\2\4�\21\2\1\0\21\3\0\0\0\2\3\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b�\3\0\0\4\1\"\0E5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\16\1=\1\17\0-\1\0\0009\1\18\1=\1\19\0-\1\0\0009\1\18\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\0\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0005\1 \0006\2\29\0009\2\30\0029\2\31\2B\2\1\0028\2\2\0=\2!\1L\1\2\0\1�\afg\1\0\0\tmode\afn\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bred\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=�\2\0\0\r\0\14\1&'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1�L\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\14�9\b\t\a9\b\n\b\15\0\b\0X\t\n�6\t\1\0009\t\v\t9\t\f\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2�9\t\r\aL\t\2\0E\6\3\3R\6�\127L\0\2\0\tname\nindex\afn\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp����\31\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\r\1\0\f\0\\\0�\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0004\5\0\0=\5\14\0044\5\0\0=\5\15\0044\5\0\0=\5\16\0044\5\0\0=\5\17\0044\5\0\0=\5\18\0044\5\0\0=\5\19\4=\4\20\0035\4\21\0004\5\0\0=\5\14\0044\5\0\0=\5\15\0044\5\0\0=\5\16\0044\5\0\0=\5\17\0044\5\0\0=\5\18\0044\5\0\0=\5\19\4=\4\22\0033\4\23\0003\5\24\0\18\6\4\0005\b\29\0003\t\25\0>\t\1\b5\t\27\0009\n\26\1=\n\28\t=\t\30\b5\t\31\0=\t \bB\6\2\1\18\6\4\0005\b#\0003\t!\0>\t\1\b3\t\"\0=\t\30\b5\t$\0=\t \bB\6\2\1\18\6\4\0005\b%\0009\t\5\2=\t&\bB\6\2\1\18\6\4\0005\b'\0009\t\5\2=\t&\b5\t)\0009\n(\1=\n\28\t=\t\30\bB\6\2\1\18\6\4\0005\b*\0B\6\2\1\18\6\4\0005\b+\0005\t,\0009\n\28\1=\n\28\t=\t\30\bB\6\2\1\18\6\4\0005\b-\0005\t.\0=\t/\b5\t0\0=\t1\b5\t4\0005\n3\0009\v2\1=\v\28\n=\n5\t5\n7\0009\v6\1=\v\28\n=\n8\t5\n:\0009\v9\1=\v\28\n=\n;\t=\t<\bB\6\2\1\18\6\4\0004\b\3\0003\t=\0>\t\1\bB\6\2\1\18\6\4\0005\b?\0003\t>\0>\t\1\b5\t@\0=\t\30\bB\6\2\1\18\6\5\0005\bA\0006\tB\0009\tC\t=\tD\b9\t\a\2=\t&\b5\tF\0009\nE\1=\n\28\t=\t\30\bB\6\2\1\18\6\5\0005\bG\0006\tB\0009\tC\t=\tD\b5\tH\0009\nE\1=\n\28\t=\t\30\bB\6\2\1\18\6\5\0005\bI\0005\tK\0009\nJ\1=\n\28\t=\t\30\bB\6\2\1\18\6\5\0005\bL\0005\tM\0=\t1\b5\tO\0005\nN\0009\vE\1=\v\28\n=\nP\t5\nR\0009\vQ\1=\v\28\n=\nS\t5\nT\0009\v2\1=\v\28\n=\nU\t=\tV\b9\t\a\2=\t&\bB\6\2\1\18\6\5\0005\bY\0003\tW\0>\t\1\b5\tX\0009\n\26\1=\n\28\t=\t\30\b5\tZ\0=\t \bB\6\2\0019\6[\0\18\b\3\0B\6\2\0012\0\0�K\0\1\0\nsetup\1\0\1\tleft\3\1\1\0\0\1\0\0\0\15diff_color\fremoved\1\0\0\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\1\0\3\fremoved\t \nadded\t \rmodified\n󰝤 \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\b\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\ngreen\bfmt\nupper\vstring\1\2\0\0\15o:encoding\1\0\2\afg\f#ffffff\bgui\tbold\1\0\1\ticon\r LSP:\0\0\22diagnostics_color\15color_info\1\0\0\tcyan\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\bred\fsymbols\1\0\3\twarn\t \tinfo\t \nerror\t \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\1\nright\3\1\1\0\0\0\0\fpadding\1\0\2\nright\3\1\tleft\3\0\ncolor\1\0\0\afg\1\0\0\tblue\0\0\0\22inactive_sections\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\1\0\3\ntreme\fonedark\23section_separators\5\25component_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\rdarkblue\f#081633\fmagenta\f#c678dd\tcyan\f#008080\tblue\f#51afef\vyellow\f#ECBE7B\bred\f#ec5f67\afg\f#bbc2cf\abg\f#202328\vviolet\f#a9a1e1\vorange\f#FF8800\ngreen\f#98be65\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\vstyles\1\0\2\rsidebars\16transparent\vfloats\16transparent\1\0\1\16transparent\2\nsetup\15tokyonight\frequire!colorscheme tokyonight-night\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2�'\0\3\0002\0\a�6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0�L\0\2\0L\0\2\0\1�\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2�'\0\3\0002\0\a�6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0�L\0\2\0L\0\2\0\1�\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim�\2\1\1\b\0\20\0#6\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\4\0006\5\5\0'\a\6\0B\5\2\0029\5\a\0055\6\b\0=\0\t\6B\1\5\0016\1\n\0009\1\v\0019\1\6\0016\2\0\0009\2\1\0029\2\2\0025\4\f\0'\5\r\0003\6\14\0005\a\15\0=\0\t\aB\2\5\0016\2\0\0009\2\1\0029\2\2\0025\4\16\0'\5\17\0003\6\18\0005\a\19\0=\0\t\aB\2\5\0012\0\0�K\0\1\0\1\0\2\tdesc\26Jump to previous hunk\texpr\2\0\a[c\1\3\0\0\6n\6v\1\0\2\tdesc\22Jump to next hunk\texpr\2\0\a]c\1\3\0\0\6n\6v\vloaded\fpackage\vbuffer\1\0\1\tdesc\21Preview git hunk\17preview_hunk\rgitsigns\frequire\15<leader>hp\6n\bset\vkeymap\bvim�\2\1\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0023\3\18\0=\3\19\2B\0\2\1K\0\1\0\14on_attach\0\nsigns\1\0\0\14untracked\1\0\1\ttext\b┆\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\b‾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\b│\badd\1\0\0\1\0\1\ttext\b│\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\t\0&\0,6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4$\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\6\b\0056\6\t\0009\6\n\0069\6\v\6=\6\v\0055\6\f\0=\6\r\0055\6\15\0005\a\14\0=\a\16\0065\a\17\0=\a\18\6=\6\19\0055\6\29\0005\a\21\0009\b\20\1=\b\22\a9\b\23\1=\b\24\a9\b\25\1=\b\26\a9\b\27\1=\b\28\a=\a\30\0065\a \0009\b\31\1=\b!\a=\a\"\6=\6#\5=\5%\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\6q\1\0\0\nclose\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<C-p>\23cycle_history_prev\n<C-n>\1\0\0\23cycle_history_next\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\vheight\4����\t����\3\19preview_cutoff\3x\nwidth\4����\3����\3\1\0\2\20prompt_position\btop\18preview_width\4����\t����\3\17path_display\1\2\0\0\rtruncate\18git_worktrees\6g\bvim\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\25file_ignore_patterns\1\0\3\20selection_caret\6>\18prompt_prefix\a> \21sorting_strategy\14ascending\1\a\0\0\21node%_modules/.*\15%lock.json\14%.venv/.*\fvenv/.*\fdist/.*\r%.git/.*\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Neotree', function(cmdargs)
          require('packer.load')({'neo-tree.nvim'}, { cmd = 'Neotree', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neo-tree.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neotree ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'neo-tree.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'mason-null-ls.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'transparent.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'codeium.vim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'mason-null-ls.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end