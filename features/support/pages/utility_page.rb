
module UtilityPage

	# wait methods
	def wait_for(element_id, timeout: 10)
	  wait = Selenium::WebDriver::Wait.new(timeout: timeout)
	  wait.until { find_element(element_id) }
	end

	def wait_for_element_visible(element_id, timeout: 10)
	  wait = Selenium::WebDriver::Wait.new(timeout: timeout)
	  wait.until { find_element(element_id).displayed? }
	end
	# ---

	# find methods
	def find_element(finder)
		UIDriver.browser.find_element finder
	end

end