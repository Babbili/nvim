-- ~/.config/nvim/lua/plugins/blink-cmp.lua
return {
  "saghen/blink.cmp", -- the exact repo name used by LazyVim
  -- The `opts` function receives the default options and lets us modify them.
  opts = function(_, opts)
    ----------------------------------------------------------------------
    -- 1️⃣  Turn off the automatic popup
    ----------------------------------------------------------------------
    -- Blink uses the same flag name as nvim‑cmp: `autocomplete`.
    -- Setting it to `false` disables the timer‑based trigger.
    opts.autocomplete = false

    ----------------------------------------------------------------------
    -- 2️⃣  Define a manual‑trigger key (feel free to pick another combo)
    ----------------------------------------------------------------------
    -- local cmp = require("blink.cmp")
    -- opts.keymap = vim.tbl_extend("force", opts.keymap or {}, {
    -- <C‑Space> will now open the completion menu on demand
    -- ["<C-Space>"] = cmp.mapping.complete(),
    -- Keep the usual <CR> behaviour (accept only the selected item)
    -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
    -- })

    ----------------------------------------------------------------------
    -- 3️⃣  (Optional) If you also use an AI‑assistant like Copilot or Codeium,
    --     you probably want to silence its *inline* ghost‑text, otherwise you
    --    ’ll still see suggestions appear as you type.
    ----------------------------------------------------------------------
    -- Example for Copilot (adjust if you use a different plugin):
    -- vim.g.copilot_no_tab_map = true
    -- vim.g.copilot_filetypes = {}

    return opts
  end,
}
