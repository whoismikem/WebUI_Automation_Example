require 'selenium-webdriver'
require_relative 'app'

$LIFE_INSURANCE_APP = App.new

Before do
	$browser = Selenium::WebDriver.for :firefox
	$browser.get "https://www.aaalife.com/term-life-insurance-quote-input"
end

After do 
	$browser.quit
end


