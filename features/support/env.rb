require 'selenium-webdriver'
require_relative 'app'

class UIDriver
  def self.setup(driver)
    @@browser = driver
  end

  def self.browser
    @@browser
  end

  def self.kill
    @@browser.quit
    @@browser = nil
  end
end

Before do
  browser = Selenium::WebDriver.for :firefox
  UIDriver.setup browser
  UIDriver.browser.get "https://www.aaalife.com/term-life-insurance-quote-input" # TODO: Make passing of URL possible
end

After do
  UIDriver.kill
end