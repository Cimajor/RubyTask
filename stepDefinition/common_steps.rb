$commonKey = 'Ruby'

class Common_steps
  def checkFindFreelancers (driver, name, summery, description)


    name = driver.find_elements(:xpath, name)
    summery = driver.find_elements(:xpath, summery)
    description = driver.find_elements(:xpath, description)

    $array = Array.new

    name.each do |element|
      hash = {:name => element.attribute("innerHTML").strip.tr("\n", "")}
      $array.push hash
    end

    summery.each_with_index do |arrayElement, index|
      $array[index][:summery] = arrayElement.attribute("innerHTML").strip.tr("\n", "")
    end

    description.each_with_index do |arrayElement, index|
      $array[index][:description] = arrayElement.attribute("innerHTML").strip.tr("\n", "")
    end

    #name = $array[0].fetch(:name)
    #elementsSkills = driver.find_elements(:xpath, '//section[contains(@class,"air-card-hover") and descendant::*[contains(.,"'+name+'")]]//span[contains(@class,"o-tag-skill")]')


    $array.each_with_index do |arrayElement, index|
      $array[index][:skills] = ""
      name = arrayElement.fetch(:name)
      profileSkillsLocator = '//section[contains(@class,"air-card-hover") and descendant::*[contains(.,"' + name + '")]]//*[contains(@data-log-label,"skill pill")]'
      skills = driver.find_elements(:xpath, profileSkillsLocator)


      skills.each {|element|
        value = $array[index].fetch(:skills)
        value += element.attribute("innerHTML").strip.tr("\n", "")
        $array[index][:skills] = value
      }
    end

    print "Items on page contains keyword?\n"
    $array.each do |item|
      print item.fetch(:name)
      if (item.fetch(:description).include? $commonKey) || (item.fetch(:summery).include? $commonKey) || (item.fetch(:skills).include? $commonKey)
        print " contains keyword\n"
      else
        print "are not contain the key\n"
      end
      print "\n"
    end
  end

  def checkProfileData (driver, userNumber)
    print "\n is name the same? = "
    print driver.find_element(:xpath, $gridUserProfileName).attribute("innerHTML").tr("\n", "").strip.include? $array[userNumber].fetch(:name)
    print "\n is summery the same? = "
    print driver.find_element(:xpath, $gridUserProfileSummery).attribute("innerHTML").tr("\n", "").strip.include? $array[userNumber].fetch(:summery)
    print "\n is description the same? = "
    print driver.find_element(:xpath, $gridUserProfileDescription).attribute("innerHTML").tr("\n", "").strip.include? $array[userNumber].fetch(:description).strip.tr("\n", "")
  end

  def randomSleep
    sleep rand(1..5)
  end

end