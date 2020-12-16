#
# Be sure to run `pod lib lint CWCommonTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CWCommonTools'
  s.version          = '1.0.4'
  s.summary          = 'CWCommonTools,便捷的UI开发和高频使用工具。一行代码生成控件，根据数据处理、文件管理、多媒体管理、权限管理、系统信息、Appstore操作、加密解密、快捷宏定义等几种不同的类型封装，Easy UI development and high frequency tools. A line of code to generate controls, according to data processing, file management, multimedia management, authority management, system information, Appstore operations, encryption and decryption, shortcut macro definition and several different types of encapsulation'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ycw001/CWCommonTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ycw001' => 'mikasa_ycw@yeah.net' }
  s.source           = { :git => 'https://github.com/ycw001/CWCommonTools.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.jianshu.com/u/ec0d527d39ce'

  s.ios.deployment_target = '9.0'

  s.source_files = 'CWCommonTools/Classes/**/*'
  
  s.requires_arc = true
  
  s.resource_bundles = {
      'CWCommonTools' => ['CWCommonTools/Assets/*.xcassets']
  }
  
  s.subspec 'Category' do |ss|
      ss.source_files = 'CWCommonTools/Classes/Category/*.{h,m}'
  end

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit', 'Foundation'
  s.dependency 'SDWebImage'
end
