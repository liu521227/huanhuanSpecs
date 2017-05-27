Pod::Spec.new do |s|
  s.name             = "huanhuanSpecs"
  s.version          = "1.0.0"
  s.summary          = "pod测试"
  s.homepage         = "https://github.com/liu521227/huanhuanSpecs.git"
  s.license          = 'MIT'
  s.author           = { "liu521227" => "877328049@qq.com" }
  s.source           = { :git => "https://github.com/liu521227/huanhuanSpecs.git", :tag => s.version.to_s }
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.frameworks = 'UIKit', 'CoreText'
end