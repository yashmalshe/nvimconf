return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'onedark',
        transparent = true,
      }
    })
  end
}
