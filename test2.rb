require "selenium-webdriver"
#require 'nokogiri'
require_relative 'stepDefinition/common_steps'
require_relative 'pageObject/homepage'
require_relative 'pageObject/searchPage'

homepage = Home_page.new


#Open home page
driver = Selenium::WebDriver.for :chrome
driver.manage.delete_all_cookies
driver.manage.timeouts.implicit_wait = 60
driver.manage.window.resize_to(1800, 1000)
driver.get 'https://stackoverflow.com/questions/7263824/get-html-source-of-webelement-in-selenium-webdriver-using-python'


elements = driver.find_elements(:xpath, '//span[contains(@class,"typ")]')
elements1 = driver.find_elements(:xpath, '//a[contains(@class," js-gps-track nav-links--link")]')

counter = 0
array = Array.new
# elements.collect {|element| array puts element}

elements.each {|element| array.push element.attribute("innerHTML")
}
print array
elements1.each_with_index {|arrayElement, index| array[index] += arrayElement.attribute("innerHTML")
}
print "\n"
print array

# while counter < elements.length
#
#
#   h = {counter => elements[counter].attribute("innerHTML")}
#   array[counter] = h
#   print array[counter]
#   counter += 1
# end
#
# counter = 0
# while counter < elements1.length
#   newvalue = elements1[counter].attribute("innerHTML")
#   print newvalue
#   print elements1.length
#
#   array[counter][counter] = array[counter][counter] + newvalue
#   print array[counter]
#   counter += 1
# end


