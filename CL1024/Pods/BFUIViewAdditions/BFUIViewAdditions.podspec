Pod::Spec.new do |s|
  s.name             = "BFUIViewAdditions"
  s.version          = "0.1.0"
  s.summary          = "Shortcuts"
  s.description      = "Shortcuts for UIView frame properties" 
  s.homepage         = "https://github.com/bicyclefactory/BFUIViewAdditions"
  s.license          = "MIT"
  s.author           = { "Evgeniy Suvorov" => "kokax@mail.ru" }
  s.source           = { :git => "https://github.com/bicyclefactory/BFUIViewAdditions.git", :tag => s.version.to_s }
  s.platform     = :ios, "5.0"
  s.source_files = "**/*"
  s.frameworks = "UIKit"
end
