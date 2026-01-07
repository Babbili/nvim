return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true, -- Show hidden/dotfiles
          },
          explorer = {
            actions = {
              netrw_confirm = function(picker, item, action)
                local Actions = require("snacks.picker.source.explorer").actions
                if item.parent_dir then
                  picker:action("explorer_up")
                else
                  Actions.confirm(picker, item, action)
                end
              end,
            },
            win = {
              input = {
                keys = {
                  ["<CR>"] = { "netrw_confirm", mode = { "i", "n" } },
                },
              },
              list = {
                keys = {
                  ["<CR>"] = "netrw_confirm",
                },
              },
            },
            finder = function(opts, ctx)
              local ret = require("snacks.picker.source.explorer").explorer(opts, ctx)
              local cwd = ctx.picker:cwd()
              local dirname = vim.fs.dirname(cwd)
              return function(cb)
                if dirname ~= cwd then
                  cb({
                    file = dirname,
                    dir = true,
                    text = "../ " .. dirname,
                    parent_dir = true,
                  })
                end
                ret(function(item)
                  if item.file == cwd then
                    item.current_dir = true
                  end
                  cb(item)
                end)
              end
            end,
            format = function(item, picker)
              local fmt = Snacks.picker.format.file(item, picker)
              -- stylua: ignore
              if item.parent_dir then fmt[2][1] = "../" end
              -- stylua: ignore
              if item.current_dir then fmt[2][1] = "./" end
              return fmt
            end,
          },
        },
      },
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[


███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  @Babbili
  ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
