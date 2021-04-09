#
# Be sure to run `pod lib lint BankStatementLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BankStatementLibrary'
  s.version          = '1.0.6'
  s.summary          = 'A short description of BankStatementLibrary.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LeandroGitHung/BankStatementLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LeandroGitHung' => 'leandro_lee@yahoo.com.br' }
  s.source           = { :git => 'https://github.com/LeandroGitHung/BankStatementLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'BankStatementLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BankStatementLibrary' => ['BankStatementLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'RxSwift', '6.1.0'
  s.dependency 'RxCocoa', '6.1.0'
  # s.dependency 'RxRelay, '6.1.0'
  s.dependency 'RxAlamofire', '6.1.1'
  s.dependency 'ModelsLibrary'
  s.dependency 'WorkersLibrary'
  s.dependency 'ServicesLibrary'
end
