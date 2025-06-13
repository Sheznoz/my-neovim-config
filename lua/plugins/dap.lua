return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
      },
    }

    -- STEP 2: Define how to run C++ debugging
    dap.configurations.cpp = {
      {
        name = "Launch executable",
        type = "codelldb", -- Matches the adapter name above
        request = "launch", -- Launch, not attach
        program = function()
          -- Asks you what file to debug
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}", -- Current working directory
        stopOnEntry = false, -- Start without pausing
        args = {}, -- Arguments to your program
      },
    }

    -- Optional: Make this also work for .c files
    dap.configurations.c = dap.configurations.cpp
  end,
}
