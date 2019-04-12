$gridAllUserProfile = '//div[contains(@id,"optimizely-header-container-default")]'

$gridUserProfile = $gridAllUserProfile + '//descendant::*'
$gridUserProfileName = $gridAllUserProfile + '//span[contains(@itemprop,"name") and ancestor::*[contains(@class,"m-xs-bottom")]]'
$gridUserProfileSummery = $gridAllUserProfile + '//span[contains(@class,"up-active-context") and ancestor::*[contains(@class,"overlay-container")]]'
$gridUserProfileDescription = $gridAllUserProfile + '//span[contains(@ng-show,"!open") and ancestor::*[contains(@class,"d-none")]]'
