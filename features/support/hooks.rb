# Capybara.app_host = "http://google.com"
# Capybara.default_driver = :selenium
# Capybara.default_wait_time = 10


at_exit do
	# Copy This Block for EACH testuser-email
	# mage_app_host = "#{Capybara.app_host}"
	# MagentoAPI::cancel_test_orders("exampleuser@example.com","API_USERNAME","API_PASSWORD",mage_app_host)
end



After do |scenario|
  # begin
  #   file = File.open("output/log.xml", "a")
  #   file.write("<scenario name=\"#{scenario.feature.title} - #{scenario.title}\">" << "\n")
  #   file.write("  <date>#{Time.new.inspect}</date>" << "\n")
  #   file.write("  <status>#{scenario.status}</status>" << "\n")
  #   scenario.steps.each do |step|
  #     file.write("  <step name=\"#{step.name}\">" << "\n")
  #     file.write("    <status>#{step.status}</status>" << "\n")
  #     file.write("  </step>" << "\n")
  #   end
    
  #   file.write("</scenario>" << "\n")
  # rescue IOError => e
  #   #some error occur, dir not writable etc.
  # ensure
  #   file.close unless file == nil
  # end

  # begin
  #   file = File.open("output/methods.txt", "w")
  #   file.write("#{scenario.methods}" << "\n\n")

  #   scenario.methods.each do |method|
  #     file.write("#{method.to_s}" << "\n")
  #     file.write("  #{method.methods}" << "\n")
  #   end

  # rescue IOError => e
  #   #some error occur, dir not writable etc.
  # ensure
  #   file.close unless file == nil
  # end
end