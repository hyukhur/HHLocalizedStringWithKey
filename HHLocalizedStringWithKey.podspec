Pod::Spec.new do |s|
  s.name         = "HHLocalizedStringWithKey"
  s.version      = "0.1.0"
  s.summary      = "this store the localizing key in the localized String."

  s.description  = <<-DESC
Localized String is loaded in the bundle. It lost meta data localizing key. this lib store the key in the localized String.
DESC

  s.homepage     = "https://github.com/hyukhur/HHLocalizedStringWithKey"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Hyuk Hur" => "hyukhur@gmail.com" }
  s.social_media_url   = "http://twitter.com/HyukHur"
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/hyukhur/HHLocalizedStringWithKey.git", :tag => s.version.to_s }
  s.source_files  = "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true
end
