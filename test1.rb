require "selenium-webdriver"
#require 'nokogiri'
require_relative 'stepDefinition/common_steps'
require_relative 'pageObject/homepage'
require_relative 'pageObject/searchPage'
require_relative 'pageObject/profilepage'

homepage = Home_page.new
common_steps = Common_steps.new


#Open home page
driver = Selenium::WebDriver.for :firefox
driver.manage.delete_all_cookies
driver.manage.timeouts.implicit_wait = 60
driver.manage.window.resize_to(1800, 1000)
driver.get 'https://www.upwork.com/'


# Focus onto "Find freelancers"
freelanceSearchField = driver.find_element(:xpath, $inputFindFreelancers)

freelanceSearchField.send_key($commonKey)
common_steps.randomSleep
driver.find_element(:xpath, $btnSearchConfirm).click
common_steps.randomSleep

# check search results is appear
driver.find_element(:xpath, $searchFieldFreelance).displayed? #check new search field is appear
driver.find_element(:id, $searchResultsGridID).displayed? #check search page grid is appear

# Parse the 1st page with search results: store info given on the 1st page of search results as structured data of any chosen by you type (i.e. hash of hashes or array of hashes, whatever structure handy to be parsed).
# Make sure at least one attribute (title, overview, skills, etc) of each item (found freelancer) from parsed search results contains `<keyword>` Log in stdout which freelancers and attributes contain `<keyword>` and which do not.
common_steps.checkFindFreelancers(driver, $searchResultTitle, $searchResultsSummery, $searchResultsDescription)

# Click on random freelancer's title
# Get into that freelancer's profile
driver.find_element(:xpath, $searchResultTitle).click #click on first profile


#10. Check that each attribute value is equal to one of those stored in the structure created in #67
#userName = driver.find_element(:xpath, $gridUserProfileName).attribute("innerHTML")
#userSummery = driver.find_element(:xpath, $gridUserProfileSummery).attribute("innerHTML")
#userDescription = driver.find_element(:xpath, $gridUserProfileDescription).attribute("innerHTML")
#userDescription = userDescription.slice(0..40)
numberOfUser = 0 #Checking data for 0 user
common_steps.checkProfileData(driver, numberOfUser)

#11. Check whether at least one attribute contains `<keyword>`
print "\nis profile include keyword? "
print driver.find_element(:xpath, $gridAllUserProfile).attribute("innerHTML").include?($commonKey) #check keyword is present on profile



#store all information from search results page








