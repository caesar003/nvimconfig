return {
  {
    "caesar003/vim-snip",
    config = function()
      -- HTML shortcuts
      vim.cmd("cnoreabbrev htmlb Snip boilerplate")
      vim.cmd("cnoreabbrev img Snip image")
      vim.cmd("cnoreabbrev ol Snip ordered-list")
      vim.cmd("cnoreabbrev ul Snip unordered-list")

      -- JavaScript shortcuts (can be used in js/jsx/ts/tsx files)
      vim.cmd("cnoreabbrev af Snip arrow")
      vim.cmd("cnoreabbrev clg Snip console-log")
      vim.cmd("cnoreabbrev ifel Snip if-else")
      vim.cmd("cnoreabbrev rafce Snip react-arrow-function-component-export")
      vim.cmd("cnoreabbrev rafc Snip react-arrow-function-component")
      vim.cmd("cnoreabbrev rfce Snip react-functional-component-export")
      vim.cmd("cnoreabbrev rfc Snip react-functional-component")
      vim.cmd("cnoreabbrev switch Snip switch")
      vim.cmd("cnoreabbrev tcf Snip try-catch-finally")
      vim.cmd("cnoreabbrev tc Snip try-catch")
      vim.cmd("cnoreabbrev effec Snip use-effect")
      vim.cmd("cnoreabbrev selec Snip use-selector")
      vim.cmd("cnoreabbrev state Snip use-state")
    end,
  },
}
