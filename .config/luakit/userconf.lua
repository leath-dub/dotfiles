local settings = require "settings"

settings.window.home_page = "https://searx.tiekoetter.com"
settings.window.new_tab_page = "https://searx.tiekoetter.com"

local downloads = require "downloads"
downloads.default_dir = os.getenv("HOME") .. "/tmp/dl"

return settings, downloads
