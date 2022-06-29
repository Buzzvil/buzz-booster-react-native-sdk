#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint buzz_booster.podspec` to validate before publishing.
#
folly_version = '2021.06.28.00-v2'
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
    s.name             = 'buzz-booster'
    s.version          = '0.0.1'
    s.summary          = 'BuzzBooster SDK'
    s.description      = <<-DESC
  A new Flutter plugin project.
                         DESC
    s.homepage         = 'http://buzzvil.io'
    s.license          = { :file => '../LICENSE' }
    s.author           = { 'Buzzvil' => 'damon.gong@buzzvil.com' }
    s.source           = { :path => '.' }
    s.compiler_flags  = folly_compiler_flags

    s.source_files = '*'
    s.public_header_files = '*'

    s.dependency "React-Core"
    s.dependency "React-RCTFabric" # This is for fabric component
    s.dependency "React-Codegen"
    s.dependency "RCT-Folly", folly_version
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "ReactCommon/turbomodule/core"
    s.dependency 'BuzzBooster', '1.4.0'
    s.platform = :ios, '10.0'
  
    s.pod_target_xcconfig    = {
        "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\""
    }
    # s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 arm64' }
  end