return {
  {
    "saghen/blink.cmp",
    debug = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "xzbdmw/colorful-menu.nvim",
      "moyiz/blink-emoji.nvim",
      { "L3MON4D3/LuaSnip",   version = "2.*" },
      { "folke/lazydev.nvim", build = ":LazyDev", ft = "lua", opts = {} },
    },
    build = "cargo +nightly build --release",
    opts = {
      appearance = {
        nerd_font_variant = "normal",
      },
      fuzzy = {
        implementation = "prefer_rust",
        prebuilt_binaries = {
          ignore_version_mismatch = true,
        },
      },
      snippets = { preset = "luasnip" },
      completion = {
        accept = { auto_brackets = { enabled = false } },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
        menu = {
          border = "rounded",
          direction_priority = function()
            local ctx = require("blink.cmp").get_context()
            local item = require("blink.cmp").get_selected_item()
            if ctx == nil or item == nil then
              return { "s", "n" }
            end

            local item_text = item.textEdit ~= nil and item.textEdit.newText
                or item.insertText
                or item.label
            local is_multi_line = item_text:find("\n") ~= nil
            if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
              vim.g.blink_cmp_upwards_ctx_id = ctx.id
              return { "n", "s" }
            end
            return { "s", "n" }
          end,
          draw = {
            padding = { 0, 1 },
            components = {
              kind_icon = {
                text = function(ctx)
                  return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
                end,
              },
            },
            columns = {
              { "kind_icon" },
              { "label",    gap = 1 },
              components = {
                label = {
                  text = function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                  end,
                  highlight = function(ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                  end,
                },
              },
            },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "default",
        ["<Esc>"] = { "hide", "fallback" },
        ["<cr>"] = { "accept", "fallback" },
      },
      signature = {
        enabled = true,
      },
      sources = {
        default = {
          "lazydev",
          "lsp",
          "path",
          "snippets",
          "buffer",
          "emoji",
        },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            score_offset = 100,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 95,
          },
          buffer = {
            name = "buffer",
            max_items = 3,
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 4,
            score_offset = 50,
          },
          path = {
            name = "path",
            module = "blink.cmp.sources.path",
            score_offset = 3,
            fallbacks = { "snippets", "buffer" },
            opts = {
              trailing_slash = true,
              label_trailing_slash = true,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            opts = {
              insert = true,
              trigger = function()
                return { ":" }
              end,
            },
          },
          snippets = {
            name = "snippets",
            score_offset = 90,
          },
        },
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    priority = 51,
  },
}
