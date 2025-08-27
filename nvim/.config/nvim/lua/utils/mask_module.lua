--- @param module string
--- @param setup function
-- Prevent module from being required by plugin, usefull for lazy loading
return function(module, setup)
  -- Save the original module references
  local orig_loaded = package.loaded[module]
  local orig_preload = package.preload[module]

  -- Mask module
  package.loaded[module] = nil
  package.preload[module] = function()
    error('module is disabled during setup')
  end

  -- Call the plugin's setup (it will think module is not installed)
  setup()

  -- Restore module
  package.loaded['telescope'] = orig_loaded
  package.preload['telescope'] = orig_preload
end
