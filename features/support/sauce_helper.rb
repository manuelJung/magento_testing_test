# Use Capybara integration
require "sauce"
require 'sauce/capybara'
require "sauce/cucumber"

Capybara.default_driver = :sauce

# Set up configuration
Sauce.config do |config|
	# Open a tunnel for testing on local machine (might be slow)
	config[:start_tunnel] = false

	# Configure OnDemand Platform(s)
	config[:browsers] = [
		["Windows 7", "Firefox", "26"],
		#["Windows 8", "Internet Explorer", "10"]
	]
end
