-- Load the Chill color scheme
-- Check if the module is already loaded, which means a user has configured it
if not package.loaded["chill"] or not require("chill")._config then
  -- First time loading, use defaults
  require("chill").setup()
end

-- Load the theme with current configuration
require("chill").load()
