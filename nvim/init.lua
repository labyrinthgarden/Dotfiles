-- =============================================================================
-- Configuración básica de Neovim
-- =============================================================================
-- Opciones de indentación
vim.opt.expandtab = true      -- Usar espacios en lugar de tabs
vim.opt.tabstop = 2           -- 1 tab = 2 espacios
vim.opt.softtabstop = 2       -- Espacios al presionar <Tab> o <BS>
vim.opt.shiftwidth = 2        -- Tamaño de indentación automática

-- Números de línea
vim.opt.number = true         -- Muestra números de línea absolutos
vim.opt.relativenumber = true -- Números relativos (útil para moverse con comandos como 5j)

-- Transparencia del fondo (para terminales compatibles)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })       -- Ventanas no activas
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })     -- Columna de signos
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })         -- Números de línea
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })         -- Texto plegado
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })    -- Final del buffer (~)

-- Atajos de teclado (leader key)
vim.g.mapleader = " "         -- Tecla líder (para shortcuts personalizados)
vim.g.maplocalleader = "\\"   -- Tecla líder local (para plugins)

-- =============================================================================
-- Configuración de Lazy.nvim (gestor de plugins)
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Instalar Lazy.nvim si no está presente
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Plugins y sus configuraciones
-- =============================================================================
require("lazy").setup({
  -- Tema de colores
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({  -- <-- Faltaba llamar a require().setup()
        transparent_background = true,
        term_colors = true,
        integrations = {
	  telescope = true,
  	  neotree = true
        }
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Neo-tree (explorador de archivos)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
      { "<C-b>", ":Neotree toggle<CR>", desc = "Toggle NeoTree" },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- Telescope (búsqueda avanzada)
	{
	  "nvim-telescope/telescope.nvim",
	  branch = "0.1.x",
	  dependencies = {
	    "nvim-lua/plenary.nvim",
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    -- Primero cargar y configurar telescope
	    require('telescope').setup({
	      defaults = {
		file_ignore_patterns = { "node_modules", ".git" },
	      },
	    })

	    -- Luego obtener la referencia a builtin
	    local builtin = require('telescope.builtin')
	    
	    -- Configurar atajos
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
	    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
	  end,
	},
}, {
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

-- =============================================================================
-- Atajos de teclado adicionales
-- =============================================================================
-- Ejemplo adicional (opcional):
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit current window" })
