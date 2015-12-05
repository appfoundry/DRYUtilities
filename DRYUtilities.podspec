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
  s.version          = "1.5.1"
  s.summary          = "DRYUtilities provides common utilities used in projects by AppFoundry"
  s.homepage         = "https://github.com/appfoundry/DRYUtilities"
  s.license          = 'MIT'
  s.author           = { "Michael Seghers" => "mike.seghers@appfoundry.be" }
  s.source           = { :git => "https://github.com/appfoundry/DRYUtilities.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AppFoundryBE'

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  
  s.subspec 'Configuration' do |ss|
    ss.source_files = 'Pod/Classes/Configuration/**/*'
  end

  s.subspec 'CoreData' do |ss|
    ss.source_files = 'Pod/Classes/CoreData/**/*'
    ss.weak_framework = 'CoreData'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'Pod/Classes/Foundation/**/*'
  end

  s.subspec 'Networking' do |ss|
    ss.source_files = 'Pod/Classes/Networking/**/*'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'Pod/Classes/Security/**/*'
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'Pod/Classes/UIKit/**/*'
    ss.weak_framework = 'UIKit'
  end

  s.resource_bundles = {
    'DRYUtilities' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation'
end
