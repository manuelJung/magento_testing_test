
require 'capybara/cucumber'
require 'capybara/rspec'

# Use css3 as default selector
Capybara.default_selector = :css

# Tells Capybara that we are running aginst a remote server
Capybara.run_server = false

# Use Selenium as default driver
Capybara.default_driver = :sauce

# Run all scenarios / features tagged with "@selenium" on sauce platform
Capybara.javascript_driver = :selenium

# Waittime for find()
Capybara.default_wait_time = 30






