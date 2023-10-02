return {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = {'Neotree'},
    event = "VimEnter", -- loads neotree when use "vim ."
    config = function()
        require('neo-tree').setup({
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            window = {
                position = "current",
                mappings = {
                    ["h"] = "close_node",
                    ["l"] = "open",
                },
            }})
    end
}
