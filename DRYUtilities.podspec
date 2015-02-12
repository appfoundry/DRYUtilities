#
# Be sure to run `pod lib lint DRYUtilities.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DRYUtilities"
  s.version          = "1.0.6"
  s.summary          = "DRYUtilities provides common utilities used in projects by AppFoundry"
  s.homepage         = "https://github.com/appfoundry/DRYUtilities"
  s.license          = 'MIT'
  s.author           = { "Michael Seghers" => "michael.seghers@appfoundry.be" }
  s.source           = { :git => "https://github.com/appfoundry/DRYUtilities.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DRYUtilities' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation'
  s.weak_frameworks = 'UIKit', 'CoreData'
end
