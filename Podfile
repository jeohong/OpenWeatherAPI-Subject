# Uncomment the next line to define a global platform for your project
# platform :ios, '15.0'

target 'AutocryptSubject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AutocryptSubject

  # Network
  pod 'Alamofire', '5.6.4'

  # RxSwift
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'

  # AutoLayout
  pod 'SnapKit', '5.6.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
end