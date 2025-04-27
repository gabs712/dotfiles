local preferred_files = {
  'index.js',
  'main.js',
  'server.js',
  'app.js',
  'src/index.js',
  'src/main.js',
  'src/server.js',
  'src/app.js',
}

local dap = require('dap')

for _, adapterType in ipairs({ 'node', 'chrome', 'msedge' }) do
  local pwaType = 'pwa-' .. adapterType

  dap.adapters[pwaType] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
      command = 'node',
      args = {
        vim.fs.normalize(vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'),
        '${port}',
      },
    },
  }

  -- Handle local configurations which specify type whithout 'pwa-' as prefix
  dap.adapters[adapterType] = function(cb, config)
    local nativeAdapter = dap.adapters[pwaType]

    config.type = pwaType

    if type(nativeAdapter) == 'function' then
      nativeAdapter(cb, config)
    else
      cb(nativeAdapter)
    end
  end
end

local find_preferred_file = require('custom.debugger.find-preferred-file')
for _, language in ipairs({ 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' }) do
  dap.configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch with Node',
      program = function()
        return find_preferred_file(preferred_files)
      end,
      runtimeArgs = { '--inspect', '--watch' }, -- 'inspect' also allows the browser to open the debugger
      cwd = '${workspaceFolder}',
    },
    {
      type = 'pwa-chrome',
      request = 'launch',
      name = 'Launch Chrome',
      url = require('custom.debugger.enter-launch-url'),
      webRoot = '${workspaceFolder}',
      sourceMaps = true,
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach to Node process',
      processId = function()
        return require('dap.utils').pick_process({ filter = 'node%s+%-%-inspect' })
      end,
      cwd = '${workspaceFolder}',
      restart = true, -- Restart when saving while active instead of disconnecting
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Node with ts-node/register',
      program = function()
        return find_preferred_file({})
      end,
      cwd = '${workspaceFolder}',
      runtimeArgs = { '-r', 'ts-node/register' },
    },
    {
      type = 'pwa-msedge',
      request = 'launch',
      name = 'Launch Edge',
      url = require('custom.debugger.enter-launch-url'),
      webRoot = '${workspaceFolder}',
      sourceMaps = true,
    },
  }
end
