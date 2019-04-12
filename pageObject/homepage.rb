
String $header = '//div[contains(@class,"navbar-collapse d-none d-lg-flex")]'
String $inputFindFreelancers = $header + '//input[contains(@class,("form-control"))]'
String $btnSearchConfirm = $header + '//button[contains(@class,"btn p-0-left-right")]'


class Home_page
  def inputFindFreelancers
    puts $header
  end
end

