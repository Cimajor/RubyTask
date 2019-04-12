require "selenium-webdriver"
#require 'nokogiri'
require_relative 'stepDefinition/common_steps'
require_relative 'pageObject/homepage'
require_relative 'pageObject/searchPage'

common_steps = Common_steps.new


#Open home page
driver = Selenium::WebDriver.for :chrome
puts "wtf 1"
#driver.manage.delete_all_cookies
driver.manage.timeouts.implicit_wait = 60
puts "wtf2"
driver.manage.window.resize_to(1800, 1000)
puts "wtf3"
driver.get 'D:\1.html'
puts "check 1"
common_steps.checkFindFreelancers(driver, $searchResultTitle, $searchResultsSummery, $searchResultsDescription, $searchResultsSkills)








