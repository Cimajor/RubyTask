$commonKey = 'Ruby'

class Common_steps
  def checkFindFreelancers (driver, selector1, selector2, selector3, selector4)
    puts "i'm in"
    selector1 = selector1
    selector2 = selector2
    selector3 = selector3
    selector4 = selector4

    elements = driver.find_elements(:xpath, selector1)
    elements1 = driver.find_elements(:xpath, selector2)
    elements2 = driver.find_elements(:xpath, selector3)
    elements3 = driver.find_elements(:xpath, selector4)

    $array = Array.new
# elements.collect {|element| array puts element}

    elements.each {|element| $array.push element.attribute("innerHTML")}
    elements1.each_with_index {|arrayElement, index| $array[index] += arrayElement.attribute("innerHTML")}
    elements2.each_with_index {|arrayElement, index| $array[index] += arrayElement.attribute("innerHTML")}
    print $array
#    elements3.each_with_index {|arrayElement, index| array[index] += arrayElement.attribute("innerHTML")}
    print "Items on page contains keyword\n"
    $array.each do |item|
      print item.include? $commonKey
      print "\n"
    end
  end

  def isInclude (element1, element2)
    print "\n is name the same? "
    print "teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest\n"
    print $array[0].chomp
    print element1
    print "teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest\n"

    print "\n is summery the same? "
    print $array[0].tr("\n","").strip.include?(element1)
    print $array[0].tr("\n","").strip.include?(element2)
    #print "\n is description the same? "
    #print $array[0].include? element3
  end

  def randomSleep
    sleep rand(1..5)
  end

end